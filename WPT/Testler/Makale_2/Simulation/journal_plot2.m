
clear all;
load('JournalEmerging.mat');

time=timeFA150(3)-timeFA150(2);
time=[0 :time : time*(length(FA_150_DC_Ip)-1)]';
time=time*1e3;
xl=[0,1.5e-5]*1e3;
%%
% Comparison Full-Align
% Decoupled 150 Khz
% Decoupled 135 kHz
% Coupled 150 kHz

figure();
subplot(3,1,1);

plot(time,FA_150_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,FA_150_DC_Is2*5,'Color','b','LineWidth',2)
xticklabels([])

Is1= rms(FA_150_DC_Is1*5);
Is2= rms(FA_150_DC_Is2*5);
set(gca,'FontSize',12)
% I_{Rx_1} = 1.92A_{rms} , I_{Rx_2} = 2.38A_{rms}

% ylabel('Current (A)','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',15)
% xlabel('Time (s)','Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',15)
xlim(xl);
hold on;

ylim([-5 5])
% title({'Full-Aligned Condition','150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
title({'150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;

subplot(3,1,2);

plot(time,FA_135_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,FA_135_DC_Is2*5,'Color','b','LineWidth',2)
xticklabels([])
set(gca,'FontSize',12)
Is1= rms(FA_135_DC_Is1*5);
Is2= rms(FA_135_DC_Is2*5);
% I_{Rx_1} = 2.179A_{rms} , I_{Rx_2} = 2.09252A_{rms}

ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
% xlabel('Time (s)','Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
xlim(xl);
hold on;

ylim([-5 5])
% title({'','Full-Aligned Condition','135kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
title('135kHz Decoupled Receivers','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;

subplot(3,1,3);

plot(time,FA_150_C_Is2*5,'Color','r','LineWidth',2)
hold on;
plot(time,FA_150_C_Is1*5,'Color','b','LineWidth',2)

set(gca,'FontSize',12)

Is1= rms(FA_150_C_Is1*5);
Is2= rms(FA_150_C_Is2*5);
% I_{Rx_1} = 2.4179A_{rms} , I_{Rx_2} = 2.000842A_{rms}

% ylabel('Current (A)','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
xlim(xl);
ylim([-5 5])
% title({'','Full-Aligned Condition','150kHz Cross-Coupled Receivers'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
title({'150kHz Cross-Coupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;


%%
%%
% Comparison Misalign
% Decoupled 150 Khz
% Cross-Coupled 150 kHz

figure();
subplot(2,1,1);

plot(time,MA_150_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_150_DC_Is2*5,'Color','b','LineWidth',2)
set(gca,'FontSize',12)

xticklabels([])

Is1= rms(MA_150_DC_Is1*5);
Is2= rms(MA_150_DC_Is2*5);
% I_{Rx_1} = 0.6A_{rms} , I_{Rx_2} = 3.67A_{rms}

ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
% xlabel('Time (s)','Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
xlim(xl);
hold on;
ylim([-6 6])
title({'150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;

subplot(2,1,2);

plot(time,MA_150_C_Is2*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_150_C_Is1*5,'Color','b','LineWidth',2)

set(gca,'FontSize',12)

Is1= rms(MA_150_C_Is2*5);
Is2= rms(MA_150_C_Is1*5);
% I_{Rx_1} = 1.54A_{rms} , I_{Rx_2} = 2.83A_{rms}


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlim(xl);
hold on;
ylim([-6 6])
title({'150kHz Cross-Coupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)

lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;

%%


% Comparison Misalign
% Decoupled 150 Khz
% Decoupled 135 kHz

figure();
subplot(2,1,1);

plot(time,MA_150_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_150_DC_Is2*5,'Color','b','LineWidth',2)

xticklabels([])

set(gca,'FontSize',12)

Is1= rms(MA_150_DC_Is1*5);
Is2= rms(MA_150_DC_Is2*5);
% I_{Rx_1} = 0.6A_{rms} , I_{Rx_2} = 3.67A_{rms}


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
% xlabel('Time (s)','Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
xlim(xl);
hold on;
ylim([-6 6])
title({'150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;

subplot(2,1,2);

plot(time,MA_135_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_135_DC_Is2*5,'Color','b','LineWidth',2)
set(gca,'FontSize',12)

Is1= rms(MA_135_DC_Is1*5);
Is2= rms(MA_135_DC_Is2*5);
% I_{Rx_1} = 1.33A_{rms} , I_{Rx_2} = 2.9A_{rms}


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlim(xl);
hold on;
ylim([-6 6])
title({'135kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
%%

%%
% Comparison Misalign
% Decoupled 150 Khz
% Cross-coupled 135 kHz

figure();
subplot(2,1,1);

plot(time,MA_150_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_150_DC_Is2*5,'Color','b','LineWidth',2)

xticklabels([])

set(gca,'FontSize',12)
Is1= rms(MA_150_DC_Is1*5);
Is2= rms(MA_150_DC_Is2*5);
% I_{Rx_1} = 0.6A_{rms} , I_{Rx_2} = 3.67A_{rms}

ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
% xlabel('Time (s)','Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',25)
xlim(xl);
hold on;
ylim([-6 6])
title({'150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;

subplot(2,1,2);

plot(time,MA_135_C_Is2*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_135_C_Is1*5,'Color','b','LineWidth',2)
set(gca,'FontSize',12)
Is1= rms(MA_135_C_Is2*5);
Is2= rms(MA_135_C_Is1*5);
% I_{Rx_1} = 1.82A_{rms} , I_{Rx_2} = 2.47A_{rms}

ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlim(xl);
hold on;
ylim([-6 6])
title({'135kHz Cross-Coupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
