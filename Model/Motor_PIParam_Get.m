%% 初始参数区 电机模型1
T=2000;         %一个PWM计数周期
CCR=1000;       %三角波中的最大值，为T的一半
U_dc=311;       %三相电机供电电压为311V
m=sqrt(3)*T/U_dc;

p=4;
L_d=5.25e-3;    %H
L_q=12e-3;      %H
R=0.958;        %Ω
fai_f=0.1827;   %磁链 Wb
J=0.003;        %转动惯量kg·m²
B=0.008;        %阻尼系数N·m·s

zeta=0.707;     %阻尼比ζ

T_is = 1.25e-4;     %电流环频率为8KHz，一个周期为0.000125s
T_ss = 1e-3;        %速度环频率为1KHz，一个周期为0.001s

%% MTPA计算式中预计算
L_d_L_q=L_d-L_q;                        %直交轴电感差值
a_1 = 4*(fai_f^2-4*(L_d-L_q)^2);        %表示iq计算式中的一个洗漱

%% 电流环PI参数整定
K_iqp = L_q/(6*T_is*zeta^2);     %电流环PI整定参数Iq Kp
K_iqi = R/(6*T_is*zeta^2);       %电流环PI整定参数Iq Ki

K_idp = L_q/(6*T_is*zeta^2);     %电流环PI整定参数Id Kp
K_idi = R/(6*T_is*zeta^2);       %电流环PI整定参数Id Ki

%% 速度环PI参数整定
K_sp = pi*J/(180*p*fai_f*zeta^2*T_ss);      	%方法1计算 速度环PI整定参数Kp
K_si = 2;                                       %速度环PI参数Ki 直接给定

% K_sp = pi*J/(3*p*fai_f*T_ss);      %方法2计算 速度环PI整定参数Kp
% K_si = pi*J/(15*p*fai_f*T_ss^2);      



