
clear all;
load('JournalEmerging.mat');

time=timeFA150(3)-timeFA150(2);
time=[0 :time : time*(length(FA_150_DC_Ip)-1)]';

%%
% Comparison Full-Align
% Decoupled 150 Khz
% Decoupled 135 kHz
% Coupled 150 kHz

figure();
subplot(3,1,1);

plot(time,FA_150_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,FA_150_DC_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-5 5])
title({'Full-aligned Condition','150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
grid on;

subplot(3,1,2);

plot(time,FA_135_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,FA_135_DC_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-5 5])
title({'','Full-aligned Condition','135kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
grid on;

subplot(3,1,3);

plot(time,FA_150_C_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,FA_150_C_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
xlim([0,1.5e-5]);
ylim([-5 5])
title({'','Full-aligned Condition','150kHz Cross-coupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
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
plot(time,MA_150_DC_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-6 6])
title({'Misaligned Condition','150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
grid on;

subplot(2,1,2);

plot(time,MA_150_C_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_150_C_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-6 6])
title({'','Misaligned Condition','150kHz Cross-coupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
grid on;

%%


% Comparison Misalign
% Decoupled 150 Khz
% Decoupled 135 kHz

figure();
subplot(2,1,1);

plot(time,MA_150_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_150_DC_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-6 6])
title({'Misaligned Condition','150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
grid on;

subplot(2,1,2);

plot(time,MA_135_DC_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_135_DC_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-6 6])
title({'','Misaligned Condition','135kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
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
plot(time,MA_150_DC_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-6 6])
title({'Misaligned Condition','150kHz Decoupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
grid on;

subplot(2,1,2);

plot(time,MA_135_C_Is1*5,'Color','r','LineWidth',2)
hold on;
plot(time,MA_135_C_Is2*5,'Color','b','LineStyle','--','LineWidth',2)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlabel('Time (s)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
xlim([0,1.5e-5]);
hold on;
legend({'Rx1 ', ...
    'Rx2',},'FontSize',15);
ylim([-6 6])
title({'','Misaligned Condition','135kHz Cross-coupled Receivers'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',35)
set(gca,'FontSize',25)
grid on;
