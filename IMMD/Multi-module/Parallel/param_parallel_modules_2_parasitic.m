%% Time
Tfinal = 60e-3;
SampleTime = 1e-8;


%% Source parameters
Vdc = 270;
Rin = 0.1; % former value was 10
Lin = 1e-6;

%% PWM common parameters
fsw = 40e3;
ffund = 50;
frms = 50;

%% PWM different parameters
ModulationIndex1 = 0.9;
Module1Phase = 0;

ModulationIndex2 = 0.9;
Module2Phase = 0;

%% Capacitances
C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;
%% Connector Inductance
connector_res1 = 1e-3;
connector_ind1=0.6e-6;
connector_res2 = 1e-3;
connector_ind2=0.6e-6;
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

%% Load parameters
Vln1 = 0.612*Vdc/sqrt(3)*ModulationIndex1;
PF1 = 0.98;
P_module1 = 2e3;
S1 = P_module1/PF1;
Z1 = Vln1^2/(S1/3);
Rload1 = Z1*PF1;
Xload1 = sqrt(Z1^2 - Rload1^2);
Lload1 = Xload1/(2*pi*ffund);
Iload1 = Vln1/Z1;


Vln2 = 0.612*Vdc/sqrt(3)*ModulationIndex2;
PF2 = 0.98;
P_module2 = 2e3;
S2 = P_module2/PF2;
Z2 = Vln2^2/(S2/3);
Rload2 = Z2*PF2;
Xload2 = sqrt(Z2^2 - Rload2^2);
Lload2 = Xload2/(2*pi*ffund);
Iload2 = Vln2/Z2;



P = P_module1+P_module2;
Idc = P/Vdc;
Idc1=P_module1/Vdc;
Idc2=P_module2/Vdc;
Vin = Vdc + Idc*Rin+((Idc1*connector_res1+Idc2*connector_res2)/2);




