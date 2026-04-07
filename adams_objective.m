function peak_force = adams_objective(x, work_dir, adams_bat, model_name, ...
                                       cmd_template, result_file, ...
                                       sim_end_time, sim_num_steps)
% ADAMS_OBJECTIVE  目标函数: 调用 Adams 仿真并返回峰值手柄力
%
%   输入:
%     x             - 设计变量 [DV_LINK1_LENGTH, DV_1, DV_2, DV_3]
%     work_dir      - 工作目录
%     adams_bat     - Adams 启动批处理文件路径
%     model_name    - Adams 模型名称
%     cmd_template  - 原始 cmd 文件路径 (模板)
%     result_file   - 输出结果文件路径
%     sim_end_time  - 仿真终止时间 (秒)
%     sim_num_steps - 仿真步数
%
%   输出:
%     peak_force    - 手柄力峰值绝对值 (N), 优化目标为最小化此值

    persistent eval_count;
    if isempty(eval_count)
        eval_count = 0;
    end
    eval_count = eval_count + 1;

    fprintf('\n--- 第 %d 次函数评估 ---\n', eval_count);
    fprintf('  DV_LINK1_LENGTH = %.4f\n', x(1));
    fprintf('  DV_1            = %.4f\n', x(2));
    fprintf('  DV_2            = %.4f\n', x(3));
    fprintf('  DV_3            = %.4f\n', x(4));

    % 1) 生成修改后的 Adams 运行脚本
    run_cmd_file = fullfile(work_dir, [model_name, '_run.cmd']);
    generate_adams_cmd(x, work_dir, model_name, cmd_template, ...
                       run_cmd_file, result_file, sim_end_time, sim_num_steps);

    % 2) 删除旧的结果文件 (避免读到上一次的)
    if exist(result_file, 'file')
        delete(result_file);
    end

    % 3) 调用 Adams 批处理运行
    %    aview ru-s b <cmd_file> : 以批处理方式运行 Adams/View
    %    将 Adams 输出重定向到日志文件以便诊断
    log_file = fullfile(work_dir, 'adams_run.log');
    adams_cmd = sprintf('"%s" aview ru-s b "%s" > "%s" 2>&1', ...
                        adams_bat, run_cmd_file, log_file);
    fprintf('  调用 Adams...\n');

    old_dir = cd(work_dir);
    [status, ~] = system(adams_cmd);
    cd(old_dir);

    % 打印 Adams 运行状态
    if status ~= 0
        fprintf('  [警告] Adams 返回状态码: %d\n', status);
    else
        fprintf('  Adams 运行完成 (状态码 0)\n');
    end

    % 打印日志最后 20 行帮助诊断
    if exist(log_file, 'file')
        print_log_tail(log_file, 20);
    end

    % 4) 检查结果文件: 先短暂等待, Adams 需要时间写入
    pause(3);

    if ~exist(result_file, 'file')
        % 等待结果文件生成 (最长等 60 秒)
        max_wait = 60;
        wait_interval = 3;
        waited = 0;
        while ~exist(result_file, 'file') && waited < max_wait
            pause(wait_interval);
            waited = waited + wait_interval;
        end
    end

    % 5) 如果主方法 tab 文件未生成, 尝试备选方案: 读取 .req 文件
    if ~exist(result_file, 'file')
        fprintf('  [警告] 主方法未生成 tab 文件, 尝试从 .req/.res 提取...\n');
        success = try_extract_from_req(work_dir, model_name, result_file);
        if ~success
            fprintf('  [错误] 所有导出方法均失败!\n');
            fprintf('  请检查:\n');
            fprintf('    1. Adams 日志文件: %s\n', log_file);
            fprintf('    2. 工作目录中是否有 .res/.req 文件\n');
            fprintf('    3. Adams 路径是否正确\n');
            list_work_dir_files(work_dir);
            peak_force = 1e10;  % 惩罚值
            return;
        end
    end

    % 6) 等待文件写入完成
    pause(1);

    % 7) 读取结果
    try
        data = read_handle_force(result_file);
        time_col  = data(:, 1);
        force_col = data(:, 2);

        % 目标: 峰值手柄力绝对值的最小化
        peak_force = max(abs(force_col));

        fprintf('  仿真完成: 峰值手柄力 = %.4f N\n', peak_force);
        fprintf('  时间范围: [%.4f, %.4f] s, 数据点数: %d\n', ...
                min(time_col), max(time_col), length(time_col));
    catch ME
        warning('读取结果文件失败: %s', ME.message);
        peak_force = 1e10;  % 惩罚值
    end
end


function print_log_tail(log_file, n)
% 打印日志文件最后 n 行
    try
        fid = fopen(log_file, 'r');
        if fid < 0, return; end
        lines = {};
        while ~feof(fid)
            line = fgetl(fid);
            if ischar(line)
                lines{end+1} = line; %#ok<AGROW>
            end
        end
        fclose(fid);

        start_idx = max(1, length(lines) - n + 1);
        fprintf('  --- Adams 日志 (最后 %d 行) ---\n', min(n, length(lines)));
        for i = start_idx:length(lines)
            fprintf('  | %s\n', lines{i});
        end
        fprintf('  --- 日志结束 ---\n');
    catch
        % 忽略日志读取错误
    end
end


function success = try_extract_from_req(work_dir, model_name, result_file)
% 备选方案: 从 Adams 自动生成的 .req 文件中提取手柄力数据
% Adams Solver 运行后会生成 MODEL_1.req 文件 (如果有 REQUEST)
% 或 .res 二进制结果文件

    success = false;

    % 查找可能的 .req 文件
    req_patterns = {
        fullfile(work_dir, [model_name, '.req']),
        fullfile(work_dir, [lower(model_name), '.req']),
        fullfile(work_dir, '*.req')
    };

    req_file = '';
    for i = 1:length(req_patterns)
        files = dir(req_patterns{i});
        if ~isempty(files)
            req_file = fullfile(work_dir, files(1).name);
            break;
        end
    end

    if isempty(req_file)
        fprintf('  未找到 .req 文件\n');
        return;
    end

    fprintf('  找到 .req 文件: %s\n', req_file);

    % 尝试解析 .req 文件 (Adams 文本格式 REQUEST 输出)
    try
        fid = fopen(req_file, 'r');
        if fid < 0, return; end
        content = fread(fid, '*char')';
        fclose(fid);

        % .req 文件格式: 每个时间步有 REQUEST 输出
        % 典型格式有 TIME 列 + REQUEST 数值列
        % 尝试提取所有数值行
        lines = strsplit(content, '\n');
        time_data = [];
        force_data = [];

        for i = 1:length(lines)
            line = strtrim(lines{i});
            if isempty(line), continue; end
            vals = sscanf(line, '%f');
            if length(vals) >= 2
                time_data(end+1) = vals(1); %#ok<AGROW>
                force_data(end+1) = vals(2); %#ok<AGROW>
            end
        end

        if ~isempty(time_data)
            % 写入 tab 文件
            fid_out = fopen(result_file, 'w');
            fprintf(fid_out, 'Time\tHandle_Force\n');
            for i = 1:length(time_data)
                fprintf(fid_out, '%.6e\t%.6e\n', time_data(i), force_data(i));
            end
            fclose(fid_out);
            fprintf('  从 .req 提取 %d 个数据点, 已写入 %s\n', length(time_data), result_file);
            success = true;
        end
    catch
        % 解析失败
    end
end


function list_work_dir_files(work_dir)
% 列出工作目录中的关键文件, 帮助诊断
    fprintf('  工作目录文件列表:\n');
    exts = {'*.tab', '*.req', '*.res', '*.msg', '*.out', '*.log', '*.gra'};
    for i = 1:length(exts)
        files = dir(fullfile(work_dir, exts{i}));
        for j = 1:length(files)
            fprintf('    %s  (%.1f KB, %s)\n', files(j).name, ...
                    files(j).bytes/1024, datestr(files(j).datenum));
        end
    end
end
