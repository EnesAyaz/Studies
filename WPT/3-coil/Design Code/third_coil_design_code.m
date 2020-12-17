clear all;
clc; 
% The code is used for 1p-1s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
% ( without effect of mutual inductance)
%% FILL INFORMATION BELOW
Vin=90; %V  (rms)
P_o=500; %W   
Qs=4; % unitless
fo=150e3; %Hz
k1=0.2; % chosen coupling factor
k2=0.4-k1;
f=fo/ (sqrt(1+sqrt(k1^2+k2^2)));
w=2*pi*f; %rad/sec
%% Calculation
R_L=(10*8/pi^2)*2;
Vout=sqrt(P_o*R_L); %load resistance
Ls=Qs*R_L/w;    % secondary coil inductance
Is_rms= Vout/(R_L); %secondary current
Ip_rms= (P_o)/Vin; % primary current assuming eff=100%
Ir_rms=Ip_rms;
Ms=Vout/(w*Ir_rms);
Mp=Vin/(w*Ir_rms);
Lr=Ms^2/(k2^2*Ls);    %third coil inductance
Lp=Mp^2/(k1^2*Lr);  % primary coil inductance

Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
Cr=1/(w^2*Lr);  %secondary compansation

%%

