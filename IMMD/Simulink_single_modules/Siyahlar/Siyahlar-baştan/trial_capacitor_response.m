clc;
clear all;
close all;
%% load data 
load('Y:\Github\DATA\Comparison\siyahlar\Data_with_parasitic50ohm');
%% crop the data 
ts=time(2)-time(1);
fs=1/ts;
number_of_sample= fs/50;
starting=1+1*number_of_sample;
ending= 1+3*number_of_sample;
%% SAIA 
SAIA_new=SAIA(starting:ending);
yA = fft(SAIA_new);
LA=length(yA);
SAIA_mag2= abs(yA/LA);
SAIA_mag= [ flip(SAIA_mag2(1:(LA/2)+1)); flip(SAIA_mag2((LA/2)+1:end))]; 
SAIA_angle2=angle(yA/LA);
SAIA_angle= [ flip(SAIA_angle2(1:(LA/2)+1)); flip(SAIA_angle2((LA/2)+1:end))]; 
fA= fs*(0:(LA/2))/LA;
fA = [-flip(fA(2:end)) fA ];

%% SBIB
SBIB_new=SBIB(starting:ending);
yA = fft(SBIB_new);
LA=length(yA);
SBIB_mag2= abs(yA/LA);
SBIB_mag= [ flip(SBIB_mag2(1:(LA/2)+1)); flip(SBIB_mag2((LA/2)+1:end))]; 
SBIB_angle2=angle(yA/LA);
SBIB_angle= [ flip(SBIB_angle2(1:(LA/2)+1)); flip(SBIB_angle2((LA/2)+1:end))]; 
fB= fs*(0:(LA/2))/LA;
fB = [-flip(fB(2:end)) fB ];
%% SCIC
SCIC_new=SCIC(starting:ending);
yA = fft(SCIC_new);
LA=length(yA);
SCIC_mag2= abs(yA/LA);
SCIC_mag= [ flip(SCIC_mag2(1:(LA/2)+1)); flip(SCIC_mag2((LA/2)+1:end))]; 
SCIC_angle2=angle(yA/LA);
SCIC_angle= [ flip(SCIC_angle2(1:(LA/2)+1)); flip(SCIC_angle2((LA/2)+1:end))]; 
fC= fs*(0:(LA/2))/LA;
fC = [-flip(fC(2:end)),fC];
%% Parasitics 
w=2*pi*fA;

%% Parameter values
LATop  = 03.40e-9;
LABot  = 20.25e-9;
LAMid  = 01.30e-9;
LBTop  = 03.38e-9;
LBBot  = 20.38e-9;
LBMid  = 01.30e-9;
LCTop  = 03.41e-9;
LCBot  = 20.94e-9;
LCMid  = 01.30e-9;
LABTop = 18.30e-9;
LABBot = 10.20e-9;
LBCTop = 21.84e-9;
LBCBot = 11.14e-9;

ESLA = 19e-9;
ESLB = 19e-9;
ESLC = 19e-9;


Rin = 50; 
Lin = 1e-4;

C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;
%% New merged inducances - phA
L1_phA = LATop + LABot + ESLA;
L2_phA = LABTop+LABBot;
L3_phA= ESLB;
L4_phA = LBTop+LBBot;
L5_phA = Lin;
L6_phA=LBCTop + LBCBot + ESLC;
%% Calculated impedances - phA
Z1_phA = 1i*w*L6_phA + 1./(1i*w*C1C);
Z2_phA = 1i*w*L5_phA + Rin;
Z3_phA = Z1_phA.*Z2_phA./(Z1_phA+Z2_phA);
Z4_phA = Z3_phA + 1i*w*L4_phA;
Z5_phA = 1i*w*L3_phA + 1./(1i*w*C1B);
Z6_phA = Z4_phA.*Z5_phA./(Z4_phA+Z5_phA);
Z7_phA=Z6_phA+1i*w*L2_phA;
Z8_phA=1i*w*L1_phA + 1./(1i*w*C1A);
Zeqv_phA = Z7_phA.*Z8_phA./(Z7_phA+Z8_phA);
%% Capacitor A 
capA_phA= Z7_phA./(Z7_phA+Z8_phA);
%% New merged inducances - phB
L1_phB = LATop + LABot + LABTop + LABBot + ESLA;
L2_phB = ESLB;
L3_phB = LBTop + LBBot;
L4_phB = LBCTop + LBCBot + ESLC;
%% Calculated impedances - phB
Z1_phB = 1i*w*L1_phB + 1./(1i*w*C1A);
Z2_phB = 1i*w*L2_phB + 1./(1i*w*C1B);
Z3_phB = Z1_phB.*Z2_phB./(Z1_phB+Z2_phB);
Z4_phB = Z3_phB + 1i*w*(L3_phB);
Z6_phB= 1i*w*Lin + Rin;
Z7_phB=Z4_phB.*Z6_phB./(Z4_phB+Z6_phB);
Z5_phB = 1i*w*L4_phB + 1./(1i*w*C1C);
Zeqv_phB = Z4_phB.*Z5_phB./(Z4_phB+Z5_phB);
%% capacitor A
capA_phB=(Z5_phB./(Z7_phB+Z5_phB)).*(Z6_phB./(Z4_phB+Z6_phB)).*(Z2_phB./(Z1_phB+Z2_phB));
%% New merged inducances - phC
L1_phC = LATop + LABot + LABTop + LABBot + ESLA;
L2_phC = ESLB;
L3_phC = LBTop + LBBot ;
L6_phC=LBCTop + LBCBot;
L4_phC = ESLC;
L5_phC = LCTop + LCBot;
%% Calculated impedances - phC
Z1_phC = 1i*w*L1_phC + 1./(1i*w*C1A);
Z2_phC = 1i*w*L2_phC + 1./(1i*w*C1B);
Z3_phC = Z1_phC.*Z2_phC./(Z1_phC+Z2_phC);
Z4_phC = Z3_phC + 1i*w*(L3_phC);
Z5_phC= 1i*w*Lin+Rin;
Z6_phC=Z4_phC.*Z5_phC./(Z4_phC+Z5_phC);
Z7_phC =Z6_phC+L6_phC;
Z8_phC = 1i*w*L4_phC + 1./(1i*w*C1C);
Z9_phC = Z7_phC.*Z8_phC./(Z7_phC+Z8_phC);
Zeqv_phC = Z6_phC + 1i*w*L5_phC;
%% capacitor A
capA_phC=(Z8_phC./(Z7_phC+Z8_phC)).*(Z5_phC./(Z4_phC+Z5_phC)).*(Z2_phC./(Z1_phC+Z2_phC));
%% Capacitor Response 
response_A= SAIA_mag.*exp(1i*SAIA_angle).*capA_phA';
response_B= SBIB_mag.*exp(1i*SBIB_angle).*capA_phB';
response_C= SCIC_mag.*exp(1i*SCIC_angle).*capA_phC';

response_overall= response_A+response_B+response_C;
figure();
stem(w/(2000*pi),abs(response_overall))
xlim([-300 300])

%% capacitor A simulation 

%% cap A current

capA_cur_new=-capA_cur(starting:ending);
yA2 = fft(capA_cur_new);
LA=length(yA2);
capA_mag2= abs(yA2/LA);
capA_mag= [ flip(capA_mag2(1:(LA/2)+1)); flip(capA_mag2((LA/2)+1:end))]; 
capA_angle2=angle(yA2/LA);
capA_angle= [ flip(capA_angle2(1:(LA/2)+1)); flip(capA_angle2((LA/2)+1:end))]; 
fA= fs*(0:(LA/2))/LA;
fA = [-flip(fA(2:end)) fA ];

% %%
% i=39;
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([i i+2]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([i i+2]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))
% 
% %%
% i=79;
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([i i+2]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([i i+2]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))
% 
% %%
% i=119;
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([i i+2]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([i i+2]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))
% 
% %%
% i=159;
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([i i+2]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([i i+2]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))
% 
% %%
% i=199;
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([i i+2]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([i i+2]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))
% 
% %%
% i=239;
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([i i+2]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([i i+2]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))
% 
% %%
% i=279;
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([i i+2]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([i i+2]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))
% 
% %%
% figure();
% subplot(1,2,1)
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Parasitic Model');
% grid on;
% xlim([-300 300]);
% subplot(1,2,2)
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([-300 300]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% title('Simulation Result');
% grid on;
% suptitle(strcat("Between ",string(-300)," kHz and ",string(300)," kHz"))
% 
% %%
% figure();
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% hold on;
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([0 300]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% legend ('Parasitic Model','Simulation Result');
% grid on;
% title(strcat("Between ",string(0)," kHz and ",string(300)," kHz"))
% 
% %%
% figure();
% stem(w/(2000*pi),abs(response_overall),'r','LineWidth',4);
% hold on;
% stem(w/(2000*pi),capA_mag,'b','LineWidth',4);
% xlim([261 263]);
% set(gca,'fontsize', 18)
% xlabel('Frequency(kHz)');
% ylabel('|Mag|');
% legend ('Parasitic Model','Simulation Result');
% grid on;
% title(strcat("Between ",string(261)," kHz and ",string(263)," kHz"))

%%
%%
i=39;
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i i+2]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([i i+2]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%
i=79;
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i i+2]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([i i+2]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%
i=119;
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i i+2]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([i i+2]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%
i=159;
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i i+2]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([i i+2]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%
i=199;
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i i+2]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([i i+2]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%
i=239;
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i i+2]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([i i+2]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%
i=279;
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([i i+2]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([i i+2]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(i)," kHz and ",string(i+2)," kHz"))

%%
figure();
subplot(1,2,1)
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Parasitic Model');
grid on;
xlim([-300 300]);
subplot(1,2,2)
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([-300 300]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
title('Simulation Result');
grid on;
suptitle(strcat("Between ",string(-300)," kHz and ",string(300)," kHz"))

%%
figure();
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
hold on;
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([0 300]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
legend ('Parasitic Model','Simulation Result');
grid on;
title(strcat("Between ",string(0)," kHz and ",string(300)," kHz"))

%%
figure();
stem(w/(2000*pi),angle(response_overall),'r','LineWidth',4);
hold on;
stem(w/(2000*pi),capA_angle,'b','LineWidth',4);
xlim([261 263]);
set(gca,'fontsize', 18)
xlabel('Frequency(kHz)');
ylabel('|Mag|');
legend ('Parasitic Model','Simulation Result');
grid on;
title(strcat("Between ",string(261)," kHz and ",string(263)," kHz"))
