
%% Simulation parameters
Tfinal=0.20;
SampleTime=1e-7;
%%
fsw=40e3;
SampleTime=(1/fsw)/360;
phasePWM=180;
%%
wr=fsw*2*pi;
%% DC BUS
Vdc=100;
C_DC=1e-6;

%% PARASITICs
LSource= 1e-7;
RSource= 1e-3;
LCAHA= 1e-7;
LHACB= 1e-7;
LCBHB= 1e-7;
COUT=100e-6;
ESRA=1e-7;
ESRB=1e-7;
%% LOAD 
Rload=5;
% LLoad=500e-6;
LLoad=2e-3;

%% WPT
Lp=120e-6;
Ls=120e-6;
M=24e-6;
RL=12;
Cp=1/(4*wr^2*Lp);
Cs=1/(4*wr^2*Ls);

