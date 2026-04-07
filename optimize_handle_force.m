%% optimize_handle_force.m
%  Adams-MATLAB co-simulation: optimize handle force via batch mode
%  Workflow: MATLAB modifies design variables -> generates Adams batch .cmd
%            -> Adams/View runs batch -> exports handle_force.tab -> MATLAB reads & optimizes
%
%  Design Variables:
%    x(1) = DV_LINK1_LENGTH  (link length, mm)
%    x(2) = DV_1             (POINT_238 x-coordinate, mm)
%    x(3) = DV_2             (POINT_238 y-coordinate, mm)
%    x(4) = DV_3             (POINT_238 z-coordinate, mm)
%
%  Objective: minimize peak handle force (max absolute value of JOINT_86_MEA_1)
%  Constraints:
%    1. Peak handle force <= max_force_limit (ergonomic upper bound)
%    2. DV_LINK1_LENGTH > 0 (physical: link length must be positive)
%    3. RMS force <= rms_force_limit (overall comfort constraint)

clear; clc; close all;

%% ========================= User Configuration ============================
% Working directory (must contain MODEL_1.cmd)
work_dir = 'C:\Users\Administrator\Desktop\lianxi';

% Adams installation path
adams_bat = 'E:\adams\Adams2024\common\mdi.bat';

% Model file name (without extension)
model_name = 'MODEL_1';

% Simulation parameters
end_time     = 4.0;    % seconds
num_steps    = 1000;

% Output file
output_file = 'handle_force.tab';

% Measure name in Adams
measure_name = '.MODEL_1.JOINT_86_MEA_1';

% ---- Initial values (from MODEL_1.cmd) ----
x0 = [184.7183848457;   % DV_LINK1_LENGTH (mm)
      9261.58;           % DV_1 (mm)
      1457.92;           % DV_2 (mm)
      2164.32];          % DV_3 (mm)

% ---- Design variable bounds (+-20% of nominal) ----
lb = x0 * 0.80;   % lower bounds
ub = x0 * 1.20;   % upper bounds

% Ensure DV_LINK1_LENGTH lower bound is positive
lb(1) = max(lb(1), 50.0);

% ---- Constraint limits ----
max_force_limit = 200;   % N, maximum acceptable peak handle force
rms_force_limit = 100;   % N, maximum acceptable RMS handle force

%% ========================= Optimization Setup ============================
% Store config in a struct for passing to objective/constraint functions
cfg.work_dir     = work_dir;
cfg.adams_bat    = adams_bat;
cfg.model_name   = model_name;
cfg.end_time     = end_time;
cfg.num_steps    = num_steps;
cfg.output_file  = output_file;
cfg.measure_name = measure_name;

% fmincon options
options = optimoptions('fmincon', ...
    'Display',           'iter', ...
    'Algorithm',         'sqp', ...
    'MaxIterations',     50, ...
    'MaxFunctionEvaluations', 200, ...
    'FiniteDifferenceStepSize', 1e-3 * abs(x0), ...  % scaled step size
    'FiniteDifferenceType', 'central', ...
    'OptimalityTolerance',  1e-4, ...
    'StepTolerance',        1e-4, ...
    'PlotFcns',          {@optimplotfval, @optimplotx});

% Define objective function
obj_fun = @(x) adams_objective(x, cfg);

% Define nonlinear constraint function
nonlcon = @(x) adams_constraints(x, cfg, max_force_limit, rms_force_limit);

% No linear equality/inequality constraints
A = []; b = []; Aeq = []; beq = [];

%% ========================= Run Optimization ==============================
fprintf('=== Adams-MATLAB Handle Force Optimization ===\n');
fprintf('Initial design variables:\n');
fprintf('  DV_LINK1_LENGTH = %.4f mm\n', x0(1));
fprintf('  DV_1            = %.4f mm\n', x0(2));
fprintf('  DV_2            = %.4f mm\n', x0(3));
fprintf('  DV_3            = %.4f mm\n', x0(4));
fprintf('Bounds: [%.1f%% ~ %.1f%%] of nominal\n', 80, 120);
fprintf('Max force limit:  %.1f N\n', max_force_limit);
fprintf('RMS force limit:  %.1f N\n', rms_force_limit);
fprintf('================================================\n\n');

% Run initial simulation to get baseline
fprintf('--- Running baseline simulation ---\n');
[time0, force0] = run_adams_simulation(x0, cfg);
if isempty(time0)
    error('Baseline simulation failed. Check Adams path and model file.');
end
fprintf('Baseline peak force:  %.2f N\n', max(abs(force0)));
fprintf('Baseline RMS force:   %.2f N\n', rms(force0));
fprintf('================================================\n\n');

% Run fmincon
[x_opt, fval, exitflag, output] = fmincon(obj_fun, x0, A, b, Aeq, beq, lb, ub, nonlcon, options);

%% ========================= Results =======================================
fprintf('\n=== Optimization Results ===\n');
fprintf('Exit flag: %d (%s)\n', exitflag, output.message);
fprintf('Iterations: %d, Function evaluations: %d\n', output.iterations, output.funcCount);
fprintf('\nOptimal design variables:\n');
fprintf('  DV_LINK1_LENGTH = %.4f mm  (was %.4f, change %.2f%%)\n', ...
    x_opt(1), x0(1), (x_opt(1)-x0(1))/x0(1)*100);
fprintf('  DV_1            = %.4f mm  (was %.4f, change %.2f%%)\n', ...
    x_opt(2), x0(2), (x_opt(2)-x0(2))/x0(2)*100);
fprintf('  DV_2            = %.4f mm  (was %.4f, change %.2f%%)\n', ...
    x_opt(3), x0(3), (x_opt(3)-x0(3))/x0(3)*100);
fprintf('  DV_3            = %.4f mm  (was %.4f, change %.2f%%)\n', ...
    x_opt(4), x0(4), (x_opt(4)-x0(4))/x0(4)*100);
fprintf('\nOptimized peak force: %.2f N\n', fval);

% Run final simulation with optimal parameters for plotting
[time_opt, force_opt] = run_adams_simulation(x_opt, cfg);

% Plot comparison
figure('Name', 'Handle Force Optimization Result', 'Position', [100 100 900 500]);
plot(time0, force0, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Baseline');
hold on;
plot(time_opt, force_opt, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Optimized');
hold off;
xlabel('Time (s)');
ylabel('Handle Force (N)');
title('Handle Force Comparison: Baseline vs Optimized');
legend('Location', 'best');
grid on;

% Save results to file
result_file = fullfile(work_dir, 'optimization_results.txt');
fid = fopen(result_file, 'w');
fprintf(fid, 'Adams-MATLAB Handle Force Optimization Results\n');
fprintf(fid, '==============================================\n');
fprintf(fid, 'Date: %s\n\n', datestr(now));
fprintf(fid, 'Design Variable       Initial       Optimal      Change(%%)\n');
fprintf(fid, '-----------------------------------------------------------\n');
names = {'DV_LINK1_LENGTH', 'DV_1', 'DV_2', 'DV_3'};
for i = 1:4
    fprintf(fid, '%-20s  %12.4f  %12.4f  %8.2f%%\n', ...
        names{i}, x0(i), x_opt(i), (x_opt(i)-x0(i))/x0(i)*100);
end
fprintf(fid, '\nBaseline peak force:  %.2f N\n', max(abs(force0)));
fprintf(fid, 'Optimized peak force: %.2f N\n', max(abs(force_opt)));
fprintf(fid, 'Baseline RMS force:   %.2f N\n', rms(force0));
fprintf(fid, 'Optimized RMS force:  %.2f N\n', rms(force_opt));
fclose(fid);
fprintf('\nResults saved to: %s\n', result_file);

%% ==================== OBJECTIVE FUNCTION =================================
function f = adams_objective(x, cfg)
    % Objective: minimize peak absolute handle force
    [~, force] = run_adams_simulation(x, cfg);
    if isempty(force)
        f = 1e6;  % penalty for failed simulation
        warning('Adams simulation failed, returning penalty value.');
        return;
    end
    f = max(abs(force));
end

%% ==================== NONLINEAR CONSTRAINTS ==============================
function [c, ceq] = adams_constraints(x, cfg, max_force_limit, rms_force_limit)
    % Nonlinear inequality constraints: c(x) <= 0
    % Nonlinear equality constraints:   ceq(x) = 0

    [~, force] = run_adams_simulation(x, cfg);

    if isempty(force)
        c = [1e6; 1e6];  % infeasible if simulation fails
        ceq = [];
        return;
    end

    peak_force = max(abs(force));
    rms_force  = rms(force);

    % c(1): peak force <= max_force_limit  =>  peak_force - max_force_limit <= 0
    % c(2): RMS force  <= rms_force_limit  =>  rms_force  - rms_force_limit <= 0
    c = [peak_force - max_force_limit;
         rms_force  - rms_force_limit];

    ceq = [];  % no equality constraints
end

%% ==================== RUN ADAMS SIMULATION ===============================
function [time, force] = run_adams_simulation(x, cfg)
    % Runs a single Adams batch simulation with given design variables
    % Returns [time, force] vectors, or empty on failure

    time  = [];
    force = [];

    % --- 1. Write the batch command file ---
    batch_cmd_file = fullfile(cfg.work_dir, 'run_batch.cmd');
    model_cmd_file = fullfile(cfg.work_dir, [cfg.model_name, '.cmd']);
    tab_file       = fullfile(cfg.work_dir, cfg.output_file);

    % Delete old output to avoid reading stale data
    if isfile(tab_file)
        delete(tab_file);
    end

    fid = fopen(batch_cmd_file, 'w');
    if fid == -1
        warning('Cannot create batch command file: %s', batch_cmd_file);
        return;
    end

    % Adams batch commands
    fprintf(fid, '! Auto-generated batch command file for Adams-MATLAB optimization\n');
    fprintf(fid, '!\n');

    % Read the model
    fprintf(fid, 'file command read  &\n');
    fprintf(fid, '   file_name = "%s"\n', model_cmd_file);
    fprintf(fid, '!\n');

    % Modify design variables
    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .MODEL_1.DV_LINK1_LENGTH  &\n');
    fprintf(fid, '   real_value = %.10f\n', x(1));
    fprintf(fid, '!\n');

    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .MODEL_1.DV_1  &\n');
    fprintf(fid, '   real_value = %.10f\n', x(2));
    fprintf(fid, '!\n');

    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .MODEL_1.DV_2  &\n');
    fprintf(fid, '   real_value = %.10f\n', x(3));
    fprintf(fid, '!\n');

    fprintf(fid, 'variable modify  &\n');
    fprintf(fid, '   variable_name = .MODEL_1.DV_3  &\n');
    fprintf(fid, '   real_value = %.10f\n', x(4));
    fprintf(fid, '!\n');

    % Run transient simulation
    fprintf(fid, 'simulation single_run transient  &\n');
    fprintf(fid, '   type = auto_select  &\n');
    fprintf(fid, '   initial_static = no  &\n');
    fprintf(fid, '   end_time = %.4f  &\n', cfg.end_time);
    fprintf(fid, '   number_of_steps = %d  &\n', cfg.num_steps);
    fprintf(fid, '   model_name = .MODEL_1\n');
    fprintf(fid, '!\n');

    % Export results using Adams/PostProcessor spreadsheet export
    % Method: switch to postprocessor, create plot, then export to file
    fprintf(fid, '!\n');
    fprintf(fid, '! --- Switch to Adams/PostProcessor and export results ---\n');
    fprintf(fid, 'interface push_button  &\n');
    fprintf(fid, '   button_name = .gui.main.ppt\n');
    fprintf(fid, '!\n');

    % Create a plot page and add the measure curve
    fprintf(fid, 'xy_plots template create  &\n');
    fprintf(fid, '   template_name = handle_force_plot  &\n');
    fprintf(fid, '   title = "Handle Force"\n');
    fprintf(fid, '!\n');
    fprintf(fid, 'xy_plots curve create  &\n');
    fprintf(fid, '   curve_name = handle_force_plot.force_curve  &\n');
    fprintf(fid, '   x_axis_component = sim_time  &\n');
    fprintf(fid, '   y_axis_component = %s\n', cfg.measure_name);
    fprintf(fid, '!\n');

    % Export the curve data to tab-separated file
    fprintf(fid, 'file table write  &\n');
    fprintf(fid, '   file_name = "%s"  &\n', tab_file);
    fprintf(fid, '   comments = off  &\n');
    fprintf(fid, '   curve_name = handle_force_plot.force_curve  &\n');
    fprintf(fid, '   write_to = new_file  &\n');
    fprintf(fid, '   separator = tab\n');
    fprintf(fid, '!\n');

    % Stop Adams
    fprintf(fid, 'stop\n');

    fclose(fid);

    % --- 2. Run Adams/View in batch mode ---
    adams_cmd = sprintf('"%s" aview ru-st b "%s"', cfg.adams_bat, batch_cmd_file);

    fprintf('  Running Adams: %s\n', adams_cmd);
    fprintf('  Design vars: [%.4f, %.4f, %.4f, %.4f]\n', x(1), x(2), x(3), x(4));

    [status, cmdout] = system(adams_cmd);

    % Always save Adams console output for diagnostics
    log_file = fullfile(cfg.work_dir, 'adams_last_run.log');
    fid2 = fopen(log_file, 'w');
    fprintf(fid2, '%s', cmdout);
    fclose(fid2);

    if status ~= 0
        warning('Adams returned non-zero exit code: %d', status);
        fprintf('  Adams log saved to: %s\n', log_file);
        fprintf('  Please check the log for error details.\n');
    end

    % --- 3. Read results from tab file ---
    if ~isfile(tab_file)
        warning('Output file not found: %s', tab_file);
        fprintf('  Adams log saved to: %s\n', log_file);
        fprintf('  *** TROUBLESHOOTING ***\n');
        fprintf('  1. Open %s and check for errors\n', log_file);
        fprintf('  2. Try running run_batch.cmd manually in Adams/View:\n');
        fprintf('     File -> Run Script -> select run_batch.cmd\n');
        fprintf('  3. If export fails, run run_batch_alt.cmd (alternative method)\n');
        % Generate alternative batch file with different export method
        write_alt_batch_cmd(cfg, x);
        return;
    end

    [time, force] = read_handle_force_tab(tab_file);

    if ~isempty(force)
        fprintf('  Result: peak=%.2f N, RMS=%.2f N\n', max(abs(force)), rms(force));
    end
end

%% ==================== READ TAB FILE ======================================
function [time, force] = read_handle_force_tab(tab_file)
    % Reads handle_force.tab (Adams numeric results export)
    % Expected format: column 1 = time, column 2 = force value
    % Skips header lines that start with non-numeric characters

    time  = [];
    force = [];

    try
        fid = fopen(tab_file, 'r');
        if fid == -1
            warning('Cannot open file: %s', tab_file);
            return;
        end

        data = [];
        while ~feof(fid)
            line = fgetl(fid);
            if ischar(line)
                line = strtrim(line);
                % Skip empty lines and header lines
                if isempty(line) || ~isstrprop(line(1), 'digit') && line(1) ~= '-' && line(1) ~= '+'
                    continue;
                end
                vals = sscanf(line, '%f');
                if length(vals) >= 2
                    data = [data; vals(1), vals(2)]; %#ok<AGROW>
                end
            end
        end
        fclose(fid);

        if isempty(data)
            warning('No numeric data found in: %s', tab_file);
            return;
        end

        time  = data(:, 1);
        force = data(:, 2);

    catch ME
        warning('Error reading tab file: %s', ME.message);
        if exist('fid', 'var') && fid ~= -1
            fclose(fid);
        end
    end
end

%% ========== ALTERNATIVE BATCH CMD (backup export method) =================
function write_alt_batch_cmd(cfg, x)
    % Generates an alternative batch cmd using 'numeric_results' export
    % Try this if the primary 'file table write' method doesn't work
    alt_file = fullfile(cfg.work_dir, 'run_batch_alt.cmd');
    model_cmd_file = fullfile(cfg.work_dir, [cfg.model_name, '.cmd']);
    tab_file = fullfile(cfg.work_dir, cfg.output_file);

    fid = fopen(alt_file, 'w');
    if fid == -1; return; end

    fprintf(fid, '! Alternative batch command file (Method B)\n!\n');
    fprintf(fid, 'file command read file_name = "%s"\n!\n', model_cmd_file);

    fprintf(fid, 'variable modify variable_name = .MODEL_1.DV_LINK1_LENGTH real_value = %.10f\n', x(1));
    fprintf(fid, 'variable modify variable_name = .MODEL_1.DV_1 real_value = %.10f\n', x(2));
    fprintf(fid, 'variable modify variable_name = .MODEL_1.DV_2 real_value = %.10f\n', x(3));
    fprintf(fid, 'variable modify variable_name = .MODEL_1.DV_3 real_value = %.10f\n!\n', x(4));

    fprintf(fid, 'simulation single_run transient  &\n');
    fprintf(fid, '   type = auto_select  &\n');
    fprintf(fid, '   initial_static = no  &\n');
    fprintf(fid, '   end_time = %.4f  &\n', cfg.end_time);
    fprintf(fid, '   number_of_steps = %d  &\n', cfg.num_steps);
    fprintf(fid, '   model_name = .MODEL_1\n!\n');

    % Method B: use numeric_results (flat syntax, no line continuation)
    fprintf(fid, 'numeric_results select result_set_component_name = %s\n', cfg.measure_name);
    fprintf(fid, 'file numeric_results write file_name = "%s" write_to = new_file\n!\n', tab_file);

    % Method C: use results export (some Adams versions prefer this)
    % Uncomment below and comment above if Method B also fails:
    fprintf(fid, '! --- Method C (uncomment if Method B fails) ---\n');
    fprintf(fid, '! results export  &\n');
    fprintf(fid, '!    file_name = "%s"  &\n', tab_file);
    fprintf(fid, '!    result_set_component_name = %s\n!\n', cfg.measure_name);

    fprintf(fid, 'stop\n');
    fclose(fid);

    fprintf('  Alternative batch file written: %s\n', alt_file);
end
