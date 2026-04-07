function data = read_handle_force(result_file)
% READ_HANDLE_FORCE  读取 Adams 导出的手柄力 tab 文件
%
%   输入:
%     result_file - handle_force.tab 文件路径
%
%   输出:
%     data - [N x 2] 矩阵, 第 1 列时间(s), 第 2 列力(N)
%
%   说明:
%     Adams 导出的 tab 文件格式多样:
%       - 可能有若干行表头 (以非数字字符开头)
%       - 数据列可能用 tab、空格或逗号分隔
%       - 可能包含科学计数法 (1.234E+05)
%     本函数自动跳过表头, 只读取数值行。

    fid = fopen(result_file, 'r');
    if fid < 0
        error('无法打开结果文件: %s', result_file);
    end

    time_data  = [];
    force_data = [];

    while ~feof(fid)
        raw_line = fgetl(fid);

        % fgetl 返回 -1 表示 EOF
        if ~ischar(raw_line)
            continue;
        end

        line = strtrim(raw_line);

        % 跳过空行
        if isempty(line)
            continue;
        end

        % 跳过表头行 (以字母或特殊字符开头, 但允许正负号)
        if ~is_numeric_line(line)
            continue;
        end

        % 尝试用多种分隔符解析
        % 替换逗号为空格, 然后用 sscanf
        line_clean = strrep(line, ',', ' ');
        line_clean = strrep(line_clean, '\t', ' ');
        vals = sscanf(line_clean, '%f');

        if length(vals) >= 2
            time_data(end+1, 1)  = vals(1);  %#ok<AGROW>
            force_data(end+1, 1) = vals(2);  %#ok<AGROW>
        elseif length(vals) == 1
            % 某些格式中时间和数据在交替行, 跳过单值行
            continue;
        end
    end

    fclose(fid);

    if isempty(time_data)
        % 打印文件前 10 行帮助诊断
        fprintf('  [诊断] 结果文件前 10 行:\n');
        fid2 = fopen(result_file, 'r');
        for i = 1:10
            ln = fgetl(fid2);
            if ~ischar(ln), break; end
            fprintf('    %d: %s\n', i, ln);
        end
        fclose(fid2);
        error('结果文件中未找到有效数据: %s', result_file);
    end

    data = [time_data, force_data];

    fprintf('  读取 %d 个数据点, 时间 [%.4f, %.4f] s\n', ...
            length(time_data), min(time_data), max(time_data));
end


function tf = is_numeric_line(line)
% 判断一行是否以数字、正负号或小数点开头 (即数值数据行)
    first_char = line(1);
    tf = (first_char >= '0' && first_char <= '9') || ...
         first_char == '-' || first_char == '+' || first_char == '.';
end
