%% Yes ESL and ESR
ESLA = 19e-9;
ESLB = 19e-9;
ESLC = 19e-9;
ESRA = 21.1e-3;
ESRB = 21.1e-3;
ESRC = 21.1e-3;

%% Parasitics
% Tüm parazitikler var
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

RATop  = 854e-6;
RABot  = 6645e-6;
RAMid  = 218.8e-6*2;
RBTop  = 813e-6;
RBBot  = 664e-6;
RBMid  = 218e-6*2;
RCTop  = 854e-6;
RCBot  = 664e-6;
RCMid  = 218.3e-6*2;

RABTop = 1037e-6-611e-6;
RABBot = 1422e-6-662e-6;
RBCTop = 867e-6-611e-6;
RBCBot = 662e-6-595e-6;

Rin = 0.1; 
Lin = 1e-6;

C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;

%%
% w=2*pi*linspace(0,300000,10000);
w=2*pi*319900;
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
capA_phA= Z4_phA./(Z4_phA+Z5_phA)
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
%% capacitor A
capA_phB=(Z5_phB./(Z4_phB+Z5_phB)).*(Z2_phB./(Z1_phB+Z2_phB))
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
%% capacitor A
capA_phC=(Z5_phC./(Z4_phC+Z5_phC)).*(Z2_phC./(Z1_phC+Z2_phC))

%%
% f=w/(2000*pi);
% normal=(1/3)*ones(1,length(f));
% 
% figure();
% plot(f,capA_phA,'b-','Linewidth',3);
% hold on;
% plot(f,capA_phB,'r-','Linewidth',3);
% hold on;
% plot(f,capA_phC,'m-','Linewidth',3);
% hold on;
% plot(f,normal,'k--','Linewidth',3);
% xlim([265 340])
% ylabel('|Mag|','FontSize',14,'FontWeight','Bold')
% xlabel('Frequency(kHz)','FontSize',14,'FontWeight','Bold')
% legend({'Phase A','Phase B','Phase C','No-parasitic(phA,phB,pHC)'},'Location','best');
% title('Capacitor A Response','FontSize',14,'FontWeight','Bold');
% set(gca,'FontSize',20)
% 
