function generate_adams_cmd(x, work_dir, model_name, cmd_template, ...
                            run_cmd_file, ~, ~, ~)
% GENERATE_ADAMS_CMD  v4.0
%   任务: 修改设计变量 -> 写 ADM 求解器文件 -> 退出
%   仿真由 Adams Solver (通过 mdi.bat acpp) 完成

    DV_LINK1_LENGTH = x(1);
    DV_1 = x(2);
    DV_2 = x(3);
    DV_3 = x(4);

    adm_base_fwd = strrep(fullfile(work_dir, [model_name,'_solver']), '\', '/');

    fid_in = fopen(cmd_template, 'r');
    if fid_in < 0, error('无法打开模板: %s', cmd_template); end
    template_content = fread(fid_in, '*char')';
    fclose(fid_in);

    fid = fopen(run_cmd_file, 'w');
    if fid < 0, error('无法创建: %s', run_cmd_file); end

    fprintf(fid, '%s\n', template_content);

    fprintf(fid, '!\n! ---- v4.0 Modify Design Variables ----\n!\n');
    fprintf(fid, 'variable modify  &\n   variable_name = .%s.DV_LINK1_LENGTH  &\n   real_value = (%.10f)\n!\n', model_name, DV_LINK1_LENGTH);
    fprintf(fid, 'variable modify  &\n   variable_name = .%s.DV_1  &\n   real_value = (%.10f)\n!\n', model_name, DV_1);
    fprintf(fid, 'variable modify  &\n   variable_name = .%s.DV_2  &\n   real_value = (%.10f)\n!\n', model_name, DV_2);
    fprintf(fid, 'variable modify  &\n   variable_name = .%s.DV_3  &\n   real_value = (%.10f)\n!\n', model_name, DV_3);

    % 写出 ADM 文件（供 Solver 使用）
    fprintf(fid, '! ---- v4.0 Write ADM Solver File ----\n!\n');
    fprintf(fid, 'file solver write  &\n');
    fprintf(fid, '   model_name = .%s  &\n', model_name);
    fprintf(fid, '   file_name = "%s"\n', adm_base_fwd);
    fprintf(fid, '!\n');
    fprintf(fid, 'file/exit, nosave\n');

    fclose(fid);
    fprintf('  [v4.0] View 脚本: %s\n', run_cmd_file);
end
