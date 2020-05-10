
%% Initial Configurations
% clear all;clc;

%% Source parameters
fsw = 40e3;
ffund = 50;
frms = 50;
ModulationIndex1 = 0.9;
Vmodule = 270;

%  PWM
Module1Phase = 0; %in degree

% gate driver
Ls = 0.9e-9;
Ld = 0.9e-9;
PulseAmplitude = 9;
VpulseMax = 6; 
VpulseMin = -3;


%% Load parameters
Vdc = Vmodule;

Vln1 = 0.612*Vmodule/sqrt(3)*ModulationIndex1;
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
SampleTime = 1e-7;

%%
