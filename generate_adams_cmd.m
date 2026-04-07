function generate_adams_cmd(x, work_dir, model_name, cmd_template, ...
                            run_cmd_file, result_file, sim_end_time, sim_num_steps)
% GENERATE_ADAMS_CMD  基于模板 cmd 生成修改设计变量后的 Adams 运行脚本
%
%   策略: 读取原始 cmd 模板, 追加以下命令:
%     1. 修改 4 个设计变量值
%     2. 运行仿真
%     3. 通过多种方式导出手柄力数据到 .tab 文件
%     4. 退出 Adams

    DV_LINK1_LENGTH = x(1);
    DV_1 = x(2);
    DV_2 = x(3);
    DV_3 = x(4);

    % 将反斜杠路径转为正斜杠 (Adams cmd 兼容)
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

    % ==================== 修改设计变量 ====================
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

    % ==================== 运行仿真 ====================
    fprintf(fid, '!---------------- Optimization: Run Simulation ----------------!\n');
    fprintf(fid, '!\n');
    fprintf(fid, 'simulation single_run transient  &\n');
    fprintf(fid, '   type = auto_select  &\n');
    fprintf(fid, '   initial_static = no  &\n');
    fprintf(fid, '   end_time = %.4f  &\n', sim_end_time);
    fprintf(fid, '   number_of_steps = %d  &\n', sim_num_steps);
    fprintf(fid, '   model_name = .%s\n', model_name);
    fprintf(fid, '!\n');

    % ==================== 导出手柄力结果 ====================
    %
    % Adams/View 批处理模式下, 仿真完成后结果存储在 result set 中
    % result set 组件命名规则: .MODEL_1.<analysis_name>.<measure_name>
    % simulation single_run 的默认 analysis name = Last_Run
    %
    % 导出策略: 创建 XY Plot -> 添加曲线 -> 导出表格数据
    % 这是 Adams/View 批处理下最可靠的数据导出方式

    fprintf(fid, '!---------------- Optimization: Export Results ----------------!\n');
    fprintf(fid, '!\n');

    % --- 方法1: XY Plot 创建+导出 (最可靠) ---
    fprintf(fid, '! Method 1: Create XY Plot and export table data\n');
    fprintf(fid, '!\n');

    % 创建 XY Plot 窗口
    fprintf(fid, 'xy_plots create  &\n');
    fprintf(fid, '   xy_plot_name = .%s.opt_handle_force_plot\n', model_name);
    fprintf(fid, '!\n');

    % 向 plot 添加曲线: X=时间, Y=手柄力
    % result_set_component_name 格式: .MODEL.analysis.measure
    fprintf(fid, 'xy_plots add_curve  &\n');
    fprintf(fid, '   xy_plot_name = .%s.opt_handle_force_plot  &\n', model_name);
    fprintf(fid, '   curve_name = handle_force_curve  &\n');
    fprintf(fid, '   x_axis_result_set_component = .%s.Last_Run.TIME  &\n', model_name);
    fprintf(fid, '   y_axis_result_set_component = .%s.Last_Run.JOINT_86_MEA_1\n', model_name);
    fprintf(fid, '!\n');

    % 导出 plot 数据到 tab 文件
    fprintf(fid, 'file table write  &\n');
    fprintf(fid, '   file_name = "%s"  &\n', result_file_fwd);
    fprintf(fid, '   xy_plot_name = .%s.opt_handle_force_plot  &\n', model_name);
    fprintf(fid, '   write_to = new_file  &\n');
    fprintf(fid, '   separator = tab\n');
    fprintf(fid, '!\n');

    % 清理 plot (避免下次迭代重名冲突)
    fprintf(fid, 'xy_plots delete  &\n');
    fprintf(fid, '   xy_plot_name = .%s.opt_handle_force_plot\n', model_name);
    fprintf(fid, '!\n');

    % --- 方法2: 备选 - 使用 results spreadsheet export ---
    % 如果方法1的 plot 导出失败, 尝试 spreadsheet 方式
    % 注意: 需要 Adams/View 支持此命令 (部分版本不支持)
    %fprintf(fid, '! Method 2 (backup): spreadsheet export\n');
    %fprintf(fid, 'results spreadsheet  &\n');
    %fprintf(fid, '   file_name = "%s"  &\n', result_file_fwd);
    %fprintf(fid, '   result_set_component_name = .%s.Last_Run.JOINT_86_MEA_1  &\n', model_name);
    %fprintf(fid, '   sort_order = ascending\n');
    %fprintf(fid, '!\n');

    % ==================== 退出 Adams ====================
    fprintf(fid, '!---------------- Optimization: Exit Adams ----------------!\n');
    fprintf(fid, '!\n');
    fprintf(fid, 'command nosave\n');
    fprintf(fid, 'stop\n');

    fclose(fid);

    fprintf('  已生成运行脚本: %s\n', run_cmd_file);
end
