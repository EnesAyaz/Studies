clear all;
clc; 
% The code is used for 1p-1s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
% ( without effect of mutual inductance)
%% FILL INFORMATION BELOW
Iin=(4/pi)*5; %V  (rms)
P_o=200; %W   
Qs=4; % unitless
f=150e3; %Hz
k1=0.2; % chosen coupling factor
w=2*pi*f; %rad/sec
%% Calculation
R_L=(10*8/pi^2)*2; % 16.2114
Vout=sqrt(P_o*R_L); %load resistance
Ls=Qs*R_L/w;    % secondary coil inductance
Is_rms= Vout/(R_L); %secondary current
Vp_rms= (P_o)/Iin; % primary current assuming eff=100%
M=Vout/(w*Iin);
Lp=M^2/(k1^2*Ls);  % primary coil inductance

Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
%%

