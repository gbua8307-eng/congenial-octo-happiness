%% main_optimize.m
%  Adams-MATLAB 联合优化：最小化手柄力 (JOINT_86_MEA_1)
%  设计变量: DV_LINK1_LENGTH, DV_1, DV_2, DV_3
%  流程: MATLAB 修改参数 -> 生成 .cmd -> Adams 批处理运行 -> 读取结果 -> 优化迭代
%
%  使用前请确认:
%  1. Adams 安装路径正确
%  2. MODEL_1.cmd 模板文件位于工作目录
%  3. 工作目录可写

clear; clc; close all;

%% ======================== 用户配置区 ========================

% 工作目录
work_dir = 'C:\Users\Administrator\Desktop\lianxi';

% Adams 批处理启动路径
adams_bat = 'E:\adams\Adams2024\common\mdi.bat';

% 模型名称
model_name = 'MODEL_1';

% cmd 模板文件 (原始导出的 cmd)
cmd_template = fullfile(work_dir, 'MODEL_1.cmd');

% 仿真参数
sim_end_time  = 4.0;   % 秒
sim_num_steps = 1000;

% 结果输出文件
result_file = fullfile(work_dir, 'handle_force.tab');

% ===================== 设计变量初始值与边界 =====================
%  [DV_LINK1_LENGTH, DV_1, DV_2, DV_3]
%  DV_LINK1_LENGTH: 连杆长度 (mm)
%  DV_1, DV_2, DV_3: 响铃位置坐标 (mm)

x0 = [184.7184,  9261.58,  1457.92,  2164.32];

% 下界: 各参数允许缩小 20%
lb = x0 * 0.80;

% 上界: 各参数允许增大 20%
ub = x0 * 1.20;

% 变量名称 (用于日志)
var_names = {'DV_LINK1_LENGTH', 'DV_1', 'DV_2', 'DV_3'};

%% ======================== 优化设置 ========================

% 构建优化目标函数
obj_fun = @(x) adams_objective(x, work_dir, adams_bat, model_name, ...
                                cmd_template, result_file, ...
                                sim_end_time, sim_num_steps);

% fmincon 选项
options = optimoptions('fmincon', ...
    'Display',           'iter', ...
    'Algorithm',         'sqp', ...
    'MaxIterations',     50, ...
    'MaxFunctionEvaluations', 200, ...
    'FiniteDifferenceStepSize', 1e-3, ...  % 相对步长
    'FiniteDifferenceType',    'central', ...
    'StepTolerance',     1e-4, ...
    'OptimalityTolerance', 1e-4, ...
    'PlotFcns',          {@optimplotfval});

% 无线性/非线性约束 (A, b, Aeq, beq 均为空)
A   = [];  b   = [];
Aeq = [];  beq = [];

% 非线性约束: 保证连杆长度变化不超过原始值的 ±15%
%   即 |DV_LINK1_LENGTH - 184.7184| <= 184.7184 * 0.15
% 已通过 lb/ub 覆盖, 但也可以用非线性约束做更精细的控制
nonlcon = @(x) nonlinear_constraints(x, x0);

fprintf('========================================\n');
fprintf('  Adams-MATLAB 手柄力优化\n');
fprintf('========================================\n');
fprintf('初始设计变量:\n');
for i = 1:length(x0)
    fprintf('  %-20s = %.4f\n', var_names{i}, x0(i));
end
fprintf('----------------------------------------\n');

%% ======================== 运行优化 ========================

try
    [x_opt, fval, exitflag, output] = fmincon(obj_fun, x0, A, b, Aeq, beq, lb, ub, nonlcon, options);
catch ME
    fprintf('\n优化过程出错: %s\n', ME.message);
    fprintf('请检查 Adams 是否正确安装并可通过命令行调用。\n');
    return;
end

%% ======================== 输出结果 ========================

fprintf('\n========================================\n');
fprintf('  优化结果\n');
fprintf('========================================\n');
fprintf('退出标志: %d (%s)\n', exitflag, get_exitflag_msg(exitflag));
fprintf('迭代次数: %d\n', output.iterations);
fprintf('函数评估: %d\n', output.funcCount);
fprintf('最优目标值 (峰值手柄力): %.4f N\n', fval);
fprintf('----------------------------------------\n');
fprintf('最优设计变量:\n');
for i = 1:length(x_opt)
    fprintf('  %-20s = %.4f  (变化: %+.2f%%)\n', ...
        var_names{i}, x_opt(i), (x_opt(i)/x0(i) - 1)*100);
end
fprintf('========================================\n');

% 用最优参数再跑一次, 保留最终结果
fprintf('\n用最优参数运行最终仿真...\n');
final_force = adams_objective(x_opt, work_dir, adams_bat, model_name, ...
                               cmd_template, result_file, ...
                               sim_end_time, sim_num_steps);
fprintf('最终峰值手柄力: %.4f N\n', final_force);

% 绘制最终手柄力曲线
plot_handle_force(result_file);

%% ======================== 辅助函数 ========================

function msg = get_exitflag_msg(flag)
    switch flag
        case 1,  msg = '一阶最优性条件满足';
        case 2,  msg = '变量变化小于容差';
        case 0,  msg = '达到最大迭代/评估次数';
        case -1, msg = '被输出函数或绘图函数终止';
        case -2, msg = '未找到可行解';
        otherwise, msg = '其他';
    end
end
