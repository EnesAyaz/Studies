%%
% Series-series
%  |-----Cp----Lp'---|-----Ls'----Cs-----|
%  |                 |                   | 
%  |                 |                   |
%  Vin               Lm                 Vout
%  |                 |                   |
%  |                 |                   |
%  |-----------------|-------------------|

% Series-Paralel
%  |-----Cp----Lp'---|-----Ls'---|-------|
%  |                 |           |       | 
%  |                 |           |       | 
%  Vin               Lm         Cs      Vout
%  |                 |           |       | 
%  |                 |           |       | 
%  |-----------------|-----------|-------|


% Series-none
%  |-----Cp----Lp'---|-----Ls'-----------|
%  |                 |                   | 
%  |                 |                   |
%  Vin               Lm                 Vout
%  |                 |                   |
%  |                 |                   |
%  |-----------------|-------------------|

%% Series-Series
%   [ Z11 Z12 ] [ip]  = [Vin]
%   [ Z21 Z22 ] [is]    [0]
syms w;
syms Cp;
syms Cs;
syms Lp;
syms Ls;
syms Lm;
syms RL;
syms Vin;
Lp_p=Lp-Lm;
Ls_p=Ls-Lm;

Z11=(1/(1i*w*Cp))+(1i*w*Lp);
% Z12=-1i*w*Lm;
% Z21=-1i*w*Lm;
% Z22=(1/(1i*w*Cs))+(1i*w*Ls)+RL;
% 
% A= [Z11 Z12; Z21 Z22];
% V=[Vin; 0];
% 
% Ip_Is= inv(A)*V;
% Ip= Ip_Is(1);
% Is= Ip_Is(2);
% 
% pretty (Ip);
% pretty (Is);
% 
% Vout= Z21*Ip+Z22*Is;
% 
% H=Vout/Vin;
% 
% pretty(H)
% 
% simplify(H)

%%
w=logspace(0,5,1)
