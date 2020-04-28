clc;
clear all;
% 
% load('param.mat');
% w=2*pi*150e3;
% i=2;
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
% % Ip= param.Ip(i)*sqrt(2);
% % alpha= -param.alpha(i);
% % beta= -param.beta(i);
% theta= param.theta(i);
% Vout= (Is1+Is2)*20;
% Ip_f= Vout*(Is1+Is2)/Vin;

%%
% clc;
% clear all;
% 
w=2*pi*150e3;
Lp= 107.42e-6;
Ls=68.8e-6;
M1= 17.19e-6;
M2 = 15.47e-6;
Vin=127;
Is1= 3.1723*sqrt(2);
Is2= 2.6536*sqrt(2);
Vout= (Is1+Is2)*20*8/(pi^2);
Ip_f= Vout*(Is1+Is2)/Vin;



%%
K1=w*M1*Is1;
K2=w*M2*Is2;
Vin_new=K1+K2;
if K1+K2>Vin
    x1= acosd((Vin^2-K1^2-K2^2)/(-2*K1*K2));
    x=180-x1;
    a=(1+K2*cosd(x)/K1)/ (K2*sind(x)/K1);
    alpha= atand((1+K2*cosd(x)/K1)/ (K2*sind(x)/K1));
    beta=alpha+x;  
end

%%

K3=w*M2*Ip_f;
K4=Vout*sind(beta);
K5=w*Is1*sind(90+alpha);
(-K3+K4)/K5;
ks1=((-K3+K4)/K5)/Ls

K3=w*M1*Ip_f;
K4=Vout*sind(alpha);
K5=w*Is2*sind(90+beta);
(-K3+K4)/K5;
ks2=((-K3+K4)/K5)/Ls

(abs(ks1)+abs(ks2))/2;

%%
A1=w*M2*Ip_f;
B1=w*Is1*cosd(90+alpha);
C1 = Vout*cosd(beta);

A2=0;
B2=w*Is1*sind(90+alpha);
C2= Vout*sind(beta)-w*M2*Ip_f;

A=[A1, B1; A2, B2];
inv_A=inv(A);
x=inv_A*[C1;C2];
x(2)/Ls
atand(x(1))


%%
% A=w*M2*Ip_f*cosd(beta-90);
% B=w*M2*Ip_f*sind(beta-90);
% C=w*Is1*cosd(90+alpha-beta);
% D=Vout;
% E=w*Is1*sind(90+alpha-beta);
% 
% Z= (A*D-A^2-B^2)/(A*C-B*E);
% ans=Z/Ls
% 
% A=w*M2*Ip_f*cosd(beta-90);
% B=w*M2*Ip_f*sind(beta-90); 
% C=w*Is1*cosd(90+alpha-beta);
% D=Vout;
% e1=A-B*tand(theta)+C*Ms-D
% 
% E=w*M1*Ip_f*cosd(alpha-90);
% F=w*M1*Ip_f*sind(alpha-90); 
% G=w*Is1*cosd(90-alpha+beta);
% D=Vout;
% e2=E-F*tand(theta)+G*Ms-D
% 
% %%
% Z= ((D*F)-(D*B)+(B*E)-(A*F))/((F*C)-(B*G))
% ks=Z/Ls
% 
% tan_t= abs((G*D-C*D-G*A+C*E)/(C*F-G*B));
% % 
% % Z= (D+B*tan_t-A)/C;
% % ks=Z/Ls

%%
Vout2=94.305;
Vout1=94.565;
Is2=2.6536;
Is1=3.1723;
Q2=abs((1i*(Is2*w*Ls)+Vout2))/ Vout2

Q1=(abs((1i*(Is1*w*Ls)+Vout1))/ Vout1)

