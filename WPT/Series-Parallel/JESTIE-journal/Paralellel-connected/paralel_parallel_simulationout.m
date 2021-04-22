clear all;
fo=150e3;
wo=2*pi*150e3;
Ls=22e-6;
Cs= 1/(wo^2*Ls);
f_a=1;
deltaM=0;
fx=[];
for f_i=100000:1000:200000
    fop=f_i;
    M_a=1;
    fx=[fx fop];
    Mx=[];
    for i=0.3
        deltaM=i;
        Mx=[Mx deltaM];
        sim('parallel_parallel',5e-3);
        P_1(f_a,M_a)=mean(ans.i_1);
        P_2(f_a,M_a)=mean(ans.i_2);
        M_a=M_a+1;
    end
    f_a=f_a+1
end

Pratio=P_1./(P_1+P_2);
% [abx,aby] = meshgrid(fx,Mx);
% contourf(abx,aby,100*Pratio');