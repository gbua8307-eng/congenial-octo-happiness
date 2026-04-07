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
    %    使用 aview 批处理模式: mdi.bat aview ru-s b <cmd_file>
    adams_cmd = sprintf('"%s" aview ru-s b "%s"', adams_bat, run_cmd_file);
    fprintf('  调用 Adams: %s\n', adams_cmd);

    old_dir = cd(work_dir);
    [status, cmdout] = system(adams_cmd);
    cd(old_dir);

    if status ~= 0
        warning('Adams 运行返回非零状态: %d', status);
        fprintf('  Adams 输出:\n%s\n', cmdout);
    end

    % 4) 等待结果文件生成 (最长等 120 秒)
    max_wait = 120;  % 秒
    wait_interval = 2;
    waited = 0;
    while ~exist(result_file, 'file') && waited < max_wait
        pause(wait_interval);
        waited = waited + wait_interval;
    end

    if ~exist(result_file, 'file')
        warning('结果文件未生成: %s (等待了 %d 秒)', result_file, max_wait);
        peak_force = 1e10;  % 惩罚值
        return;
    end

    % 5) 再等一小段确保文件写入完成
    pause(1);

    % 6) 读取结果
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
