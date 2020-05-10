figure;
subplot(3,1,1);
plot(time,capA_cur,'b-','Linewidth',1);
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')

% plot(time,capA_volt,'r-','Linewidth',1);
% ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
% xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
% legend({'Capacitor A Current','Capacitor A Voltage'},'Location','best');
title('phase A Capacitor Ripple','FontSize',14,'FontWeight','Bold')

subplot(3,1,2);

% plot(time,capB_cur,'b-','Linewidth',1);
% ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
% xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
% 
plot(time,capB_volt,'r-','Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
% legend({'Capacitor B Current','Capacitor B Voltage'},'Location','best');
title('phase B Capacitor Ripple','FontSize',14,'FontWeight','Bold')



subplot(3,1,3);

% plot(time,capC_cur,'b-','Linewidth',1);
% ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
% xlabel('time(sec)','FontSize',14,'FontWeight','Bold')

plot(time,capC_volt,'r-','Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
% legend({'Capacitor C Current','Capacitor C Voltage'},'Location','best');
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

figure();


plot(time,capA_volt,'r-','Linewidth',1);
hold on;
plot(time,capB_volt,'b-','Linewidth',1);
hold on;
plot(time,capC_volt,'k-','Linewidth',1);

ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Capacitor A Current','Capacitor B Voltage','Capacitor C Voltage'},'Location','best');
title('Capacitor Ripples','FontSize',14,'FontWeight','Bold')
%%

figure();

yyaxis left
plot(time,InputCurr,'Linewidth',1);
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')

hold on;

yyaxis right
plot(time,InputVoltage,'Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')

legend({'Input Current','Input voltage'},'Location','best');
title('Input','FontSize',14,'FontWeight','Bold')

%%

figure();

plot(time,load_cur_A,'r-','Linewidth',1);
hold on;
plot(time,load_cur_B,'b-','Linewidth',1);
hold on;
plot(time,load_cur_C,'k-','Linewidth',1);

ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Phase A Current','Phase B Voltage','Phase C Voltage'},'Location','best');
title('Load Currents','FontSize',14,'FontWeight','Bold')
