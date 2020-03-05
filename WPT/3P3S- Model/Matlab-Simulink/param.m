%Simulation Parameters
stop_time= 1e-4;
step_size=1e-9;

%% DC Bus 
V_DC= 100;
R_DC=1e-1;
L_DC= 1e-6;
C_DC=100e-6;
C_DC_ESR=1e-1;
C_DC_ESL=1e-6;

%% LOAD

RpA=15;
LpA=80e-6;
CpA= 10e-9;
RpB=10;
LpB=67e-6;
CpB= 10e-9;
RpC=10;
LpC=67e-6;
CpC= 10e-9;

%% frequency

f_resonance= 1/(2*pi*sqrt(LpA*CpA));
duty=0.5;



