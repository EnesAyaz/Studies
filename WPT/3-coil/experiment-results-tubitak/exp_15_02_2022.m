%% RL sweeep 10.5 20.8 41.5 69.2 103.7 ohm 300ns dead time
% f=147kHz

%Si
Vin=[50 50 50 50 50]; %V
IinSi= [5.20 3.31 1.98 1.35 1];% A
VoutSi=[42.9 51.34 57.17 60.5 63];
RL=[10.5 20.8 41.5 69.2 103.7];

PinSi= Vin.*IinSi;
PoutSi=VoutSi.^2./RL;
effSi=PoutSi./PinSi;



%SiC
Vin=[50 50 50 50 50]; %V
IinSiC= [4.57 3.05 1.86 1.28 0.97];% A
VoutSiC=[39.74 48.7 54.97 58.7 61.46];
RL=[10.5 20.8 41.5 69.2 103.7];

PinSiC= Vin.*IinSiC;
PoutSiC=VoutSiC.^2./RL;
effSiC=PoutSiC./PinSiC;

figure1=figure('Position',[0 0 600 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(RL,100*effSi,'Marker','x','Markersize',10,'Color','r')
hold on;
plot(RL,100*effSiC,'Marker','o','Color','b')
hold on;
xlim([0 120])
ylim([65 85])


ylabel('Efficiency ($\%$)','Interpreter','latex','FontSize',16);
xlabel('Load Resistance $R_L$ ($\Omega$) ','Interpreter','latex','FontSize',16);
legend('Si','SiC','Interpreter','latex',...
    'FontSize',14,...
    'EdgeColor','none',...
    'Color','none')
grid(axes1,'off');
hold(axes1,'off');
box(axes1,'on');
set(axe1,'YColor',[0 0 0])
%%
%% RL sweeep 10.5 20.8 41.5 69.2 103.7 ohm 300ns dead time
% f=147kHz

%Si
Vin=[50 50 50 50 50]; %V
IinSi= [5.20 3.31 1.98 1.35 1];% A
VoutSi=[42.9 51.34 57.17 60.5 63];
RL=[10.5 20.8 41.5 69.2 103.7];

PinSi= Vin.*IinSi;
PoutSi=VoutSi.^2./RL;
effSi=PoutSi./PinSi;
effSi=effSi*11.4/10.4;

%SiC
Vin=[50 50 50 50 50]; %V
IinSiC= [4.57 3.05 1.86 1.28 0.97];% A
VoutSiC=[39.74 48.7 54.97 58.7 61.46];
RL=[10.5 20.8 41.5 69.2 103.7];

PinSiC= Vin.*IinSiC;
PoutSiC=VoutSiC.^2./RL;
effSiC=PoutSiC./PinSiC;
effSiC=effSiC*11.4/10.4;

figure1=figure('Position',[0 0 600 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(axes1,'FontSize',14)

plot(PinSiC,100*effSi,'Marker','x','Markersize',10,'Color','r')
hold on;
plot(PinSiC,100*effSiC,'Marker','o','Color','b')
hold on;
xlim([40 250])
ylim([65 100])


ylabel('Efficiency ($\%$)','Interpreter','latex','FontSize',16);
% xlabel('Output Power (W) ','Interpreter','latex','FontSize',16);
% xlabel('Load Resistance ($\Omega$) ','Interpreter','latex','FontSize',16);
xlabel('Input Power (W) ','Interpreter','latex','FontSize',16);
legend('Si','SiC','Interpreter','latex',...
    'FontSize',14,...
    'EdgeColor','none',...
    'Color','none')
grid(axes1,'off');
hold(axes1,'off');
box(axes1,'on');
% set(axe1,'YColor',[0 0 0])




%% f sweep RL=20.8 Vin=20; 300ns dead time
%Si
f=[130 135 140 145 147 150 155 160 165 170 175 179];
IinSi=[ 0.18 0.4 1.16 1.7 1.27 0.81 0.44 0.3 0.22 0.17 0.13 0.11];
VoutSi= [3.65 8.13 17.3 22.43 19.7 15.1 10.64 8.41 6.9 5.75 4.71 3.85];
Vin=20;
RL=20.8;

PinSi= Vin.*IinSi;
PoutSi=VoutSi.^2./RL;
effSi=PoutSi./PinSi;
effSi=effSi*11.4/10.4;
% plot(f,effSi,'Marker','x')
% ylim([0 1])
% hold on;

%SiC
f=[130 135 140 145 147 150 155 160 165 170 175 179];
IinSiC=[0.15 0.36 1.2 1.66 1.23 0.77 0.42 0.3 0.22 0.17 0.13 0.11 ];
VoutSiC= [3.8 8.5 18.15 22.01 18.95 14.53 10.34 8.23 6.76 5.66 4.63 3.78];
Vin=20;
RL=20.8;

PinSiC= Vin.*IinSiC;
PoutSiC=VoutSiC.^2./RL;
effSiC=PoutSiC./PinSi;
effSiC=effSiC*11.4/10.4;
% plot(f,effSiC,'Marker','o')
% ylim([0 1])
% hold on;

figure1=figure('Position',[0 0 600 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(f,100*effSi,'Marker','x','Markersize',10,'Color','r')
hold on;
plot(f,100*effSiC,'Marker','o','Color','b')
hold on;
xlim([130 180])
ylim([15 100])


ylabel('Efficiency ($\%$)','Interpreter','latex','FontSize',16);
xlabel('Operating Frequency $f_{op}$ ($kHz$) ','Interpreter','latex','FontSize',16);
legend('Si','SiC','Interpreter','latex',...
    'FontSize',14,...
    'EdgeColor','none',...
    'Color','none')
grid(axes1,'off');
hold(axes1,'off');
box(axes1,'on');
% set(axe1,'YColor',[0 0 0])


%%  Vin sweep  300ns dead time RL=20.8 f=147kHz

% Si
Vin=[10.4 20.1 29.8 40.3 50];
IinSi=[0.64 1.28 1.94 2.63 3.31];
VoutSi=[9.6 19.8 29.9 40.76 51.12];
RL=20.8;
PinSi= Vin.*IinSi;
PoutSi=VoutSi.^2./RL;
effSi=PoutSi./PinSi;
effSi=effSi*11.4/10.4;

% plot(Vin,effSi)
% ylim([0 1])
% hold on;

%SiC
Vin=[10.4 20.1 29.8 40.3 50];
IinSiC=[0.6 1.19 1.8 2.40 3.04];
VoutSiC=[9.2 19 28.6 38.8 48.66];
RL=20.8;
PinSiC= Vin.*IinSiC;
PoutSiC=VoutSiC.^2./RL;
effSiC=PoutSiC./PinSiC;
effSiC=effSiC*11.4/10.4;

% plot(Vin,effSiC)
% ylim([0 1])


figure1=figure('Position',[0 0 600 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(Vin,100*effSi,'Marker','x','Markersize',10,'Color','r')
hold on;
plot(Vin,100*effSiC,'Marker','o','Color','b')
hold on;
xlim([0 60])
ylim([60 90])


ylabel('Efficiency ($\%$)','Interpreter','latex','FontSize',16);
xlabel('Input Voltage $V_{in}$ ($V$) ','Interpreter','latex','FontSize',16);
legend('Si','SiC','Interpreter','latex',...
    'FontSize',14,...
    'EdgeColor','none',...
    'Color','none')
grid(axes1,'off');
hold(axes1,'off');
box(axes1,'on');
% set(axe1,'YColor',[0 0 0])

%%


