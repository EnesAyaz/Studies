syms k
syms Zs;
syms RL;
syms RL1;

a= -4*k;

b=2*(1+k)^2*RL;
c=-4*k*Zs^2-(1+k)^2*RL^2;

ans=solve(a*RL1^2+ b*RL1+ c,RL1)
kx=[];
%%
fo=150e3;
wo=2*pi*150e3;
Ls=68e-6;
Cs= 1/(wo^2*Ls);
% RL= 16;
% M=17e-6; 
RL= 64;
M=17e-6; 

k=1;
% kx=[kx ((2*k)/(1+k))]

% M1=M*(1+a1);
% M2=M*(1-a1);
RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
    w=2*pi*f;
   wRL=[wRL w];
    Zs=abs(1i*w*Ls+1./(1i*w*Cs));
    Rx= (RL + 2*RL*k + RL*k^2 + (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
     Rx=(RL + 2*RL*k + RL*k^2 - (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
    RL1=[RL1 Rx];

   
end

RL1(RL1>=64)=64;
plot(wRL/(2*pi),RL1/32,'LineWidth',3);
hold on; 
plot(wRL/(2*pi),(RL-RL1)/32,'--','LineWidth',3);
hold on;
% plot(wRL/(2*pi),RL-RL1,'LineWidth',3);

%%
line([1e5 2e5], [32 32],'LineWidth',3)
%%

legend('k=0','k=0.1','k=0.2','k=0.4','k=0.6','k=0.8','k=1')

% Create ylabel
ylabel('Resistance of dominant module(\Omega)','LineWidth',2,'FontSize',24);

% Create xlabel
xlabel('Frequency(f/f_o)','LineWidth',2,'FontSize',24);

% Create title
title('Series Compensation and Series DC BUS','LineWidth',2,'FontSize',24,...
    'FontName','Times New Roman');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'XTick',...
    [105000 120000 135000 150000 165000 180000 195000 210000 225000 240000 255000 270000 285000 300000],...
    'XTickLabel',...
    {'0.7','0.8','0.9','1','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2'});
% Create legend
set(legend,'FontSize',15,'FontName','Times New Roman','Location','best');

%%

