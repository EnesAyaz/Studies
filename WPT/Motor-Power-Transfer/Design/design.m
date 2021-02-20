clear all;
clc; 
% The code is used for 1p-2s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
% ( without effect of mutual inductance)
% We keep our modules 
%% FILL INFORMATION BELOW
Vin=100; %V  (rms) % smaller coefficient
P_o=300; %W   
Qs=2.5; % unitless
f=40e3; %Hz
w=2*pi*f; %rad/sec
k=0.50; % chosen coupling factor
Vout=35; %V (rms)
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
% Calculation Series-compensated paralel DC BUS
R_L=(Vout^2)/P_o; %% single module R_L
% Vout=sqrt((P_o)*(R_L)); %single module Vout
Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w    % secondary coil inductance
Lp=M^2/(k^2*Ls)  %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
% Lp=10^3*Lp
% Ls=10^6*Ls;
% M=10^6*M;
% Cp=Cp*1e9;
% Cs=Cs*1e9;
% A=[Lp Ls M Cp Cs]
%%
%% Analytical model 

%
%   
%    |-- r1----Cp----Lp'(Lp-M)---|---Ls'(Ls-M)--Cs-|
%    |                          |                 |      
%    |                          |                 |
% --|V_in|--                --Lm--            --RLoad--
%    |                          |                 | 
%    |                          |                 |
%    |-------r2-----------------|-----------------|
%
%
%  Create T-model of coupled inductor at steady state
%  Sinosoidal response 
% at above circuit is represented and parameter name
% is given. I give a name Lp' as Lp and Ls' as Ls. 

%%

V_in=100; % phase is zero. Magnitude is 1
r1=0.01; % ohm
r2= 0.01; % ohm 
Lp=Lp-M; % Henry as actually Lp-m Lp is 120u
Ls=Ls-M; % Henry as actually Ls-m Ls is 120u
Lm= M; % Henry 
R_load=R_L; % ohm
f=logspace(4,5.2,200);
w=2*pi*f;
%%
Z1= 1i.*w*Ls +R_load- 1i./(w*Cs);
Z2=1i.*w*Lm;
Z3= 1i.*w*Lp+r1+r2-1i./(w*Cp);
Z12= ((Z1.*Z2)./(Z1+Z2));
Z123=Z12+Z3;
%%
V1= (Z12./Z123)*V_in; 
V_load= (R_load./(1i*w*Ls+R_load-1i./(w*Cs))).*V1;
response1= angle(V_load)*180/pi;
response= abs(V_load);
%%
figure;
hold on;
yyaxis left
plot(f,response,'Linewidth',2);
hold on; 
yyaxis right
plot(f,response1,'Linewidth',2);
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
ylabel({'Frequency Response'  ' |Vo|'} ...
    ,'FontSize',14,'FontWeight','Bold');
set(gca, 'XScale', 'log')
grid on;
set(gca,'FontSize',10);
%%
% legend('k=0.1','k=0.15','k=0.20','k=0.25','k=0.30','k=0.40','k=0.50');
% legend('Lp=0.1','Lp=0.15','Lp=0.20','Lp=0.25','Lp=0.30','Lp=0.40','Lp=0.50');
figure;
hold on;
yyaxis left
plot(f,response,'Linewidth',2);
hold on; 
yyaxis right
plot(f,response1,'Linewidth',2);
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
ylabel({'Frequency Response'  ' |Vo|'} ...
    ,'FontSize',14,'FontWeight','Bold');
set(gca, 'XScale', 'log')
grid on;
set(gca,'FontSize',10);
