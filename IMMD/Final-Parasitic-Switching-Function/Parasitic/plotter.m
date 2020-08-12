load('CapParasitic.mat');
response_overall_par=response_overall;
w_par=w;
capA_mag_par=capA_mag;

i=-300;
j=300;
figure();
subplot(1,2,1)
stem(w_par/(2000*pi),abs(response_overall_par),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i j]);
subplot(1,2,2)
stem(w_par/(2000*pi),capA_mag_par,'b','LineWidth',4);
xlim([i j]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%

i=0;
j=300;
figure();
stem(w_par/(2000*pi),abs(response_overall_par),'r','LineWidth',4);
set(gca,'fontsize', 18)
hold on;
stem(w_par/(2000*pi),capA_mag_par,'b','LineWidth',4);
xlim([i j]);
set(gca,'fontsize', 18)
xlabel('Parasitic Model and Frequency(kHz)');
ylabel('|Mag|');
title(strcat("Between ",string(i)," kHz and ",string(j)," kHz"))

%%

load('CapWihoutParasitic.mat');
response_overall_without=response_overall;
w_without=w;
capA_mag_without=capA_mag;

i=-300;
j=300;
figure();
subplot(1,2,1)
stem(w_without/(2000*pi),abs(response_overall_without),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i j]);
subplot(1,2,2)
stem(w_without/(2000*pi),capA_mag_without,'b','LineWidth',4);
xlim([i j]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%

i=0;
j=300;
figure();
stem(w_without/(2000*pi),abs(response_overall_without),'r','LineWidth',4);
set(gca,'fontsize', 18)
hold on;
stem(w_without/(2000*pi),capA_mag_without,'b','LineWidth',4);
xlim([i j]);
set(gca,'fontsize', 18)
xlabel('Parasitic Model and Frequency(kHz)');
ylabel('|Mag|');
title(strcat("Between ",string(i)," kHz and ",string(j)," kHz"))

%% comparison

i=0;
j=300;
figure();
stem(w_par/(2000*pi),abs(capA_mag_par),'r','LineWidth',4);
set(gca,'fontsize', 18)
hold on;
stem(w_without/(2000*pi),capA_mag_without,'b','LineWidth',4);
xlim([i j]);
set(gca,'fontsize', 18)
xlabel('Parasitic Model and Without-parasitic Model');
ylabel('|Mag|');
title(strcat("Simulation Result"," Between ",string(i)," kHz and ",string(j)," kHz"))
legend('With Parasitic','Without Parasitic')

%%

i=0;
j=300;
figure();
stem(w_par/(2000*pi),capA_mag_par,'r','LineWidth',2);
set(gca,'fontsize', 18)
hold on;
stem(w_without/(2000*pi),capA_mag_without,'b','LineWidth',2);
hold on;
stem(w_without/(2000*pi),abs(response_overall_par),'g','LineWidth',2);
xlim([i j]);
set(gca,'fontsize', 18)
xlabel('Parasitic Model and Without-parasitic Model');
ylabel('|Mag|');
title(strcat("Simulation-Analytic Result"," Between ",string(i)," kHz and ",string(j)," kHz"))
legend('With Parasitic-Simulation','Without Parasitic-Simulation','With parasitic-analytic')


