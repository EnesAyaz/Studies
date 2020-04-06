clear all;
clc;
%% FILL INFORMATION BELOW
Vin=90; %V  (rms)
Vout=100; %V (rms)
P_o=500; %W   
Qs=4; % unitless
f=150e3; %Hz
res_w=2*pi*f; %rad/sec
k=0.23; % chosen coupling factor
%% Calculation
R_L=(10*8/pi^2)*2;
Vout=sqrt(P_o*R_L); %load resistance
% R_L=10.3;
Ls=Qs*R_L/res_w;    % secondary coil inductance
Is_rms= Vout/(R_L); %secondary current
Is_rms2= sqrt(P_o/R_L);
Ip_rms= P_o/Vin; % primary current assuming eff=1
M=Is_rms*R_L/(res_w*Ip_rms); %calculated mutual inductance
k_c=(2/Qs)*sqrt(1-1/(Qs*Qs))/sqrt(2); %critical coupling factor
Lp=M^2/(k^2*Ls);    %primary inductance
Cp=1/(res_w^2*Lp);  %primary compansation
Cs=1/(res_w^2*Ls);  %secondary compansation
Lp=10^6*Lp;
Ls=10^6*Ls;
M=10^6*M;
%%
