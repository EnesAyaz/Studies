clc;
clear all;

% load('param.mat');
% w=2*pi*150e3;
% i=3;
% Lp= 88e-6;
% Ls=68.8e-6;
% M1= param.k1(i)*sqrt(Lp*Ls);
% M2 = param.k2(i)*sqrt(Lp*Ls);
% Ms= -param.ks(i)*Ls;
% Vin= param.Vin(i)*sqrt(2);
% Vout1= param.Vout1(i)*sqrt(2);
% Vout2= param.Vout2(i)*sqrt(2);
% Is1= param.Is1(i)*sqrt(2);
% Is2= param.Is2(i)*sqrt(2);
% Ip= param.Ip(i)*sqrt(2);
% alpha= -param.alpha(i);
% beta= -param.beta(i);
% theta= param.theta(i);

%%

w=2*pi*150e3;
Lp= 107.42e-6;
Ls=68.8e-6;
M1= 17.19e-6;
M2 = 15.47e-6;
Ms= 0.3*Ls;
Vin= 127;
Vout=133.56;
Is1= 3.1723*sqrt(2);
Is2= 2.6536*sqrt(2);
Ip= 7.1049*sqrt(2);
alpha= -85.84;
beta= -95.55;
theta= 33.090347;

%%
t=linspace(0,1e-3,10000);
figure();
subplot(2,2,1);
ans=w*M1*Ip*cosd(w*t-theta)+w*Ms*Is2*cosd(w*t-beta);
plot(t,ans,t,Vout*sind(w*t-alpha));
title('seconder 1')
subplot(2,2,2);
ans=w*M1*Is1*cosd(w*t-alpha)+w*M2*Is2*cosd(w*t-beta);
plot(t,ans,t,-Vin*sind(w*t));
title('input')
subplot(2,2,3);
ans=w*M2*Ip*cosd(w*t-theta)+w*Ms*Is1*cosd(w*t-alpha);
plot(t,ans,t,Vout*sind(w*t-beta));
title('seconder 2')