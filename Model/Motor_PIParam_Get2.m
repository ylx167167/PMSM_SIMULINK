function Motor_PIParam_Get2(~)

%----------------------------------------基本参数--------------------------------------------------------%
%4V/1000rpm
r=0.33;
Ld=5.2e-3;
Lq=17.4e-3;
Ts=0.0001;
%Ke=4/1000; 
pole=2;
J=0.008;
B=0.008;
flux=0.646;
fx=0;

%----------------------------------------PI等参数计算--------------------------------------------------------%
%由反电动势常数计算磁链
%flux=10*sqrt(6)*Ke/(pi*pole);
% r : 欧姆
% LS：H

%电流环PI计算
A=[Ld/r Lq/r];
wc=2*pi/(min(A));
kcpd=wc*Ld;
kcpq=wc*Lq;
kci=wc*r;
 
%速度环PI计算
wn=wc/20;
Ba_temp=(wn*J-B)/(1.5*pole*flux);
%观察仿真结果，我们可以看出，系统响应速度较快，但是振荡得比较严重，系统不稳定。
%所以我们可以调节有功阻尼增益，减小有功阻尼增益，由表达式可以看出，转速环带宽与阻尼增益成正比。
% 根据自动控制原理可知，带宽越大，系统的快速性越好，稳定变差。B_a=0.13/10 B_a=0.013。PI参数不变。
Ba=Ba_temp/10;
kvp=wn*J/(1.5*pole*flux);
kvi=wn*kvp;

%----------------------------------------数据打印--------------------------------------------------------%
str='wc value is: ';
str=[str,num2str(wc)];
disp(str);

str='kcpd value is: ';
str=[str,num2str(kcpd)];
disp(str);

str='kcpq value is: ';
str=[str,num2str(kcpq)];
disp(str);

str='kci value is: ';
str=[str,num2str(kci)];
disp(str);

str='wn value is: ';
str=[str,num2str(wn)];
disp(str);

str='Ba value is: ';
str=[str,num2str(Ba)];
disp(str);

str='kvp value is: ';
str=[str,num2str(kvp)];
disp(str);

str='kvi value is: ';
str=[str,num2str(kvi)];
disp(str);
