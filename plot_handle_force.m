function plot_handle_force(result_file)
% PLOT_HANDLE_FORCE  绘制手柄力时域曲线
%
%   输入:
%     result_file - handle_force.tab 文件路径

    if ~exist(result_file, 'file')
        warning('结果文件不存在: %s', result_file);
        return;
    end

    data = read_handle_force(result_file);
    time_col  = data(:, 1);
    force_col = data(:, 2);

    figure('Name', '手柄力优化结果', 'NumberTitle', 'off', ...
           'Position', [100, 100, 900, 500]);

    % 子图 1: 手柄力时域曲线
    subplot(2, 1, 1);
    plot(time_col, force_col, 'b-', 'LineWidth', 1.5);
    hold on;
    [peak_val, peak_idx] = max(abs(force_col));
    plot(time_col(peak_idx), force_col(peak_idx), 'ro', ...
         'MarkerSize', 10, 'LineWidth', 2);
    text(time_col(peak_idx), force_col(peak_idx), ...
         sprintf('  Peak: %.2f N @ %.3f s', force_col(peak_idx), time_col(peak_idx)), ...
         'FontSize', 10, 'Color', 'r');
    xlabel('Time (s)');
    ylabel('Handle Force (N)');
    title('JOINT\_86 Handle Force vs Time');
    grid on;
    legend('Handle Force', 'Peak Value', 'Location', 'best');
    hold off;

    % 子图 2: 手柄力绝对值
    subplot(2, 1, 2);
    plot(time_col, abs(force_col), 'r-', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('|Handle Force| (N)');
    title('Absolute Handle Force');
    grid on;

    % 保存图片
    [fpath, ~, ~] = fileparts(result_file);
    saveas(gcf, fullfile(fpath, 'handle_force_result.png'));
    fprintf('图片已保存: %s\n', fullfile(fpath, 'handle_force_result.png'));
end
