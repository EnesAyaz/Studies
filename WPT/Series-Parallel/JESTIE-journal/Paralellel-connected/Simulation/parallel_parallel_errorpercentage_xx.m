%%
fig = openfig('parallel_parallel_simulation_detailed.fig');
axObjs = fig.Children;
dataObjs = axObjs.Children;
x_fig = dataObjs(1).XData;
y_fig = dataObjs(1).YData;
z_fig = dataObjs(1).ZData;
Mx=y_fig(:,1);
fx=x_fig(1,:)*150e3;
Pratio=z_fig;
kx=[];
RLaak=[];
DeltaMx=[];
fo=150e3;
wo=2*pi*fo;
Qrx=4;
size_Mx=size(Mx);
size_fx=size(fx);

fo=150e3;
wo=2*pi*150e3;
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=9.7e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 

RL1k=[];
DeltaMx=[];
for i=1:1:size_Mx(1)
 DeltaM=Mx(i);
 DeltaMx=[DeltaMx, DeltaM];
 DeltaM=DeltaM*M;
 RL1=[];
 wRL=[];
for  w_i=1:1:size_fx(2)
   w=2*pi*fx(w_i);
   wi(w_i)=w;
   wRL=[wRL w/wo];
   Zrx=1i*w*Ls+1/(1i*w*Cs);
   Zc=-1/(1i*w*Cs);
   Z=[ Zrx Zc 0 0 ; Zc RL-Zc RL 0 ; 0 RL RL-Zc Zc; 0 0 Zc Zrx];
   I=inv(Z)*[M;0;0;M-DeltaM];
   Rx= abs((I(2)+I(3))/I(2));
   RL1=[RL1 Rx];
end
RLaak=[RLaak ; RL1];
end 
RLaak(RLaak<=1)=1;


Pratio2=100./abs(RLaak);
% Pratio2(1,11)=50;
Pcorrect=(Pratio2-Pratio)./(Pratio);


figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

[x,y] = meshgrid(wRL/(2*pi*fo),DeltaMx);
contourf(x,y,100*(Pcorrect));

colorbar
xlabel('Normalized Frequency','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel('Normalized Mutual Difference ($ \frac{\Delta M}{M_1}$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)
colormap('jet');
% Create colorbar
% colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
%     'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
%     'Limits',[50 100],...
%     'FontSize',12,...
%     'FontName','Times New Roman');
% colorbar.Title.String='Percentage(%)'

