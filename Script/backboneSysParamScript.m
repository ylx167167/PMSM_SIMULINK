
%% 基础算法设置 PARK INVPARK CLARK INVCLARK
set_param('backbone','SolverType','Fixed-step');
set_param('backbone','SolverName','FixedStepDiscrete');
set_param('backbone','FixedStep','0.000001');% 1Mhz

set_param('ParkTran','SolverType','Fixed-step');
set_param('ParkTran','SolverName','FixedStepDiscrete');
set_param('ParkTran','FixedStep','0.000001');% 1Mhz

set_param('InvParkTran','SolverType','Fixed-step');
set_param('InvParkTran','SolverName','FixedStepDiscrete');
set_param('InvParkTran','FixedStep','0.000001');% 1Mhz

set_param('ClarkTran','SolverType','Fixed-step');
set_param('ClarkTran','SolverName','FixedStepDiscrete');
set_param('ClarkTran','FixedStep','0.000001');% 1Mhz

set_param('InvClarkTran','SolverType','Fixed-step');
set_param('InvClarkTran','SolverName','FixedStepDiscrete');
set_param('InvClarkTran','FixedStep','0.000001');% 1Mhz
%% 电流控制算法：
% SVPWM %
set_param('SVPWM','SolverType','Fixed-step');
set_param('SVPWM','SolverName','FixedStepDiscrete');
set_param('SVPWM','FixedStep','0.000001');% 1Mhz

% BangBang(滞环控制) %
set_param('BangBang','SolverType','Fixed-step');
set_param('BangBang','SolverName','FixedStepDiscrete');
set_param('BangBang','FixedStep','0.000001');% 1Mhz

%% 测试：
set_param('testmodel1','SolverType','Fixed-step');
set_param('testmodel1','SolverName','FixedStepDiscrete');
set_param('testmodel1','FixedStep','0.000001');% 1Mhz

set_param('testmodel2','SolverType','Fixed-step');
set_param('testmodel2','SolverName','FixedStepDiscrete');
set_param('testmodel2','FixedStep','0.000001');% 1Mhz

%% backbone设置：
%仿真时长%
set_param('backbone','StopTime','0.5');
