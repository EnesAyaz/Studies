syms k
syms Zs;
syms RL;
syms RL1;

a= (k^2-1)*RL^2-Zs^2;
b=2*RL*Zs^2;
c=(k^2-1)*RL^2*Zs^2;

ans=solve(a*RL1^2+ b*RL1+ c,RL1);
kx=[];

Ls=8.8e-6;
Cs= 109e-9;
RL= 4;
M=4.1e-6; 

fx=120e3:1e3:200e3;
RL1k=[];
for DeltaM=0:0.1:0.3
 k=1-DeltaM;
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=fx
    w=2*pi*f;
    wRL=[wRL w];
    Zs=abs(1i*w*Ls+1./(1i*w*Cs));
    Rx=  (RL*Zs^2 + RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
%  Rx= (RL*Zs^2 - RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
 
    RL1=[RL1 Rx];

   
end
RL1k=[RL1k ; RL1];
end

RL1k(RL1k<4)=4;

%%
fo=160e3;
wo=2*pi*fo;
Ls=8.8e-6;
Cs= 109e-9;
RL= 4;
M=4.1e-6; 
k=0.22;
Lp=43.6e-6;
Cp=22e-9;
Vrx=[];
wRL=[];

for f=fx
    w=2*pi*f;
    wRL=[wRL w];
    Zp=1i*w*Lp+(1/(1i*w*Cp));
    Zs=1i*w*Ls+(1/(1i*w*Cs))+RL;
    I=1/(Zp+(w^2*M^2/Zs));
    V=w*M*I;
    Vrxs=V*RL/(RL+Zs);
    Vrx=[Vrx Vrxs];
end





% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
colororder([0 0.447 0.741]);

% Activate the left side of the axes
yyaxis(axes1,'left');
% Create multiple lines using matrix input to plot

plot1 = plot(wRL/2/pi/1000,4./RL1k(1,:),'Parent',axes1,'LineStyle','none');
plot2 = plot(wRL/2/pi/1000,1-4./RL1k(1,:),'Parent',axes1,'LineStyle','none');
plot3 = plot(wRL/2/pi/1000,4./RL1k(2,:),'Parent',axes1,'LineStyle','none');
plot4= plot(wRL/2/pi/1000,1-4./RL1k(2,:),'Parent',axes1,'LineStyle','none');
plot5 = plot(wRL/2/pi/1000,4./RL1k(3,:),'Parent',axes1,'LineStyle','none');
plot6 = plot(wRL/2/pi/1000,1-4./RL1k(3,:),'Parent',axes1,'LineStyle','none');


set(plot1,'DisplayName','RX1-case A','LineWidth',2,'Color',[0.8 0 0],...
    'LineStyle','-');
set(plot2,'DisplayName','RX2-case A','LineWidth',2,'LineStyle','--',...
    'Color',[0 0 0.8]);
set(plot3,'DisplayName','RX1-case B','Marker','>','Color',[0.8 0 0]);
set(plot4,'DisplayName','RX2-case B','Marker','>','Color',[0 0 0.8]);
set(plot5,'DisplayName','RX1-case C','Marker','o','Color',[0.8 0 0]);
set(plot6,'DisplayName','RX2-case C','Marker','o','Color',[0 0 0.8]);

% Create ylabel
ylabel('Normalized Power','FontName','Times New Roman');
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);
ylim([-0.05 1.05])
% Set the remaining axes properties
set(axes1,'YColor',[0.8 0 0.8]);
% Activate the right side of the axes
yyaxis(axes1,'right');
% Create plot
plot(wRL/2/pi/1000, abs(Vrx/max(Vrx)),'DisplayName','V_{out}/V_{in}','LineWidth',2,'Color',[0 0 0]);

% Create ylabel
ylabel({'Normalized Gain'},'FontName','Times New Roman');
ylim([-0.05 1.05])
% Set the remaining axes properties
set(axes1,'YColor',[0 0 0]);
% Create xlabel
xlabel({'Frequency (kHz)'},'FontName','Times New Roman');

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',14);
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.424404765310739 0.159652468540832 0.232142852938601 0.349999990065893],...
    'FontSize',12,...
    'Color','none','box','off');

