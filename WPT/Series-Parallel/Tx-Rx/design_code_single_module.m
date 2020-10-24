clear all;
clc; 
%% FILL INFORMATION BELOW
Vin=90; %V  (rms)
P_o=500; %W   
Qs=4; % unitless
f=150e3; %Hz
w=2*pi*f; %rad/sec
k=0.23; % chosen coupling factor

%% Calculation Series-compensated 
R_L=(20*8/pi^2)*2; %% single module R_L
Vout=sqrt((P_o)*(R_L)); %single module Vout
Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout); % secondary current 
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);    %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
Lp=10^6*Lp;
Ls=10^6*Ls;
M=10^6*M;
%%

%% FILL INFORMATION BELOW
Vin=90; %V  (rms)
P_o=500; %W   
Qs=2; % unitless
f=150e3; %Hz
w=2*pi*f; %rad/sec
k=0.23; % chosen coupling factor

%%
% %% Calculation Series-compensated 
% R_L=(20*8/pi^2)*2; %% single module R_L
% Vout=sqrt((P_o)*(R_L)); %single module Vout
% Ip_rms= P_o/Vin; % primary current assuming eff=1
% Is_rms=(P_o/Vout); % secondary current 
% M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
% Ls=Qs*R_L/w;    % secondary coil inductance
% Lp=M^2/(k^2*Ls);    %primary inductance
% Cp=1/(w^2*Lp);  %primary compansation
% Cs=1/(w^2*Ls);  %secondary compansation
% Lp=10^6*Lp;
% Ls=10^6*Ls;
% M=10^6*M;

