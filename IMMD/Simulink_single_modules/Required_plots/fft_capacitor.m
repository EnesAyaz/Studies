phaseA= sin(2*pi*50*time);
plot(phaseA)
ts=time(2)-time(1);
fs=1/ts;
number_of_sample= fs/50;

starting=1+5*number_of_sample;
ending= 1+8*number_of_sample;
plot(phaseA(starting:ending));
x=phaseA(starting:ending);
y = fft(x);
L=length(x);
P_phase= angle(y/L);
P1_phase=P_phase(1:L/2+1);
% P1_phase(2:end-1)=P1_phase(2:end-1);
f= fs*(0:(L/2))/L;

figure()
stem(f,180*P1_phase/pi)
xlim([0 60])
%%
f_s= 1/(time(2)-time(1));
capA_cur1=capA_cur(starting:ending);
yA = fft(capA_cur1);
LA=length(yA);
P2A_mag= abs(yA/LA);
P1A_mag=P2A_mag(1:LA/2+1);
P1A_mag(2:end-1)=2*P1A_mag(2:end-1);
P2A_phase= angle(yA/LA);
P1A_phase=P2A_phase(1:LA/2+1);
% P1A_phase(2:end-1)=2*P1A_phase(2:end-1);
fA= f_s*(0:(LA/2))/LA;

capB_cur1=capB_cur(starting:ending);
yB = fft(capB_cur1);
LB=length(yB);
P2B_mag= abs(yB/LB);
P1B_mag=P2B_mag(1:LB/2+1);
P1B_mag(2:end-1)=2*P1B_mag(2:end-1);
P2B_phase= angle(yB/LB);
P1B_phase=P2B_phase(1:LB/2+1);
% P1B_phase(2:end-1)=2*P1B_phase(2:end-1);
fB= f_s*(0:(LB/2))/LB;

capC_cur1=capC_cur(starting:ending);
yC = fft(capC_cur1);
LC=length(yC);
P2C_mag= abs(yC/LC);
P1C_mag=P2C_mag(1:LC/2+1);
P1C_mag(2:end-1)=2*P1C_mag(2:end-1);
P2C_phase= angle(yC/LC);
P1C_phase=P2C_phase(1:LC/2+1);
% P1C_phase(2:end-1)=2*P1C_phase(2:end-1);
fC= f_s*(0:(LC/2))/LC;

%%
f_s= 1/(time(2)-time(1));
load_currentA=load_cur_A(starting:ending);
yload = fft(load_currentA);
Lload=length(yload);
P2load_mag= abs(yload/Lload);
P1load=P2load_mag(1:Lload/2+1);
P1load(2:end-1)=2*P1load(2:end-1);
P2load_ang= angle(yload/Lload);
P1load_ang=P2load_ang(1:Lload/2+1);
% P1load_ang(2:end-1)=2*P1load_ang(2:end-1);
fload= f_s*(0:(Lload/2))/Lload;
figure();
stem(fload,180*P1load_ang/pi,'r')
hold on;
stem(fload,P1load,'b')

%%
figure();
stem(fA,P1A_mag,'r')
xlim([0 800e3])
hold on;
stem(fB,P1B_mag,'k')
stem(fC,P1C_mag,'b')
xlim([39800 40200])
figure();
stem(fA,180*P1A_phase/pi,'r')
xlim([0 800e3])
hold on;
stem(fB,180*P1B_phase/pi,'k')
stem(fC,180*P1C_phase/pi,'b')
xlim([39800 40200])


%% w axis
% w = 2*pi.*fA;
w=2*pi*40150;

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

ESLA = 19e-15;
ESLB = 19e-15;
ESLC = 19e-15;

C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;
%% New merged inducances - phA
L1_phA = LATop + LABot + ESLA;
L2_phA = LABTop;
L3_phA = LABBot;
L4_phA = ESLB;
L5_phA = LBTop + LBBot + LBCTop + LBCBot + ESLC;
%% Calculated impedances - phA
Z1_phA = 1i*w*L5_phA + 1./(1i*w*C1C);
Z2_phA = 1i*w*L4_phA + 1./(1i*w*C1B);
Z3_phA = Z1_phA.*Z2_phA./(Z1_phA+Z2_phA);
Z4_phA = Z3_phA + 1i*w*(L2_phA+L3_phA);
Z5_phA = 1i*w*L1_phA + 1./(1i*w*C1A);
Zeqv_phA = Z4_phA.*Z5_phA./(Z4_phA+Z5_phA);
%% Capacitor A 
capA_phA= Z4_phA./(Z4_phA+Z5_phA);
%% capacitor B
capB_phA=(Z5_phA./(Z4_phA+Z5_phA)).*(Z2_phA./(Z1_phA+Z2_phA));
%% capacitor C 
capC_phA= (Z5_phA./(Z4_phA+Z5_phA)).* (Z1_phA./(Z1_phA+Z2_phA));
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
Z5_phB = 1i*w*L4_phB + 1./(1i*w*C1C);
Zeqv_phB = Z4_phB.*Z5_phB./(Z4_phB+Z5_phB);
%% Capacitor C
capC_phB= Z4_phB./(Z4_phB+Z5_phB);
%% capacitor A
capA_phB=(Z5_phB./(Z4_phB+Z5_phB)).*(Z2_phB./(Z1_phB+Z2_phB));
%% capacitor B
capB_phB= (Z5_phB./(Z4_phB+Z5_phB)).* (Z1_phB./(Z1_phB+Z2_phB));
%% New merged inducances - phC
L1_phC = LATop + LABot + LABTop + LABBot + ESLA;
L2_phC = ESLB;
L3_phC = LBTop + LBBot + LBCTop + LBCBot;
L4_phC = ESLC;
L5_phC = LCTop + LCBot;
%% Calculated impedances - phC
Z1_phC = 1i*w*L1_phC + 1./(1i*w*C1A);
Z2_phC = 1i*w*L2_phC + 1./(1i*w*C1B);
Z3_phC = Z1_phC.*Z2_phC./(Z1_phC+Z2_phC);
Z4_phC = Z3_phC + 1i*w*(L3_phC);
Z5_phC = 1i*w*L4_phC + 1./(1i*w*C1C);
Z6_phC = Z4_phC.*Z5_phC./(Z4_phC+Z5_phC);
Zeqv_phC = Z6_phC + 1i*w*L5_phC;
%% Capacitor C
capC_phC= Z4_phC./(Z4_phC+Z5_phC);
%% capacitor A
capA_phC=(Z5_phC./(Z4_phC+Z5_phC)).*(Z2_phC./(Z1_phC+Z2_phC));
%% capacitor B
capB_phC= (Z5_phC./(Z4_phC+Z5_phC)).* (Z1_phC./(Z1_phC+Z2_phC));
%%
% figure();
% stem(fA/1000,P1A_mag,'r')
% hold on;
% stairs(fA/1000, abs(capA_phA),'b');
% stairs(fA/1000, abs(capA_phB),'k');
% stairs(fA/1000, abs(capA_phC),'g');
% xlabel('Frequency (kHz)')
% legend('simulink','phaseA','phaseB','phaseC')
% xlim([0 400]);
% ylim([0 2])





