clear all;
clc; 
% The code is used for 1p-2s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
% ( without effect of mutual inductance)
% We keep our modules 
%% FILL INFORMATION BELOW
Vin=12; %V  (rms) % smaller coefficient
P_o=48; %W   
Qs=2.5; % unitless
f=40e3; %Hz
w=2*pi*f; %rad/sec
k=0.20; % chosen coupling factor
Vout=24; %V (rms)
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
%% Calculation Series-compensated paralel DC BUS
R_L=12; %% single module R_L
% Vout=sqrt((P_o)*(R_L)); %single module Vout
Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);    %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
Lp=10^6*Lp;
Ls=10^6*Ls;
M=10^6*M;
Cp=Cp*1e9;
Cs=Cs*1e9;
A=[Lp Ls M Cp Cs]


