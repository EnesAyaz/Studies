clear all;
clc;
%% FILL INFORMATION BELOW
Vin=72; %V  (rms)
Vout=48; %V (rms)
P_o=666; %W   
Qs=5; % unitless
f=200e3; %Hz
res_w=2*pi*f; %rad/sec
k=0.2; % chosen coupling factor
%% Calculation
R_L=Vout^2/P_o; %load resistance
Ls=Qs*R_L/res_w;    % secondary coil inductance
Is_rms= Vout/R_L; %secondary current
Ip_rms= P_o/Vin; % primary current assuming eff=1
M=Is_rms*R_L/(res_w*Ip_rms); %calculated mutual inductance
k_c=(1/Qs)*sqrt(1-1/(4*Qs*Qs)); %critical coupling factor
Lp=M^2/(k^2*Ls);    %primary inductance
Cp=1/(res_w^2*Lp);  %primary compansation
Cs=1/(res_w^2*Ls);  %secondary compansation
Lp=10^6*Lp;
Ls=10^6*Ls;
M=10^6*M;

%%%
