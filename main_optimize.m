%% main_optimize.m  v4.0
clear; clc; close all;

%% ======================== 用户配置区 ========================

work_dir   = 'C:\Users\Administrator\Desktop\lianxi';

% ★ 用 mdi.bat（它会正确设置 DLL 路径）
adams_bat  = 'E:\adams\Adams2024\common\mdi.bat';

model_name    = 'MODEL_1';
cmd_template  = fullfile(work_dir, 'MODEL_1.cmd');
sim_end_time  = 4.0;
sim_num_steps = 1000;
result_file   = fullfile(work_dir, 'handle_force.tab');

x0        = [184.7184, 9261.58, 1457.92, 2164.32];
lb        = x0 * 0.80;
ub        = x0 * 1.20;
var_names = {'DV_LINK1_LENGTH','DV_1','DV_2','DV_3'};

%% ======================== 优化设置 ========================

obj_fun = @(x) adams_objective(x, work_dir, adams_bat, model_name, ...
                                cmd_template, result_file, ...
                                sim_end_time, sim_num_steps);

options = optimoptions('fmincon', ...
    'Display','iter','Algorithm','sqp', ...
    'MaxIterations',50,'MaxFunctionEvaluations',200, ...
    'FiniteDifferenceStepSize',1e-3,'FiniteDifferenceType','central', ...
    'StepTolerance',1e-4,'OptimalityTolerance',1e-4, ...
    'PlotFcns',{@optimplotfval});

nonlcon = @(x) nonlinear_constraints(x, x0);

fprintf('========================================\n');
fprintf('  Adams-MATLAB 手柄力优化  v4.0\n');
fprintf('========================================\n');
for i = 1:length(x0)
    fprintf('  %-20s = %.4f\n', var_names{i}, x0(i));
end

%% ======================== 运行优化 ========================

try
    [x_opt, fval, exitflag, output] = fmincon(obj_fun, x0, [], [], [], [], lb, ub, nonlcon, options);
catch ME
    fprintf('\n优化出错: %s\n', ME.message);
    return;
end

%% ======================== 输出结果 ========================

fprintf('\n========================================\n');
fprintf('  最优目标值: %.4f N\n', fval);
for i = 1:length(x_opt)
    fprintf('  %-20s = %.4f  (%+.2f%%)\n', var_names{i}, x_opt(i), (x_opt(i)/x0(i)-1)*100);
end

plot_handle_force(result_file);

function msg = get_exitflag_msg(flag) %#ok<DEFNU>
    switch flag
        case 1,  msg='一阶最优性满足';
        case 2,  msg='步长小于容差';
        case 0,  msg='达到最大迭代';
        case -2, msg='未找到可行解';
        otherwise, msg='其他';
    end
end
