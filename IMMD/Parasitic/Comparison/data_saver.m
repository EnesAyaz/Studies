% time= simout.ACapCurr.Time(1:end);
% capA_cur= simout.ACapCurr.Data(1:end);
% capB_cur=simout.BCapCurr.Data(1:end);
% capC_cur=simout.CCapCurr.Data(1:end);
% 
% capA_volt= simout1.ACapVolt.Data(1:end);
% capB_volt=simout1.BCapVolt.Data(1:end);
% capC_volt=simout1.CCapVolt.Data(1:end);
% 
% InputCurr= simout2.Data(1:end);
% InputVoltage=simout3.Data(1:end);
% 
% load_cur_A= simout4.IphA.Data(1:end);
% load_cur_B= simout4.IphB.Data(1:end);
% load_cur_C= simout4.IphC.Data(1:end);
% 
% 
% 
% SAIA= simout5.Data(:,1);
% SBIB= simout5.Data(:,2);
% SCIC= simout5.Data(:,3);
% 
% save('Data_v3-conection_inductor','time','capA_cur','capB_cur','capC_cur','capA_volt','capB_volt','capC_volt', ...
%     'InputCurr','InputVoltage','load_cur_A','load_cur_B','load_cur_C','SAIA','SBIB','SCIC');

% load('Data_v3-conection_inductor.mat');

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
figure();
yyaxis left
plot(time,InputCurr,'b-','Linewidth',1);
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
yyaxis right
plot(time,InputVoltage,'r-','Linewidth',1);
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Input Current','Input Voltage'},'Location','best');
title('Input Voltage and Current Ripple','FontSize',14,'FontWeight','Bold')
%%

figure();
plot(time,load_cur_A,'b-','Linewidth',1);
hold on;
plot(time,load_cur_B,'r-','Linewidth',1);
hold on;
plot(time,load_cur_C,'m-','Linewidth',1);

ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Phase A','Phase B','Phase C'},'Location','best');
title('Load Current','FontSize',14,'FontWeight','Bold');

%% 
capCurr_1= (SAIA+SBIB+SCIC)-mean(SAIA+SBIB+SCIC);
capCurr_2= (SAIA+SBIB+SCIC)+InputCurr;
figure();
subplot(2,1,1)
plot(time,capCurr_1,'b-','Linewidth',1);
subplot(2,1,2)
plot(time,capCurr_2,'r-','Linewidth',1);
hold on;
capCurr_1A=capCurr_1/3;
capCurr_2A=capCurr_2/3;

figure;

subplot(4,1,1);
plot(time,capA_cur,'b-','Linewidth',1);
hold on;
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
plot(time,capCurr_1A,'r-','Linewidth',1);
legend({'Capacitor A Current','Capacitor A Voltage'},'Location','best');
title('phase A Capacitor Ripple','FontSize',14,'FontWeight','Bold')

subplot(4,1,2);
plot(time,capA_cur,'b-','Linewidth',1);
hold on;
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
plot(time,capCurr_2A,'r-','Linewidth',1);
legend({'Capacitor A Current','Capacitor A Voltage'},'Location','best');
title('phase A Capacitor Ripple','FontSize',14,'FontWeight','Bold')


subplot(4,1,3);
plot(time,capA_cur+capB_cur+capB_cur,'b-','Linewidth',1);
hold on;
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
plot(time,capCurr_2,'r-','Linewidth',1);
legend({'Capacitor A Current','Capacitor A Voltage'},'Location','best');
title('phase A Capacitor Ripple','FontSize',14,'FontWeight','Bold')





subplot(4,1,4);
plot(time,capA_cur+capB_cur+capB_cur,'b-','Linewidth',1);
hold on;
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
plot(time,capCurr_1,'r-','Linewidth',1);
legend({'Capacitor A Current','Capacitor A Voltage'},'Location','best');
title('phase A Capacitor Ripple','FontSize',14,'FontWeight','Bold')

