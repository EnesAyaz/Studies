fo=150e3;
wo=2*pi*150e3;
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=9.7e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 

RL1k=[];
DeltaMx=[];
for DeltaM=0:0.01*M:1*M
 DeltaMx=[DeltaMx, DeltaM/M];
 RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
   w=2*pi*f;
   wRL=[wRL w/wo];
   Zrx=1i*w*Ls+1/(1i*w*Cs);
   Zc=-1/(1i*w*Cs);
   Z=[ Zrx Zc 0 0 ; Zc RL-Zc RL 0 ; 0 RL RL-Zc Zc; 0 0 Zc Zrx];
   I=inv(Z)*[M;0;0;M-DeltaM];
   Rx= abs((I(2)+I(3))/I(2));
   RL1=[RL1 Rx];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;
%%

figure1=figure();
set(gcf, 'Position',  [100, 100, 600, 300])

axes1 = axes('Parent',figure1);
hold(axes1,'on');
[x,y] = meshgrid(wRL,DeltaMx);
contourf(x,y,100./abs(RL1k));
hold on;

xlabel('Normalized Frequency($f_r$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel({'$ \frac{\Delta M}{M_{(1)}}$'},'Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',18)
set(axes1,'XTick',[0.7 0.8 0.9 1 1.1 1.2 1.3],'YTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
colormap('jet');
% Create colorbar
colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
    'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
    'Limits',[50 100],...
    'FontSize',12,...
    'FontName','Times New Roman');

% Create textbox
annotation(figure1,'textbox',...
    [0.794659804983763 0.00162188485637581 0.210417881816656 0.136059148058712],...
    'Color',[1 0 0],...
    'String',{'$\%\frac{P_{(1)}}{P_{(1)}+P_{(2)}}100$'},...
    'Interpreter','latex',...
    'FontWeight','bold',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FontAngle','italic',...
    'FitBoxToText','off',...
    'EdgeColor','none');
%%
syms w;
syms Ls;
syms Cs;
syms RL; 
syms M1;
syms M2;

Zrx=1i*w*Ls+1/(1i*w*Cs);
   Zc=-1/(1i*w*Cs);
   Z=[ Zrx Zc 0 0 ; Zc RL-Zc RL 0 ; 0 RL RL-Zc Zc; 0 0 Zc Zrx];
   I=inv(Z)*[M1;0;0;M2];
   I(2)
