clear all
fig = openfig('series_series_simulation_detailed.fig');
axObjs = fig.Children;
dataObjs = axObjs.Children;
x_fig = dataObjs(1).XData;
y_fig = dataObjs(1).YData;
z_fig = dataObjs(1).ZData;
Mx=y_fig(:,1);
fx=x_fig(1,:)*150e3;

z_fig(:,19)=z_fig(:,18);
z_fig(:,20)=(z_fig(:,18)+z_fig(:,23))/2;
z_fig(:,21)=(z_fig(:,18)+z_fig(:,23))/2;
z_fig(:,22)=z_fig(:,23);
Pratio=z_fig;



%%
kx=[];

fo=150e3;
wo=2*pi*150e3;
Ls=22e-6;
Cs=1/(wo^2*Ls);
RL=64;
M=9.7e-6; 
DeltaMx=[];

RL1k=[];
for DeltaM=0:0.025:1
    DeltaMx=[DeltaMx, DeltaM];
    RL1=[];
    wRL=[];
for  f=1e5:2.5e3:2e5
    w=2*pi*f;
    wRL=[wRL w];
    RL1=[RL1 1/(2-DeltaM)];
end
RL1k=[RL1k ; RL1];
end 
%%
Pratio2=100*abs(RL1k);
Pratio2(1,:)=50;
Pratio2(1,11)=50;
Pcorrect=(Pratio2-Pratio)./(Pratio);

% figure1=figure();

fig = openfig('D:\Github\Studies\WPT\Series-Parallel\JESTIE-journal\Series-connected\Simulation\Journal\RS_SM_simulation.fig');
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
hold on;
C=caxis;
caxis([C(1),C(2)])
[x,y] = meshgrid(wRL/wo,DeltaMx);
[c1,h1] =contour(x,y,round(100*Pcorrect),'TextStep',2.5,'LineWidth',2,...
    'LineColor',[1 1 1],...
    'LevelStep',2.5,...
    'LabelSpacing',400);
clabel(c1,h1);


% xlabel('Normalized Frequency','Interpreter','Latex','Fontname','Times new roman'...
%     , 'FontSize',14)
% 
% ylabel('Normalized Mutual Difference ($ \frac{\Delta M}{M_1}$)','Interpreter','Latex','Fontname','Times new roman'...
%     , 'FontSize',14)
% colormap('jet');
% % Create colorbar
% colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
%     'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
%     'Limits',[50 100],...
%     'FontSize',12,...
%     'FontName','Times New Roman');
% % colorbar.Title.String='Percentage(%)'
