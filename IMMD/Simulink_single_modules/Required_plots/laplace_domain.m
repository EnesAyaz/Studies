syms s;
C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;

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

Lin=1e-6;
Rin=0.1;
%% New merged inducances - phA
L1_phA = LATop + LABot + ESLA;
L2_phA = LABTop+LABBot;
L3_phA= ESLB;
L4_phA = LBTop+LBBot;
L5_phA = Lin;
L6_phA=LBCTop + LBCBot + ESLC;
%% Calculated impedances - phA
Z1_phA = s*L6_phA + 1./(s*C1C);
Z2_phA = s*L5_phA + Rin;
Z3_phA = Z1_phA.*Z2_phA./(Z1_phA+Z2_phA);
Z4_phA = Z3_phA + s*L4_phA;
Z5_phA = s*L3_phA + 1./(s*C1B);
Z6_phA = Z4_phA.*Z5_phA./(Z4_phA+Z5_phA);
Z7_phA=Z6_phA+s*L2_phA;
Z8_phA=s*L1_phA + 1./(s*C1A);
Zeqv_phA = Z7_phA.*Z8_phA./(Z7_phA+Z8_phA);
%% Capacitor A 
capA_phA= Z7_phA./(Z7_phA+Z8_phA);
%% New merged inducances - phB
L1_phB = LATop + LABot + LABTop + LABBot + ESLA;
L2_phB = ESLB;
L3_phB = LBTop + LBBot;
L4_phB = LBCTop + LBCBot + ESLC;
%% Calculated impedances - phB
Z1_phB = s*L1_phB + 1./(s*C1A);
Z2_phB = s*L2_phB + 1./(s*C1B);
Z3_phB = Z1_phB.*Z2_phB./(Z1_phB+Z2_phB);
Z4_phB = Z3_phB + s*(L3_phB);
Z6_phB= s*Lin + Rin;
Z7_phB=Z4_phB.*Z6_phB./(Z4_phB+Z6_phB);
Z5_phB = s*L4_phB + 1./(s*C1C);
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
Z1_phC = s*L1_phC + 1./(s*C1A);
Z2_phC = s*L2_phC + 1./(s*C1B);
Z3_phC = Z1_phC.*Z2_phC./(Z1_phC+Z2_phC);
Z4_phC = Z3_phC + s*(L3_phC);
Z5_phC= s*Lin+Rin;
Z6_phC=Z4_phC.*Z5_phC./(Z4_phC+Z5_phC);
Z7_phC =Z6_phC+L6_phC;
Z8_phC = s*L4_phC + 1./(s*C1C);
Z9_phC = Z7_phC.*Z8_phC./(Z7_phC+Z8_phC);
Zeqv_phC = Z6_phC + s*L5_phC;
%% capacitor A
capA_phC=(Z8_phC./(Z7_phC+Z8_phC)).*(Z5_phC./(Z4_phC+Z5_phC)).*(Z2_phC./(Z1_phC+Z2_phC));
%%
