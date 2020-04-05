load('input_current.mat');
load('voltage_gain.mat');

figure('Name','Output Voltage');

i=k_013;plot(i.freq/1000,i.gain,'LineWidth',3); hold on;
% i=k_018;plot(i.freq,i.gain);hold on;
i=k_023; plot(i.freq/1000,i.gain,'LineWidth',3); hold on;
% i=k_028; plot(i.freq,i.gain) ;hold on;
i=k_033; plot(i.freq/1000,i.gain,'LineWidth',3); hold on;
% i=k_038; plot(i.freq,i.gain); hold on;
% i=k_043; plot(i.freq,i.gain); hold on;
i=k_048; plot(i.freq/1000,i.gain,'LineWidth',3); hold on;
title('Gain Response of the System')
legend('k=0.13','k=0.23','k=0.33','k=0.43');
ylabel(' 20 log ( $$ \frac{V_{out}}{V_{in}} $$) (dB) ','Interpreter','latex');
xlabel('Frequency (kHz)','Interpreter','latex');
grid on;
grid minor;

figure('Name','Input Impedance');
i=zin013;plot(i.freq/1000,-i.phase,'LineWidth',3); hold on;
% i=zin018;plot(i.freq,i.phase);hold on;
i=zin023; plot(i.freq/1000,-i.phase,'LineWidth',3); hold on;
% i=zin028; plot(i.freq,i.phase) ;hold on;
i=zin033; plot(i.freq/1000,-i.phase,'LineWidth',3); hold on;
% i=zin038; plot(i.freq,i.phase); hold on;
i=zin043; plot(i.freq/1000,-i.phase,'LineWidth',3); hold on;
% i=zin048; plot(i.freq,i.phase); hold on;
legend('k=0.13','k=0.23','k=0.33','k=0.43','Interpreter','latex');
ylabel('Phase of Input Impedance $$ \angle Z(\Theta)  $$','Interpreter','latex');
xlabel('Frequency (kHz)','Interpreter','latex');
grid on;
grid minor;
%%
load('time_domain.mat');

%% Input Current and Voltage for Aligned and misaligned

figure('Name','Input Voltage and Current');
A=inputAligned;
B=inputMisaligned;
subplot(2,2,1);

yyaxis left
plot(A.time*1000,A.i1,'--','LineWidth',1);
ylabel('Input Current','Interpreter','latex');

yyaxis right
plot(A.time*1000,A.Vin1,'LineWidth',1);
xlim([1.7,1.8])
% legend('Input Voltage','Input Current', 'Location','best')
legend('Input Currrent','Input Voltage')
ylabel('OutputVoltage','Interpreter','latex');
xlabel('Time(ms)','Interpreter','latex');
title('Input 1 at aligned position','Interpreter','latex');
% text(A.time(12799)*1000,A.i1(12799),'\leftarrow sin(\pi)')

subplot(2,2,2);

yyaxis left
plot(A.time*1000,A.i2,'--','LineWidth',1);
ylabel('Input Current','Interpreter','latex');

yyaxis right
plot(A.time*1000,A.Vin2,'LineWidth',1);
xlim([1.7,1.8])
% legend('Input Voltage','Input Current', 'Location','best')
legend('Input Current','Input Voltage')
ylabel('OutputVoltage','Interpreter','latex');
xlabel('Time(ms)','Interpreter','latex');
title('Input 2 at aligned position','Interpreter','latex');
% text(A.time(12799)*1000,A.i1(12799),'\leftarrow sin(\pi)')

subplot(2,2,3);

yyaxis left
plot(B.time*1000,B.i1,'--','LineWidth',1);
ylabel('Input Current','Interpreter','latex');

yyaxis right
plot(B.time*1000,B.Vin1,'LineWidth',1);
xlim([1.7,1.8])
% legend('Input Voltage','Input Current', 'Location','best')
legend('Input Currrent','Input Voltage')
ylabel('OutputVoltage','Interpreter','latex');
xlabel('Time(ms)','Interpreter','latex');
title('Input 1 at misaligned position','Interpreter','latex');
% text(A.time(12799)*1000,A.i1(12799),'\leftarrow sin(\pi)')

subplot(2,2,4);

yyaxis left
plot(B.time*1000,B.i2,'--','LineWidth',1);
ylabel('Input Current','Interpreter','latex');

yyaxis right
plot(B.time*1000,B.vin2,'LineWidth',1);
xlim([1.7,1.8])
% legend('Input Voltage','Input Current', 'Location','best')
legend('Input Current','Input Voltage')
ylabel('OutputVoltage','Interpreter','latex');
xlabel('Time(ms)','Interpreter','latex');
title('Input 2 at misaligned position','Interpreter','latex');
% text(A.time(12799)*1000,A.i1(12799),'\leftarrow sin(\pi)')

%%

figure('Name','Seconder Current');
A=seconderAligned;
B=seconderMisaligned;

subplot(1,2,1);
plot(A.time*1000,A.is1,'-','LineWidth',1);
hold on ;
plot(A.time*1000,A.is2,'--','LineWidth',1);
hold on ;
plot(A.time*1000,A.is3,':','LineWidth',1);
hold on ;
plot(A.time*1000,A.is4,'-.','LineWidth',1);

ylabel('Seconder Current','Interpreter','latex');

xlim([1.7,1.8])
% legend('Input Voltage','Input Current', 'Location','best')
legend('Seconder 1 current','Seconder 2 current','Seconder 3 current','Seconder 4 current')
ylabel('Seconder Current','Interpreter','latex');
xlabel('Time(ms)','Interpreter','latex');
title('Seconder Currents at aligned position','Interpreter','latex');
% text(A.time(12799)*1000,A.i1(12799),'\leftarrow sin(\pi)')

subplot(1,2,2);

plot(B.time*1000,B.is1,'-','LineWidth',1);
hold on ;
plot(B.time*1000,B.is2,'--','LineWidth',1);
hold on ;
plot(B.time*1000,B.is3,':','LineWidth',1);
hold on ;
plot(B.time*1000,B.is4,'-.','LineWidth',1);

ylabel('Seconder Current','Interpreter','latex');

xlim([1.7,1.8])
% legend('Input Voltage','Input Current', 'Location','best')
legend('Seconder 1 current','Seconder 2 current','Seconder 3 current','Seconder 4 current')
ylabel('Seconder Current','Interpreter','latex');
xlabel('Time(ms)','Interpreter','latex');
title('Seconder Currents at misaligned position','Interpreter','latex');
% text(A.time(12799)*1000,A.i1(12799),'\leftarrow sin(\pi)')

%% Output Voltage 
A=outputAligned;
B=outputMisaligned;
figure('Name','Output');
plot(A.time*1000,A.Vout,'-','LineWidth',2);
hold on ;
plot(A.time*1000,A.Vout,'--','LineWidth',2);
hold on ;
legend('Output Voltage (Aligned)','Output Voltage(Misaligned');
ylabel('OutputVoltage','Interpreter','latex');
xlim([1.5,4]);
ylim([0 130]);
axes('Position',[.2 .5 .2 .2])
box on
plot(A.time*1000,A.Vout,'-','LineWidth',2);
hold on ;
plot(A.time*1000,A.Vout,'--','LineWidth',2);
xlim([1.7,1.72]);

%%

