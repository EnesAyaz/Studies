%% Simulation parameters
fsw=80e3;
SampleTime=(1/fsw)/360;
SampleTime=1e-8;
Tfinal=0.002;
phasePWM=180;
%% DC SUPPLY
VDC=100;
LSource= 1e-6;
RSource= 0.1;

%% Full-Bridge Parameters
C_DCA=1e-6;
C_DCB=1e-6;
ESRA=1e-7;
ESRB=1e-7;
%% Parasitics
RA_parasitic=1e-3;
LA_parasitic=1e-8;
RB_parasitic=1e-3;
LB_parasitic=1e-8;
RAB_parasitic=1e-3;
LAB_parasitic=1e-8;
RA_mid_parasitic=1e-3;
LA_mid_parasitic=1e-8;
RB_mid_parasitic=1e-3;
LB_mid_parasitic=1e-8;
%% MOTOR 
Rmotor=2;
Lmotor=1e-3;
Kf=0.1157;
J=0.001;
Bm=0;
Tf=1;
w0=0;
%%  Load Torque
TL=5;

%% WPT
fr=65e3;
wr=fr*2*pi;
Lp=205e-6;
Ls=51e-6;
M=41e-6;
RL=8.44*1.2337;
Cs=115e-9;
Cp=28.5e-9;

