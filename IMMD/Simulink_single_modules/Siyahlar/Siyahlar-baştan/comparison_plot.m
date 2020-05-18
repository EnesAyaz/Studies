load('Y:\Github\DATA\Comparison\siyahlar\Data_with_parasitic01ohm');
input_current_with=InputCurr;
SAIA_with=SAIA;
SBIB_with=SBIB;
SCIC_with=SCIC;
capA_cur_with =capA_cur;
capB_cur_with=capB_cur;
capC_cur_with=capC_cur;

load('Y:\Github\DATA\Comparison\siyahlar\Data_without_parasitic01ohm');
input_current_without=InputCurr;
SAIA_without=SAIA;
SBIB_without=SBIB;
SCIC_without=SCIC;
capA_cur_without =capA_cur;
capB_cur_without=capB_cur;
capC_cur_without=capC_cur;
%%
figure();
plot(time,input_current_with,'b-','Linewidth',1);
hold on;
plot(time,input_current_without,'r-','Linewidth',1);
% xlim([0.02144 0.02152])
ylabel('Current(A)','FontSize',20,'FontWeight','Bold')
xlabel('time(sec)','FontSize',20,'FontWeight','Bold')
legend({'With parasitic','Without parasitic'},'Location','best');
title('Input Current ','FontSize',20,'FontWeight','Bold');
set(gca,'FontSize',20)

%%
figure();
plot(time,SAIA_with,'b-','Linewidth',1);
hold on;
plot(time,SAIA_without,'r-','Linewidth',1);
xlim([0.02144 0.02152])
ylabel('Current(A)','FontSize',20,'FontWeight','Bold')
xlabel('time(sec)','FontSize',20,'FontWeight','Bold')
legend({'With parasitic','Without parasitic'},'Location','best');
title('Leg Current- A ','FontSize',20,'FontWeight','Bold');
set(gca,'FontSize',20)
%%
figure();
plot(time,capC_cur_with,'b-','Linewidth',1);
hold on;
plot(time,capC_cur_without,'r-','Linewidth',1);
% xlim([0.02144 0.02152])
ylabel('Current(A)','FontSize',20,'FontWeight','Bold')
xlabel('time(sec)','FontSize',20,'FontWeight','Bold')
legend({'With parasitic','Without parasitic'},'Location','best');
title('Capacitor Current -C ','FontSize',20,'FontWeight','Bold');
set(gca,'FontSize',20)
%%



