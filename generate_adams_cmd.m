function generate_adams_cmd(x, work_dir, model_name, cmd_template, ...
                            run_cmd_file, result_file, sim_end_time, sim_num_steps)
% GENERATE_ADAMS_CMD  基于模板 cmd 生成修改设计变量后的 Adams 运行脚本
%
%   策略: 读取原始 cmd 模板, 追加以下命令:
%     1. 修改 4 个设计变量值
%     2. 运行仿真
%     3. 导出手柄力数据到 .tab 文件
%     4. 退出 Adams

    DV_LINK1_LENGTH = x(1);
    DV_1 = x(2);
    DV_2 = x(3);
    DV_3 = x(4);

    % 将反斜杠路径转为正斜杠 (Adams 兼容)
    result_file_fwd = strrep(result_file, '\', '/');

    % 读取模板 cmd 内容
    fid_in = fopen(cmd_template, 'r');
    if fid_in < 0
        error('无法打开模板文件: %s', cmd_template);
    end
    template_content = fread(fid_in, '*char')';
    fclose(fid_in);

    % 写入运行 cmd 文件
    fid = fopen(run_cmd_file, 'w');
    if fid < 0
        error('无法创建运行文件: %s', run_cmd_file);
    end

    % 写入模板内容 (建立完整模型)
    fprintf(fid, '%s\n', template_content);

    % 追加: 修改设计变量
    fprintf(fid, '!\n');
    fprintf(fid, '!---------------- Optimization: Modify Design Variables ----------------!\n');
    fprintf(fid, '!\n');

    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .%s.DV_LINK1_LENGTH  &\n', model_name);
    fprintf(fid, '   real_value = (%.10f)\n', DV_LINK1_LENGTH);
    fprintf(fid, '!\n');

    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .%s.DV_1  &\n', model_name);
    fprintf(fid, '   real_value = (%.10f)\n', DV_1);
    fprintf(fid, '!\n');

    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .%s.DV_2  &\n', model_name);
    fprintf(fid, '   real_value = (%.10f)\n', DV_2);
    fprintf(fid, '!\n');

    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .%s.DV_3  &\n', model_name);
    fprintf(fid, '   real_value = (%.10f)\n', DV_3);
    fprintf(fid, '!\n');

    % 追加: 运行仿真
    fprintf(fid, '!---------------- Optimization: Run Simulation ----------------!\n');
    fprintf(fid, '!\n');
    fprintf(fid, 'simulation single_run transient  &\n');
    fprintf(fid, '   type = auto_select  &\n');
    fprintf(fid, '   initial_static = no  &\n');
    fprintf(fid, '   end_time = %.4f  &\n', sim_end_time);
    fprintf(fid, '   number_of_steps = %d  &\n', sim_num_steps);
    fprintf(fid, '   model_name = .%s\n', model_name);
    fprintf(fid, '!\n');

    % 追加: 导出手柄力结果到 tab 文件
    %   使用 numeric_results export 命令
    fprintf(fid, '!---------------- Optimization: Export Results ----------------!\n');
    fprintf(fid, '!\n');

    % 方法: 使用 request 写入 tab 文件
    % Adams/View 的 file table write 命令导出测量数据
    fprintf(fid, 'numeric_results select  &\n');
    fprintf(fid, '   result_set_component = .%s.JOINT_86_MEA_1  &\n', model_name);
    fprintf(fid, '   end_time = %.4f  &\n', sim_end_time);
    fprintf(fid, '   sim_model_name = .%s\n', model_name);
    fprintf(fid, '!\n');

    fprintf(fid, 'file numeric write  &\n');
    fprintf(fid, '   file_name = "%s"  &\n', result_file_fwd);
    fprintf(fid, '   result_set_component = .%s.JOINT_86_MEA_1  &\n', model_name);
    fprintf(fid, '   write_to = new_file  &\n');
    fprintf(fid, '   format = text\n');
    fprintf(fid, '!\n');

    % 追加: 退出 Adams
    fprintf(fid, '!---------------- Optimization: Exit Adams ----------------!\n');
    fprintf(fid, '!\n');
    fprintf(fid, 'command nosave\n');
    fprintf(fid, 'stop\n');

    fclose(fid);

    fprintf('  已生成运行脚本: %s\n', run_cmd_file);
end
