
%% Source parameters
fsw = 40e3;
ffund = 50;
frms = 50;
ModulationIndex1 = 0.9;
Vdc = 270;
Module1Phase = 0;

%% Yes ESL and ESR
ESLA = 19e-9;
ESLB = 19e-9;
ESLC = 19e-9;
ESRA = 21.1e-3;
ESRB = 21.1e-3;
ESRC = 21.1e-3;

%% PWM

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

% RATop  = 03.40e-9;
% RABot  = 20.25e-9;
% RAMid  = 01.30e-9;
% RBTop  = 03.38e-9;
% RBBot  = 20.38e-9;
% RBMid  = 01.30e-9;
% RCTop  = 03.41e-9;
% RCBot  = 20.94e-9;
% RCMid  = 01.30e-9;
% RABTop = 18.30e-9;
% RABBot = 10.20e-9;
% RBCTop = 21.84e-9;
% RBCBot = 11.14e-9;

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
Rin = 20; % former value was 10
Lin = 1e-4;

Vin = Vdc + Idc*Rin;

%% Capacitances
C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;

%% Run Simulink 
Tfinal = 60e-3;
SampleTime = 1e-8;
