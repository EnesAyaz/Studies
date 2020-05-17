
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


%%

% Tüm parazitikler var
% ACapToDrain = 7.14e-9;
% ACapToSource = 5.65e-9;
% ASourceToLoad = 3.724e-9;
% ADrainToLoad = 3.724e-9;
% APosToCap = 29.8e-9;
% ANegToCap = 48.6e-9;
% % % 
% BCapToDrain = 7.233e-9;
% BCapToSource = 5.434e-9;
% BSourceToLoad = 3.933e-9;
% BDrainToLoad = 3.933e-9;
% BPosToCap = 2.63e-9;
% BNegToCap = 3.183e-9;
% % % 
% CCapToDrain = 7.145e-9;
% CCapToSource = 5.4e-9;
% CSourceToLoad = 3.242e-9;
% CDrainToLoad = 3.242e-9;
% CPosToCap = 43.665e-9;
% CNegToCap = 31.2e-9;

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
SampleTime = 1e-8;
