function peak_force = adams_objective(x, work_dir, adams_bat, model_name, ...
                                       cmd_template, result_file, ...
                                       sim_end_time, sim_num_steps)
% ADAMS_OBJECTIVE  v4.0
%
%  流程:
%   步骤1 — mdi.bat aview   : 改参数 -> 写 .adm -> 退出 View
%   步骤2 — MATLAB          : 写 .acf 仿真指令文件
%   步骤3 — mdi.bat acpp    : Solver 运行 -> 生成 ASCII .req
%   步骤4 — MATLAB          : 解析 .req，提取 JOINT_86_MEA_1

    persistent eval_count;
    if isempty(eval_count), eval_count = 0; end
    eval_count = eval_count + 1;

    fprintf('\n=== [v4.0] 第 %d 次评估 ===\n', eval_count);
    fprintf('  DV=[%.4f, %.4f, %.4f, %.4f]\n', x(1),x(2),x(3),x(4));

    run_cmd_file = fullfile(work_dir, [model_name,'_run.cmd']);
    adm_base     = fullfile(work_dir, [model_name,'_solver']);
    adm_file     = [adm_base, '.adm'];
    acf_file     = fullfile(work_dir, [model_name,'_solver.acf']);
    req_file     = fullfile(work_dir, [model_name,'_solver.req']);

    % 清理旧文件
    for f = {adm_file, acf_file, req_file, result_file}
        if exist(f{1},'file'), delete(f{1}); end
    end

    % ============================================================
    % 步骤 1: mdi.bat aview — 生成 ADM 文件
    % ============================================================
    generate_adams_cmd(x, work_dir, model_name, cmd_template, ...
                       run_cmd_file, result_file, sim_end_time, sim_num_steps);

    % ★ 用 mdi.bat 调用 aview（它负责设置所有 DLL 路径）
    view_cmd = sprintf('"%s" aview ru-standard -b -c "%s"', adams_bat, run_cmd_file);
    fprintf('  [步骤1] %s\n', view_cmd);

    old_dir = cd(work_dir);
    [st, out] = system(view_cmd);
    cd(old_dir);

    fprintf('  View 状态码: %d\n', st);
    if ~isempty(strtrim(out)), fprintf('  输出: %s\n', out(max(1,end-300):end)); end

    % 读 .msg 日志
    msg = fullfile(work_dir, [model_name,'_run.msg']);
    if exist(msg,'file'), print_tail(msg, 12); end

    wait_file(adm_file, 40);

    if ~exist(adm_file,'file')
        fprintf('  [错误] ADM 未生成! 工作目录文件:\n');
        list_files(work_dir);
        peak_force = 1e10; return;
    end
    fprintf('  [步骤1 OK] ADM = %.1f KB\n', dir(adm_file).bytes/1024);

    % ============================================================
    % 步骤 2: 写 ACF 仿真控制文件
    % ============================================================
    fid = fopen(acf_file,'w');
    fprintf(fid,'SIMULATE/TRANSIENT, END=%g, STEPS=%d\n', sim_end_time, sim_num_steps);
    fprintf(fid,'STOP\n');
    fclose(fid);
    fprintf('  [步骤2 OK] ACF 写入完成\n');

    % ============================================================
    % 步骤 3: mdi.bat acpp — Adams Solver 运行
    % ============================================================
    %  Adams Solver (C++) 通过 mdi.bat 的产品名是 "acpp"
    %  调用格式: mdi.bat acpp ru-standard b adm_file acf_file
    %  注意: adm 和 acf 不用引号包裹文件名中的路径分隔符问题时
    %       可以先 cd 到工作目录，用相对路径

    adm_name = [model_name,'_solver.adm'];   % 相对路径
    acf_name = [model_name,'_solver.acf'];

    % mdi.bat 产品名候选（不同版本可能不同）
    solver_products = {'acpp', 'solver', 'asolve'};
    sol_status = -1;

    for pi = 1:length(solver_products)
        prod = solver_products{pi};
        % 使用相对路径，先 cd 到工作目录
        sol_cmd = sprintf('"%s" %s ru-standard b "%s" "%s"', ...
                          adams_bat, prod, adm_name, acf_name);
        fprintf('  [步骤3] 尝试产品名 "%s": %s\n', prod, sol_cmd);

        old_dir = cd(work_dir);
        [sol_status, sol_out] = system(sol_cmd);
        cd(old_dir);

        fprintf('  Solver 状态码: %d\n', sol_status);

        wait_file(req_file, 5);   % 先等5秒看有没有
        if exist(req_file,'file') && dir(req_file).bytes > 100
            fprintf('  [步骤3 OK] 产品名 "%s" 成功!\n', prod);
            break;
        end
        fprintf('  产品名 "%s" 未生成 .req，换下一个...\n', prod);
    end

    % 等够时间（Solver 需要时间完成）
    wait_file(req_file, 120);

    if ~exist(req_file,'file') || dir(req_file).bytes < 100
        fprintf('  [错误] Solver 未生成 .req 文件!\n');
        fprintf('  Solver 最后输出: %s\n', sol_out(max(1,end-500):end));
        list_files(work_dir);
        peak_force = 1e10; return;
    end
    fprintf('  [步骤3 OK] .req = %.1f KB\n', dir(req_file).bytes/1024);

    % ============================================================
    % 步骤 4: 解析 .req 提取 JOINT_86_MEA_1
    % ============================================================
    [time_data, force_data] = parse_req(req_file, 'JOINT_86_MEA_1');

    if isempty(time_data)
        fprintf('  [警告] 未找到 JOINT_86_MEA_1，读取第一个数值通道...\n');
        [time_data, force_data] = parse_req_any(req_file);
    end

    if isempty(time_data)
        fprintf('  [错误] .req 无有效数据，文件前30行:\n');
        print_tail(req_file, 30);
        peak_force = 1e10; return;
    end

    % 写 tab 文件
    fid = fopen(result_file,'w');
    fprintf(fid,'Time\tJOINT_86_MEA_1\n');
    for i = 1:length(time_data)
        fprintf(fid,'%.8e\t%.8e\n', time_data(i), force_data(i));
    end
    fclose(fid);

    peak_force = max(abs(force_data));
    fprintf('  [完成] 峰值力=%.4f N，数据点=%d\n', peak_force, length(time_data));
end


% ── 解析 .req 文件 ──────────────────────────────────────────────

function [T, F] = parse_req(req_file, keyword)
% 找含 keyword 的块，取 col1=TIME, col2=数值

    T = []; F = [];
    fid = fopen(req_file,'r');
    if fid < 0, return; end
    lines = {};
    while ~feof(fid)
        ln = fgetl(fid);
        if ischar(ln), lines{end+1} = strtrim(ln); end %#ok<AGROW>
    end
    fclose(fid);

    % 找关键字行
    start_idx = 0;
    for i = 1:length(lines)
        if ~isempty(regexpi(lines{i}, keyword, 'once'))
            start_idx = i; break;
        end
    end
    if start_idx == 0, return; end

    % 从关键字后读数值行
    for i = start_idx:length(lines)
        vals = sscanf(lines{i}, '%f');
        if length(vals) >= 2
            T(end+1) = vals(1); %#ok<AGROW>
            F(end+1) = vals(2); %#ok<AGROW>
        end
    end
end


function [T, F] = parse_req_any(req_file)
% 读取 .req 中第一段连续的双列数值数据

    T = []; F = [];
    fid = fopen(req_file,'r');
    if fid < 0, return; end
    in_block = false;
    while ~feof(fid)
        ln = strtrim(fgetl(fid));
        if ~ischar(ln), break; end
        vals = sscanf(ln, '%f');
        if length(vals) >= 2
            in_block = true;
            T(end+1) = vals(1); %#ok<AGROW>
            F(end+1) = vals(2); %#ok<AGROW>
        elseif in_block && length(T) > 10
            break;  % 读完第一个完整块就停
        end
    end
    fclose(fid);
end


% ── 通用工具 ────────────────────────────────────────────────────

function wait_file(fpath, max_sec)
    waited = 0;
    while ~exist(fpath,'file') && waited < max_sec
        pause(2); waited = waited + 2;
    end
end

function print_tail(fpath, n)
    try
        fid = fopen(fpath,'r'); if fid<0,return; end
        lines = {};
        while ~feof(fid)
            ln = fgetl(fid);
            if ischar(ln), lines{end+1} = ln; end %#ok<AGROW>
        end
        fclose(fid);
        fprintf('  --- %s 末尾 ---\n', fpath);
        for i = max(1,length(lines)-n+1):length(lines)
            fprintf('  | %s\n', lines{i});
        end
    catch, end
end

function list_files(work_dir)
    for ext = {'*.adm','*.acf','*.req','*.res','*.tab','*.msg','*.log','*.out'}
        files = dir(fullfile(work_dir, ext{1}));
        for j = 1:length(files)
            fprintf('    %-45s %.1f KB\n', files(j).name, files(j).bytes/1024);
        end
    end
end
