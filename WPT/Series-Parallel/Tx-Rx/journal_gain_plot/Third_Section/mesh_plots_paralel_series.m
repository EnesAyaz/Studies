%% paralel-series
syms k
syms Zs;
syms RL;
syms RL1;

a= -4*k;
b=2*(1+k)^2*RL;
c=-4*k*Zs^2-(1+k)^2*RL^2;
ans=solve(a*RL1^2+ b*RL1+ c,RL1);
kx=[];

fo=150e3;
wo=2*pi*150e3;
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 64;
M=9.7e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 

% DeltaM=0:0.01:1

RL1k=[];
for DeltaM=0:0.01:1
 k=(2*DeltaM-DeltaM*DeltaM)/4;
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
   w=2*pi*f;
   wRL=[wRL w];
   Zs=abs((1i*w*Ls)/(1-w^2*Cs*Ls));
   Rx= (RL + 2*RL*k + RL*k^2 + (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
   Rx=(RL + 2*RL*k + RL*k^2 - (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
   RL1=[RL1 Rx];
   
end
RL1k=[RL1k ; RL1];
end 

RL1k(RL1k>=64)=64;

% plot(wRL/(2*pi),RL1/32,'LineWidth',3);
% hold on; 
% plot(wRL/(2*pi),(RL-RL1)/32,'--','LineWidth',3);
% hold on;
%%
i=1;
for i=1:length(kx)
plot3(kx(i)*ones(size(wRL)),wRL/2000/pi,RL1k(i,:))
hold on;

end
%%
% RL1k(RL1k==64)=NaN;
% i=1;
% for i=1:length(kx)
% plot3(kx(i)*ones(size(wRL)),wRL/2000/pi,RL1k(i,:))
% hold on;
% 
% end
%%
figure();
DeltaM=0:0.01:1;
[x,y] = meshgrid(wRL/2000/pi,DeltaM);
mesh(y,x,RL1k)
%%
figure();
RL2k=RL-RL1k;
mesh(y,x,RL2k)


%%
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create mesh
mesh(y,x,RL1k,'Parent',axes1);

% Create zlabel
zlabel('Resitance($\Omega$)','Interpreter','latex','FontSize',15);

% Create ylabel
ylabel('Frequency ($\frac{f}{f_r}$)','Rotation',-25,'Interpreter','latex','FontSize',15);

% Create xlabel
xlabel({'Misalignment Coefficient $\frac{\Delta M}{M}$'},'Rotation',12,...
    'Interpreter','latex','FontSize',15);

view(axes1,[-37.5 30]);
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'YTick',[100 120 150 180 200],'YTickLabel',...
    {'0.66','0.8','1','1.2','1.34'});

zlim([0 65])

%%

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create mesh
mesh(y,x,RL2k,'Parent',axes1);

% Create zlabel
zlabel('Resitance($\Omega$)','Interpreter','latex','FontSize',15);

% Create ylabel
ylabel('Frequency ($\frac{f}{f_r}$)','Rotation',-25,'Interpreter','latex','FontSize',15);

% Create xlabel
xlabel({'Misalignment Coefficient $\frac{\Delta M}{M}$'},'Rotation',12,...
    'Interpreter','latex','FontSize',15);

view(axes1,[-37.5 30]);
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'YTick',[100 120 150 180 200],'YTickLabel',...
    {'0.66','0.8','1','1.2','1.34'});

zlim([0 65])

%%

figure1 = figure;
colormap(jet);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create mesh
mesh(y,x,RL1k,'Parent',axes1);

% Create zlabel
zlabel('Resitance($\Omega$)','FontSize',15,'Interpreter','latex');

% Create ylabel
ylabel({'Frequency ($\frac{f}{f_r}$)'},'FontSize',15,'Interpreter','latex');

% Create xlabel
% xlabel({'Misalignment Coefficient $\frac{\Delta M}{M}$'},'FontSize',15,...
%     'FontName','Times New Roman',...
%     'Rotation',12,...
%     'Interpreter','latex');

% Uncomment the following line to preserve the Z-limits of the axes
% zlim(axes1,[0 65]);
view(axes1,[-90,90]);
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'YTick',[100 120 150 180 200],'YTickLabel',...
    {'0.66','0.8','1','1.2','1.34'});
% Create colorbar
colorbar(axes1,'Position',...
    [0.0838343335769441 0.173413734382315 0.0222222222222223 0.68878822952452],...
    'TickLabelInterpreter','latex',...
    'FontWeight','bold',...
    'FontSize',15,...
    'FontName','Times New Roman');


