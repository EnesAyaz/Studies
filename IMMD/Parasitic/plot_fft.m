%% 
% clear all
% clc;

% load('CapacitorCurr_3.mat');
% capA_cur= capA;
% capB_cur= capB;
% capC_cur= capC;
% load('CapacitorVolt_3.mat');
% capA_volt= capA;
% capB_volt= capB;
% capC_volt= capC;
% load('InputVoltCurr_3.mat');
% input_cur= InputCurr;
% input_volt=InputVoltage;
% clear capA capB capC InputCurr InputVoltage
%%
figure;
subplot(3,1,1);
yyaxis left
plot(time,capA_cur,'b-','Linewidth',1);
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
yyaxis right
plot(time,capA_volt,'r-','Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Capacitor A Current','Capacitor A Voltage'},'Location','best');
title('phase A Capacitor Ripple','FontSize',14,'FontWeight','Bold')

subplot(3,1,2);
yyaxis left
plot(time,capB_cur,'b-','Linewidth',1);
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
yyaxis right
plot(time,capB_volt,'r-','Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Capacitor B Current','Capacitor B Voltage'},'Location','best');
title('phase B Capacitor Ripple','FontSize',14,'FontWeight','Bold')



subplot(3,1,3);
yyaxis left
plot(time,capC_cur,'b-','Linewidth',1);
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
yyaxis right
plot(time,capC_volt,'r-','Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Capacitor C Current','Capacitor C Voltage'},'Location','best');
title('phase C Capacitor Ripple','FontSize',14,'FontWeight','Bold')

%%

yyaxis left
plot(time,input_cur,'b-','Linewidth',1);
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
yyaxis right
plot(time,input_volt,'r-','Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Input Current','Input Voltage'},'Location','best');
title('Input Voltage and Current Waveform','FontSize',14,'FontWeight','Bold')

%%





