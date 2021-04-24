clear all;
fo=150e3;
wo=2*pi*150e3;
Ls=22e-6;
Cs= 1/(wo^2*Ls);
f_a=1;
deltaM=0;
fx=[];
for f_i=155000:2500:165000
    fop=f_i;
    M_a=1;
    fx=[fx fop];
    Mx=[];
    for i=0.4:0.025:0.45
        deltaM=i;
        Mx=[Mx deltaM];
        sim('parallel_parallel',5e-3);
        P_1(f_a,M_a)=mean(ans.i_1);
        P_2(f_a,M_a)=mean(ans.i_2);
        M_a=M_a+1;
        [f_i/1e5 deltaM]
    end
    f_a=f_a+1
end

Pratio=P_1./(P_1+P_2);

[abx,aby] = meshgrid(fx/fo,Mx);
contourf(abx,aby,100*Pratio_u');
hold on;

xlabel('Normalized Frequency','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel('Normalized Mutual Difference ($ \frac{\Delta M}{M_1}$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)
colormap('jet');
