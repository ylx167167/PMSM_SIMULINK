clear;
close;
clc;
Udc=1000;
R=0.2;
Ld=0.01;
Lq=0.02;
pn=4;
flux=2.5;
psif=flux;

Imax=300*sqrt(2);
Umax=Udc*2/pi;

fc=100000;
J=50;
Bm=0.000001;
Cm=0;

TL=[600,3000];
% A点
Idmax0=(-psif+sqrt(psif^2+8*(Ld-Lq)^2*Imax^2))/(4*(Ld-Lq));
Iqmax0=sqrt(Imax^2-Idmax0^2);

-psif/Ld;
-Imax;

a=4*(Ld-Lq)^2*Ld^2+4*Lq^2*(Ld-Lq)^2;
b=8*psif*Ld*(Ld-Lq)^2+4*psif*Lq*(Ld-Lq)*Ld;
c=4*psif^2*(Ld-Lq)^2+4*psif^2*Lq*(Ld-Lq)-4*Lq^2*(Ld-Lq)^2*Imax^2;


Bx=(-b-sqrt(b^2-4*a*c))/(2*a);
By=sqrt(Imax^2-Bx^2);

% B点
Idmax1=(-psif+sqrt(psif^2+8*(Ld-Lq)^2*Imax^2))/(4*(Ld-Lq));
Iqmax1=sqrt(Imax^2 - Idmax1^2);

a=4*(Ld-Lq)^2*Ld^2+4*Lq^2*(Ld-Lq)^2;
b=8*psif*Ld*(Ld-Lq)^2+4*psif*Lq*(Ld-Lq)*Ld;
c=4*psif^2*(Ld-Lq)^2+4*psif^2*Lq*(Ld-Lq)-4*Lq^2*(Ld-Lq)^2*Imax^2;

Idmax2=(-b-sqrt(b^2-4*a*c))/(2*a);
Iqmax2=sqrt(Imax^2-Idmax2^2);

we1=sqrt(Umax^2/((Ld*Idmax1+psif)^2+(Lq*Iqmax1)^2));
we2=sqrt(Umax^2/((Ld*Idmax2+psif)^2+(Lq*Iqmax2)^2));

rpm1=we1/pn/2/pi*60;
rpm2=we2/pn/2/pi*60;


%采用定义偏导法求解id iq MTPA曲线
iq1=-500:0.01:500; 
id1=(-psif+sqrt(4*(Ld-Lq)^2*iq1.^2+psif^2))/(2*(Ld-Lq));

%采用拉格朗日法求解id iq MTPV曲线
iq2=iq1;
id2=-psif/Ld+(-psif*Lq+Lq*sqrt(psif^2+4*(Ld-Lq)^2*iq2.^2))/(2*Ld*(Ld-Lq));

%极限电流圆 以(0,0)为圆心
id3=-Imax:0.01:Imax;
iq3=sqrt(Imax^2-id3.^2);

id4=id3;
iq4=-sqrt(Imax^2-id3.^2);

we=(we1+we2)/2;


%极限电压圆 以(φf/Ld,0)为圆心
iq5=id3;
id5=1/Ld*((sqrt((Umax^2/we^2)-(Lq.*iq5).^2)-psif));

iq6=id3;
id6=-2*psif/Ld-1/Ld*((sqrt((Umax^2/we^2)-(Lq.*iq5).^2)-psif));

N=size(id3,2);
first=N;
last=0;
for i=1:N
    if(isreal(id5(i)))
        if(first>=i)
            first=i;
        end
        if(last<=i)
            last=i;
        end
    end
end


v=-2;
iq5(last-v:end) = [];
id5(last-v:end) = [];

iq6(last-v:end) = [];
id6(last-v:end) = [];

iq5(1:first+v) = [];
id5(1:first+v) = [];

iq6(1:first+v) = [];
id6(1:first+v) = [];

figure;
hold on;
plot(id1,iq1,id2,iq2,"Linewidth",2);
plot(id3,iq3,id4,iq4,"Linewidth",2,'Color',[0.4660 0.6740 0.1880]);
plot(id5,iq5,id6,iq6,"Linewidth",2,'Color',[0.4940 0.1840 0.5560]);
legend("box","off", "Location" , "best");
grid on;

hold on;

Ox = (-psif+sqrt(psif^2+4*(Ld-Lq)^2*150^2))/(2*(Ld-Lq));
Oy = 150;

Ax = (-psif+sqrt(psif^2+8*(Ld-Lq)^2*Imax^2))/(4*(Ld-Lq));
Ay = sqrt(Imax^2-Ax^2);


we = we2+200;
CC= (-psif*Lq+sqrt(psif^2*Lq^2+8*(Ld-Lq)^2*Umax^2/we^2))/(4*(Ld-Lq));
Cx= (CC-psif)/Ld;
Cy= sqrt((Umax^2/we^2 - (Ld*Cx+psif)^2)/Lq^2);


we = we2-50;
Dx = (-psif*Ld+sqrt(psif^2*Ld^2-(Ld^2-Lq^2)*(psif^2+Lq^2*Imax^2-Umax^2/we^2)))/(Ld^2-Lq^2);
Dy = sqrt(Imax^2 - Dx^2);

plot(Ox,Oy,"o", Ax,Ay,"o", Bx,By,"o",Cx,Cy,"o", Dx, Dy,"o", "MarkerSize",10);
legend("MTPA","MTPV","i_{lim}1","i_[lim}2" ,"u_{lim}1" ,"u_{lim}2","Oxy", "Axy","Bxy","Cxy","Dxy");


title("曲线总览");
xlabel("id/A");
ylabel("iq/A");
box on;
hold off;









