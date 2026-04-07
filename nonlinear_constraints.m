function [c, ceq] = nonlinear_constraints(x, x0)
% NONLINEAR_CONSTRAINTS  优化的非线性约束函数
%
%   输入:
%     x  - 当前设计变量 [DV_LINK1_LENGTH, DV_1, DV_2, DV_3]
%     x0 - 初始设计变量 (参考值)
%
%   输出:
%     c   - 不等式约束 c(x) <= 0
%     ceq - 等式约束 ceq(x) = 0 (此处为空)
%
%   约束说明:
%
%   1. 连杆长度变化率约束:
%      DV_LINK1_LENGTH 的变化不超过初始值的 15%
%      这保证连杆不会因为过大变形导致机构卡死或干涉
%
%   2. 响铃位置相对距离约束:
%      DV_1, DV_2, DV_3 组成的坐标点, 其相对于原点的距离
%      不超过初始距离的 25%, 防止响铃位置偏移过大导致装配干涉
%
%   3. 响铃位置各分量协调约束:
%      任意两个坐标分量的变化率之差不超过 30%
%      防止响铃位置发生极端偏移 (某一方向大幅变化而其他方向不变)

    ceq = [];  % 无等式约束

    % ---- 约束 1: 连杆长度变化率 <= 15% ----
    link_ratio = abs(x(1) - x0(1)) / x0(1);
    c1 = link_ratio - 0.15;

    % ---- 约束 2: 响铃位置距离变化率 <= 25% ----
    dist_current = norm(x(2:4));
    dist_initial = norm(x0(2:4));
    dist_ratio = abs(dist_current - dist_initial) / dist_initial;
    c2 = dist_ratio - 0.25;

    % ---- 约束 3: 坐标分量变化协调性 ----
    %  各分量的变化百分比之间的差不超过 30%
    pct_change = abs((x(2:4) - x0(2:4)) ./ x0(2:4));
    c3_12 = abs(pct_change(1) - pct_change(2)) - 0.30;
    c3_13 = abs(pct_change(1) - pct_change(3)) - 0.30;
    c3_23 = abs(pct_change(2) - pct_change(3)) - 0.30;

    c = [c1; c2; c3_12; c3_13; c3_23];
end
