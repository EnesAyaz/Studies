figure();

subplot(4,1,1);
plot(time,SAIA,'b-','Linewidth',1);
hold on;
plot(time,SBIB,'r-','Linewidth',1);
hold on;
plot(time,SCIC,'m-','Linewidth',1);
hold off;
xlim([19.95e-3 20.05e-3])

ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Phase A','Phase B','Phase C'},'Location','best');
title('Leg Current','FontSize',14,'FontWeight','Bold');

subplot(4,1,2);

plot(time,load_cur_A,'b-','Linewidth',1);
hold on;
plot(time,load_cur_B,'r-','Linewidth',1);
hold on;
plot(time,load_cur_C,'m-','Linewidth',1);
hold off;
xlim([19.95e-3 20.05e-3])

ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
legend({'Phase A','Phase B','Phase C'},'Location','best');
title('Load currents','FontSize',14,'FontWeight','Bold');

subplot(4,1,3);
yyaxis right; 
plot(time,capA_volt,'r-','Linewidth',1);
hold on;
ylabel('Voltage(V)','FontSize',14,'FontWeight','Bold')
yyaxis left; 

plot(time,-capA_cur,'b-','Linewidth',1);
xlim([19.95e-3 20.05e-3])
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
title('Capacitor Current and Voltage','FontSize',14,'FontWeight','Bold');

subplot(4,1,4);

plot(time,SAIA+SBIB+SCIC,'r-','Linewidth',1);

xlim([19.95e-3 20.05e-3])
ylabel('Current(A)','FontSize',14,'FontWeight','Bold')
xlabel('time(sec)','FontSize',14,'FontWeight','Bold')
title('SA+SB+SC','FontSize',14,'FontWeight','Bold');

