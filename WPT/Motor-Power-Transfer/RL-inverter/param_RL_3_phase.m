%% Source parameters
fsw = 150e3;
ffund = 50;
frms = 50;
ModulationIndex1 = 0.8;
Vdc = 270;
Module1Phase=0;

%% Yes ESL and ESR
ESLA = 19e-9;
ESLB = 19e-9;
ESLC = 19e-9;
ESRA = 21.1e-3;
ESRB = 21.1e-3;
ESRC = 21.1e-3;

%% Load parameters
Vln1 = 0.612*Vdc/sqrt(3)*ModulationIndex1;
PF = 0.98;
P_module1 = 2e3;
S1 = P_module1/PF;
Z1 = Vln1^2/(S1/3);
Rload1 = Z1*PF;
Xload1 = sqrt(Z1^2 - Rload1^2);
Lload1 = Xload1/(2*pi*ffund);
Iload1 = Vln1/Z1;
P = P_module1;
Idc = P/Vdc;

Rin = 0.1; % former value was 10
Lin = 1e-6;

Vin = Vdc + Idc*Rin;

%% Capacitances
C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;

%% Run Simulink 
Tfinal = 60e-3;
SampleTime = 1e-3*(1/fsw);

%% 
ModulationIndex2=1-ModulationIndex1;
k2=5;
fr=fsw/k2;
wr=2*pi*fr;
Lp=82e-6*k2;
Ls=66e-6*k2;
k=0.2;
M=k*sqrt(Lp*Ls);
Cp=1/(wr^2*Lp);
Cs=1/(wr^2*Lp);
RL=50; 




