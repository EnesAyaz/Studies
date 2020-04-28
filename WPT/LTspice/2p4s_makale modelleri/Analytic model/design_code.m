clear all;
clc; 
% The code is used for 1p-1s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
% ( without effect of mutual inductance)
%% FILL INFORMATION BELOW
Vin=90; %V  (rms)
P_o=500; %W   
Qs=4; % unitless
f=150e3; %Hz
w=2*pi*f; %rad/sec
k=0.2; % chosen coupling factor
%% Calculation
R_L=(10*8/pi^2)*2;
Vout=sqrt(P_o*R_L); %load resistance
Ls=Qs*R_L/w;    % secondary coil inductance
Is_rms= Vout/(R_L); %secondary current
Is_rms2= sqrt(P_o/R_L);
Ip_rms= 500/Vin; % primary current assuming eff=1
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance
k_c=(2/Qs)*sqrt(1-1/(Qs*Qs))/sqrt(2); %critical coupling factor
Lp=M^2/(k^2*Ls);    %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
% Lp=10^6*Lp;
% Ls=10^6*Ls;
% M=10^6*M;
Qs_new= abs(w*(Is_rms*Ls+ 1i*Ip_rms*M))/Vout;
Qs_half= abs(w*(Is_rms*Ls/2+ 1i*Ip_rms*M))/Vout;
%%

