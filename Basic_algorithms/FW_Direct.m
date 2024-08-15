% 基于直接计算法的弱磁控制
% 参数：
% isPidref 经过pid 调节后的定子电流 UI 最大电压和最大电流
% LdLqPnFluxRs d轴电感 q轴电感 极对数 磁链 定子电阻
% 返回值:
% 输出idref iqref 为输出的id iq电流 Zone 为当前所采取的控制  

function [idref, iqref,Zone] =FW_Direct(isPidref, UI, LdLqPnFluxRs,we)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               读取数据             % 
Udc=UI(1);
I=UI(2);
Ld=LdLqPnFluxRs(1);
Lq=LdLqPnFluxRs(2);
pn=LdLqPnFluxRs(3);%转子对数
flux=LdLqPnFluxRs(4);%永磁体磁链
Rs=LdLqPnFluxRs(5); %定子电阻
Zone=0;


Umax=Udc*2/pi; %最大电压限制
Imax=I*sqrt(2);% 最大电流限制
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        计算过渡转速 We_a 与 We_b   %
IdA=(-flux+sqrt(flux^2+8*(Ld-Lq)^2*Imax^2))/(4*(Ld-Lq));
IqA=sqrt(Imax^2 - IdA^2);
We_a=sqrt(Umax^2/((Ld*IdA+flux)^2+(Lq*IqA)^2));

tempB_a=-flux*Ld*(2*Ld-Lq);
tempB_b=2*(Ld^2+Lq^2)*(Ld-Lq);
tempB_c=Ld^2*(2*Ld-Lq)^2-4*Ld*(Ld-Lq)*(Ld^2+Lq^2);
tempB_d=Lq^2*(Ld-Lq)^2*(Ld^2+Lq^2);
tempB_e=sqrt(tempB_c*flux^2+4*Imax^2*tempB_d);
IdB=tempB_a+tempB_e/tempB_b;
IqB=sqrt(Imax^2-IdB^2);
We_b=sqrt(Umax^2/((Ld*IdB+flux)^2+(Lq*IqB)^2));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(we<=We_a)
    if(isPidref<IqA) 
        % MPTA控制
        iqref = isPidref; 
        idref=-flux+sqrt(flux^2+4*(Ld-Lq)^2*iqref^2)/(2*(Ld-Lq)); 
        Zone=0;
    else
        % 此时已达最大
        iqref=IqA;
        idref=IdA;
        Zone=1;
    end
else
    if(we<We_b)
        %FW
        idAB =(-flux*Ld+sqrt(flux^2*Ld^2-(Ld^2-Lq^2)*(flux^2+Lq^2*Imax^2-(Umax/we)^2)))/(Ld^2-Lq^2);
        iqAB =sqrt(Imax^2 - idAB^2);
        if(isPidref<iqAB)
            idref=(-flux*Ld+sqrt(flux^2*Ld^2-(Ld^2-Lq^2)*(flux^2+Lq^2*isPidref^2-(Umax/we)^2)))/(Ld^2-Lq^2);
            iqref=isPidref;
            Zone=2;
        else
            idref=idAB;
            iqref=iqAB;
            Zone=3;
        end
    else
        idMTPV=-flux/Ld+(-flux*Lq+sqrt(flux^2*Lq^2+8*(Ld-Lq)^2*(Umax/we)^2))/(4*Ld*(Ld-Lq));
        iqMTPV=sqrt((Umax^2/we^2 - (Ld*idMTPV*flux)^2)/Lq^2); 
        if(isPidref<iqMTPV)
            iqref=isPidref;             
            idref=-flux/Ld+(-flux*Lq+Lq*sqrt(flux^2+4*(Ld-Lq)^2*iqref^2))/(2*Ld*(Ld-Lq));
            Zone=5;
        else
            idref=idMTPV;
            iqref=iqMTPV;
            Zone=4;
        end
    end
end


























