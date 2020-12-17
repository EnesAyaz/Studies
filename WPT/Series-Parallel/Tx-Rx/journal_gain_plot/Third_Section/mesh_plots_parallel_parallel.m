syms k
syms Zs;
syms RL;
syms RL1;

a= (k^2-1)*RL^2-Zs^2;
b=2*RL*Zs^2;
c=(k^2-1)*RL^2*Zs^2;

ans=solve(a*RL1^2+ b*RL1+ c,RL1);
kx=[];

fo=150e3;
wo=2*pi*150e3;
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=9.7e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 

RL1k=[];
for DeltaM=0:0.01:1
 k=1-DeltaM;
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
    w=2*pi*f;
    wRL=[wRL w];
    Zs=abs((1i*w*Ls)/(1-w^2*Cs*Ls));
    Rx=  (RL*Zs^2 + RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
%  Rx= (RL*Zs^2 - RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
 
 
    RL1=[RL1 Rx];

   
end
RL1k=[RL1k ; RL1];
end


RL1k(RL1k<16)=16;
RL1k(isnan(RL1k))=32;

%%

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
RL2k=1./(1/RL-1./RL1k);
RL2k(RL2k>256)=256;
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

zlim([0 35])

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


zlim([0 256])



