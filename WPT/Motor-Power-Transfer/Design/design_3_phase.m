clear all;
clc; 
% The code is used for 1p-2s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
% ( without effect of mutual inductance)
% We keep our modules 
%% FILL INFORMATION BELOW
Vin=16; %V  (rms) % smaller coefficient
P_o=16; %W   
Qs=4; % unitless
f=40e3; %Hz
w=2*pi*f; %rad/sec
k=0.16; % chosen coupling factor
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
%% Calculation Series-compensated paralel DC BUS
R_L=2; %% single module R_L
% Vout=sqrt((P_o)*(R_L)); %single module Vout
Vout=24;
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
Cp=Cp*1e6;
Cs=Cs*1e6;
A=[Lp Ls M Cp Cs]


