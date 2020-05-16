
% load('Y:\Github\DATA\Comparison\Data_v3-conection_inductor');

load('Y:\Github\DATA\Comparison\siyahlar\Data_with_2parasitic');

%%

ts=time(2)-time(1);
fs=1/ts;
number_of_sample= fs/50;

starting=1+1*number_of_sample;
ending= 1+3*number_of_sample;
figure('name','Load Current')
plot(time((starting:ending)),load_cur_A(starting:ending));
hold on; 
plot(time((starting:ending)),load_cur_B(starting:ending));
hold on;
plot(time((starting:ending)),load_cur_C(starting:ending));
title('Load Current');
ylabel('Current(A)');
xlabel('Time(s)');

%% SAIA 
SAIA_new=SAIA(starting:ending);
yA = fft(SAIA_new);
LA=length(yA);
SAIA_mag2= abs(yA/LA);
SAIA_mag=SAIA_mag2(1:LA/2+1);
SAIA_mag(2:end-1)=2*SAIA_mag(2:end-1);
P2A_phase= angle(yA/LA);
SAIA_angle=P2A_phase(1:LA/2+1);
fA= fs*(0:(LA/2))/LA;

figure();
subplot(2,1,1)
stem(fA,SAIA_mag);
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fA,SAIA_angle);
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])

%% SBIB

SBIB_new=SBIB(starting:ending);
yA = fft(SBIB_new);
LA=length(yA);
SBIB_mag2= abs(yA/LA);
SBIB_mag=SBIB_mag2(1:LA/2+1);
SBIB_mag(2:end-1)=2*SBIB_mag(2:end-1);
P2A_phase= angle(yA/LA);
SBIB_angle=P2A_phase(1:LA/2+1);
fB= fs*(0:(LA/2))/LA;

figure();
subplot(2,1,1)
stem(fB,SBIB_mag);
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fB,SBIB_angle);
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])
%% SCIC
SCIC_new=SCIC(starting:ending);
yA = fft(SCIC_new);
LA=length(yA);
SCIC_mag2= abs(yA/LA);
SCIC_mag=SCIC_mag2(1:LA/2+1);
SCIC_mag(2:end-1)=2*SCIC_mag(2:end-1);
P2A_phase= angle(yA/LA);
SCIC_angle=P2A_phase(1:LA/2+1);
fC= fs*(0:(LA/2))/LA;

figure();
subplot(2,1,1)
stem(fC,SCIC_mag);
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fC,SCIC_angle);
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])
%%
%% w axis
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


% LATop  = 03.40e-19;
% LABot  = 20.25e-19;
% LAMid  = 01.30e-19;
% LBTop  = 03.38e-19;
% LBBot  = 20.38e-19;
% LBMid  = 01.30e-19;
% LCTop  = 03.41e-19;
% LCBot  = 20.94e-19;
% LCMid  = 01.30e-19;
% LABTop = 18.30e-19;
% LABBot = 10.20e-19;
% LBCTop = 21.84e-19;
% LBCBot = 11.14e-19;
% 
% ESLA = 19e-19;
% ESLB = 19e-19;
% ESLC = 19e-19;

% Lin=1e-6;
% Rin=0.1;

Rin = 20; % former value was 10
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
%%
figure();
subplot(2,1,1)
stem(fC,abs(capA_phC));
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fC,angle(capA_phC));
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])
%%
% k=length(SAIA_mag);
k=16000;
capA_real=[];
for i=1:k
b=SAIA_mag(k)'.*capA_phA(k).* exp(1i*SAIA_angle(k))';+SBIB_mag(k)'.*capA_phB(k).* exp(1i*SBIB_angle(k))'+ SCIC_mag(k)'.*capA_phC(k).* exp(1i*SCIC_angle(k))';
capA_real=[capA_real b];
    
end
% capA=SAIA_mag(1:k)'.*capA_phA(1:k)+SBIB_mag(1:k)'.*capA_phB(1:k)+SCIC_mag(1:k)'.*capA_phC(1:k);
% capA_real=SAIA_mag(1:k)'.*capA_phA(1:k).* cos(SAIA_angle(1:k))';+SBIB_mag(1:k)'.*capA_phB(1:k).* cos(SBIB_angle(1:k))' ...
%     +SCIC_mag(1:k)'.*capA_phC(1:k).* cos(SCIC_angle(1:k))';
% 
% capA_imaj=SAIA_mag(1:k)'.*capA_phA(1:k).* sin(SAIA_angle(1:k))';+SBIB_mag(1:k)'.*capA_phB(1:k).* sin(SBIB_angle(1:k))' ...
%     +SCIC_mag(1:k)'.*capA_phC(1:k).* sin(SCIC_angle(1:k))';


capA=abs(capA_real);
capSA=SAIA_mag(1:k)'.*capA_phA(1:k);
capSB=SBIB_mag(1:k)'.*capA_phB(1:k);
capSC=SCIC_mag(1:k)'.*capA_phC(1:k);
figure();
stem(fA(1:k),capA(1:k));
ylabel('Mag')
xlabel('Frequency')
xlim([0 200000])

%% cap A current

capA_cur_new=-capA_cur(starting:ending);
yA = fft(capA_cur_new);
LA=length(yA);
capA_cur_mag2= abs(yA/LA);
capA_cur_mag=capA_cur_mag2(1:LA/2+1);
capA_cur_mag(2:end-1)=2*capA_cur_mag(2:end-1);

P2A_phase= angle(yA/LA);
capA_cur_angle=P2A_phase(1:LA/2+1);
fA= fs*(0:(LA/2))/LA;


figure();
stem(fA(1:k),capA_cur_mag(1:k));
ylabel('Mag')
xlabel('Frequency')
xlim([0 200000])

%%

figure();
stem(fA(1:k),capA_cur_mag(1:k),'LineWidth',3);
hold on;
stem(fA(1:k),capA(1:k),'LineWidth',3);

ylabel('Mag','FontSize',14,'FontWeight','Bold')
xlabel('Frequency','FontSize',14,'FontWeight','Bold')
legend({'Simulation Result','Impedance Model'},'Location','best');
title('Capacitor A ')


%%
figure();

stem(fA(1:k),SAIA_mag(1:k)','LineWidth',3);
hold on;
stem(fA(1:k),capA(1:k),'LineWidth',3);
xlim([79500 80500])

ylabel('Mag','FontSize',14,'FontWeight','Bold')
xlabel('Frequency','FontSize',14,'FontWeight','Bold')
legend({'Simulation Result','Impedance Model'},'Location','best');
title(' Switching Legs ')

%%
figure();
stem(fA(1:k),SBIB_mag(1:k)','LineWidth',3);
hold on;
stem(fA(1:k),capA_cur_mag(1:k),'LineWidth',3);
xlim([39500 40500])

ylabel('Mag','FontSize',14,'FontWeight','Bold')
xlabel('Frequency','FontSize',14,'FontWeight','Bold')
legend({'Simulation Result','Impedance Model'},'Location','best');
title(' Switching Legs ')

figure();
stem(fA(1:k),SCIC_mag(1:k)','LineWidth',3);
hold on;
stem(fA(1:k),capA(1:k),'LineWidth',3);
xlim([39500 40500])

ylabel('Mag','FontSize',14,'FontWeight','Bold')
xlabel('Frequency','FontSize',14,'FontWeight','Bold')
legend({'Simulation Result','Impedance Model'},'Location','best');
title(' Switching Legs ')

%%
figure();
stem(fA(1:k),SAIA_angle(1:k)'*180/pi,'LineWidth',3);
hold on;
stem(fA(1:k),SAIA_mag(1:k)','LineWidth',3);
stem(fA(1:k),SBIB_angle(1:k)'*180/pi,'LineWidth',3);
stem(fA(1:k),SCIC_angle(1:k)'*180/pi,'LineWidth',3);
xlim([39800 40300])


figure();
stem(fA(1:k),SAIA_mag(1:k)','LineWidth',3);
hold on;
stem(fA(1:k),SBIB_mag(1:k)','LineWidth',3);
stem(fA(1:k),SCIC_mag(1:k)','LineWidth',3);
xlim([39800 40300])

%%
k=1595;
b=SAIA_mag(k)'.*capA_phA(k).* exp(1i*SAIA_angle(k))'+SBIB_mag(k)'.*capA_phB(k).* exp(1i*SBIB_angle(k))' ...
    +SCIC_mag(k)'.*capA_phC(k).* exp(1i*SCIC_angle(k))'

SAIA_mag(k)'.* exp(1i*SAIA_angle(k))';+SBIB_mag(k)'.* exp(1i*SBIB_angle(k))' ...
    +SCIC_mag(k)'.* exp(1i*SCIC_angle(k))'
abs(b)
fA(k)

%%

a=SAIA_mag(1:end)'.*capA_phA(1:end).* exp(1i*SAIA_angle(1:end))';+SBIB_mag(1:end)'.*capA_phB(1:end).* exp(1i*SBIB_angle(1:end))' ...
    +SCIC_mag(1:end)'.*capA_phC(1:end).* exp(1i*SCIC_angle(1:end))';

a(k)
stem(fA,SAIA_mag(1:end))