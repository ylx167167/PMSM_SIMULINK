
%% 基础算法设置 PARK INVPARK CLARK INVCLARK
open_system('backbone')
set_param('backbone','SolverType','Fixed-step');
set_param('backbone','SolverName','FixedStepDiscrete');
set_param('backbone','FixedStep','0.000001');% 1Mhz

open_system('ParkTran')
set_param('ParkTran','SolverType','Fixed-step');
set_param('ParkTran','SolverName','FixedStepDiscrete');
set_param('ParkTran','FixedStep','0.000001');% 1Mhz
close_system('ParkTran')

open_system('InvParkTran')
set_param('InvParkTran','SolverType','Fixed-step');
set_param('InvParkTran','SolverName','FixedStepDiscrete');
set_param('InvParkTran','FixedStep','0.000001');% 1Mhz
close_system('InvParkTran')

open_system('ClarkTran')
set_param('ClarkTran','SolverType','Fixed-step');
set_param('ClarkTran','SolverName','FixedStepDiscrete');
set_param('ClarkTran','FixedStep','0.000001');% 1Mhz
close_system('ClarkTran')

open_system('InvClarkTran')
set_param('InvClarkTran','SolverType','Fixed-step');
set_param('InvClarkTran','SolverName','FixedStepDiscrete');
set_param('InvClarkTran','FixedStep','0.000001');% 1Mhz
close_system('InvClarkTran')

%% 电流控制算法：
% SVPWM %
open_system('SVPWM')
set_param('SVPWM','SolverType','Fixed-step');
set_param('SVPWM','SolverName','FixedStepDiscrete');
set_param('SVPWM','FixedStep','0.000001');% 1Mhz
close_system('SVPWM')

% BangBang(滞环控制) %
open_system('BangBang')
set_param('BangBang','SolverType','Fixed-step');
set_param('BangBang','SolverName','FixedStepDiscrete');
set_param('BangBang','FixedStep','0.000001');% 1Mhz
close_system('BangBang')

%% 测试：
open_system('testmodel1')
set_param('testmodel1','SolverType','Fixed-step');
set_param('testmodel1','SolverName','FixedStepDiscrete');
set_param('testmodel1','FixedStep','0.000001');% 1Mhz
close_system('testmodel1')
open_system('testmodel2')
set_param('testmodel2','SolverType','Fixed-step');
set_param('testmodel2','SolverName','FixedStepDiscrete');
set_param('testmodel2','FixedStep','0.000001');% 1Mhz
close_system('testmodel2')
%% backbone设置：
%仿真时长%
set_param('backbone','StopTime','0.5');
