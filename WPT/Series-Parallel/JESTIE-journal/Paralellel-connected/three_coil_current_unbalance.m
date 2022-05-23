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
Ls=68e-6;
Cs= 1/(wo^2*Ls);
RL= 16;
M=17e-6; 


RL1k=[];
for DeltaM=0:0.025:0.025
 k=1-DeltaM;
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=100e3:1e3:200e3
    w=2*pi*f;
    wRL=[wRL w];
    Zs=abs(1i*w*Ls+1./(1i*w*Cs));
    Rx=  (RL*Zs^2 + RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
%  Rx= (RL*Zs^2 - RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
 
    RL1=[RL1 Rx];

   
end
RL1k=[RL1k ; RL1];
end

RL1k(RL1k<16)=16;
RL1k(1,51)=32;


% plot(wRL, (16./RL1k(1,:)))
% plot(wRL, (1-16./RL1k(1,:)))
figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');
hold on;
plot(wRL, (16./RL1k(2,:)))
plot(wRL, 1-(16./RL1k(2,:)))



fo=150e3;
wo=2*pi*149e3;
Ls=68e-6;
Cs= 1/(wo^2*Ls);
RL= 16;
M=17e-6; 
k=0.20;
wo=2*pi*150e3;
Lp=(M^2/k^2)/Ls;
Cp=1/(wo^2*Lp);
Vrx=[];
wRL=[];
for f=100e3:1e3:200e3
    w=2*pi*f;
    wRL=[wRL w];
    Zp=1i*w*Lp+(1/(1i*w*Cp));
    Zs=1i*w*Ls+(1/(1i*w*Cs))+RL;
    I=1/(Zp+(w^2*M^2/Zs));
    V=w*M*I;
    Vrxs=V*RL/(RL+Zs);
    Vrx=[Vrx Vrxs];
end

figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');
hold on;
plot(wRL, Vrx)


%%
figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

yyaxis lef
plot(wRL/2/pi/1000, (16./RL1k(2,:)),'color','r')
hold on
plot(wRL/2/pi/1000, 1-(16./RL1k(2,:)),'color','r')
ylim([0 1])

yyaxis right 
plot(wRL/2/pi/1000, Vrx/max(Vrx),'color','b')
ylim([0 1])

%%

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
colororder([0 0.447 0.741]);

% Activate the left side of the axes
yyaxis(axes1,'left');
% Create multiple lines using matrix input to plot
% X1=[wRL/2/pi/1000 ; wRL/2/pi/1000] ;
% YMatrix1= [1-(16./RL1k(1,:)) ; 1-(16./RL1k(2,:))];
plot(wRL/2/pi/1000,16./RL1k(2,:),'Color',[1 0 0]);
hold on;
plot(wRL/2/pi/1000,1-(16./RL1k(2,:)),'Color',[1 0 0]);
% Create ylabel
ylabel({'Normalized Power'},'FontSize',16);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 1]);

% Set the remaining axes properties
set(axes1,'YColor',[1 0 0]);
% Activate the right side of the axes
yyaxis(axes1,'right');
% Create plot
plot(wRL/2/pi/1000, Vrx/max(Vrx),'Color',[0 0 1]);

% Create ylabel
ylabel({'Normalized Gain'},'FontSize',16);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);

% Set the remaining axes properties
set(axes1,'YColor',[0 0 1]);
% Create xlabel
xlabel({'Frequency (kHz)'},'FontSize',16);

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',14);

% Create textarrow
annotation(figure1,'textarrow',[0.641071428571428 0.578571428571429],...
    [0.545238095238095 0.502380952380954],'String',{'V_R_x'},'FontSize',14,...
    'FontName','Times New Roman');

% Create textarrow
annotation(figure1,'textarrow',[0.323214285714286 0.360714285714286],...
    [0.766666666666667 0.728571428571429],'String',{'Rx_1'},'FontSize',14,...
    'FontName','Times New Roman');

% Create textarrow
annotation(figure1,'textarrow',[0.308928571428571 0.339285714285714],...
    [0.319047619047619 0.366666666666667],'String',{'Rx_2'},'FontSize',14,...
    'FontName','Times New Roman');

% Create textbox
annotation(figure1,'textbox',...
    [0.422428571428571 0.147619047619048 0.199 0.130952380952381],...
    'String',{' One module','power transfer'},...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create rectangle
annotation(figure1,'rectangle',...
    [0.40892857142857 0.126190476190477 0.207142857142857 0.795238095238096],...
    'Color','none',...
    'FaceColor',[1 0 1],...
    'FaceAlpha',0.1);



%%

figure();
DeltaM=0:0.01:1;
[x,y] = meshgrid(wRL/2000/pi,DeltaM);
contourf(x,y,16./RL1k);

%%
%%
kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Qrx=4;
for DeltaM=0:0.01:1
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for w=0.667*wo:0.01:1.33*wo
    a=(Qrx*(w^2-wo^2))/(w*wo);
    b=(1-k^2);
    c=1/((b/a^2)+1);
    d=k^2- (((1-k^2)^2)/a^2);
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;


% figure();
% DeltaM=0:0.01:1;
% [x,y] = meshgrid(wRL/2000/pi,DeltaM);
% contourf(x,y,1./RL1k);


figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

[x,y] = meshgrid(wRL,DeltaMx);
contourf(x,y,100./abs(RL1k));
hold on;

xlabel('Normalized Frequency','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel('Normalized Mutual Difference ($ \frac{\Delta M}{M_1}$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)
colormap('jet');
% Create colorbar
colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
    'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
    'Limits',[50 100],...
    'FontSize',12,...
    'FontName','Times New Roman');
% colorbar.Title.String='Percentage(%)'
%%

wo=1;
DeltaM=0.5;
k=(1-DeltaM);
Qrx=3.2;
w=115/150;
a=(Qrx*(w^2-wo^2))/(w*wo);
b=(1-k^2);
c=1/((b/a^2)+1);
d=k^2- (((1-k^2)^2)/a^2);
Rx=c+ ((sqrt(d))/((b/a^2)+1));
100/Rx