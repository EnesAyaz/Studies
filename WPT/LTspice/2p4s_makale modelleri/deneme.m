clear all;
clc;
%%
Vin=89.9;
Is1=3.6703;
Is2=2.0747;
Vout=112;
f=150;
M1=17.89;
M2=14.78;

% alfa=-83.93;
% beta=-102.58;
% M1=17.89e-6;
% M2=14.78e-6;
% Ip=8.3743*sqrt(2);
% Is1=3.6703*sqrt(2);
% Is2=2.0747*sqrt(2);

%%

w=2*pi*f*1e3;
M1=M1*1e-6;
M2=M2*1e-6;
Vin=Vin*sqrt(2);
Is1=Is1*sqrt(2);
Is2=Is2*sqrt(2);
Vout=Vout*sqrt(2);
Ip_f= Vout*(Is1+Is2)/Vin;

K1=w*M1*Is1;
K2=w*M2*Is2;
if K1+K2>Vin
    x1= acosd((Vin^2-K1^2-K2^2)/(-2*K1*K2));
    x=180-x1;
    a=(1+K2*cosd(x)/K1)/ (K2*sind(x)/K1);
    alpha= atand((1+K2*cosd(x)/K1)/ (K2*sind(x)/K1));
    beta=alpha+x;  
end

%% Ms foundation
% K3=w*M1*Ip_f;
% K4=w*Is2*sind(90-alpha+beta);
% K5=w*Is2*cosd(90-alpha+beta);
% Ms=(2*cosd(alpha-90)-(Vout/K3))/((K4-K5)/K3);

K3=w*M2*Ip_f;
K4=w*Is1*sind(90+alpha-beta);
K5=w*Is1*cosd(90+alpha-beta);
Ms=(2*cosd(beta-90)-(Vout/K3))/((K4-K5)/K3);




