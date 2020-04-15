
clc;
clear all;
%% No coupling between secondary
Vin=127;
Is1=2.88*sqrt(2);
Is2=2.74*sqrt(2);
% theta=27.52;
% alfa=-95.4;
% beta=-109.66;
% Vout=134.96;
Vout=(0.9*20*4*(Is1+Is2))/(pi*sqrt(2));
a=(0.9*20*(Is1+Is2))/(sqrt(2));
Ip=((a^2/20)/Vin)*sqrt(2)^2;
w=2*pi*150*1e3;
% t=linspace(0,1e-3,10000);
M1=17.17e-6;
% M2=14.93e-6;
M2=15.67e-6;
% Ms=20.64e-6;
%%
% % ans3=Vin*sin(w*t)-w*M1*Is1
% figure();
% subplot(2,2,1);
% ans=w*M1*Ip*cosd(w*t-theta)+w*Ms*Is2*cosd(w*t-beta);
% plot(t,ans,t,Vout*sind(w*t-alfa));
% title('seconder 1')
% subplot(2,2,2);
% ans=w*M1*Is1*cosd(w*t-alfa)+w*M2*Is2*cosd(w*t-beta);
% plot(t,ans,t,-Vin*sind(w*t));
% title('input')
% subplot(2,2,3);
% ans=w*M2*Ip*cosd(w*t-theta)+w*Ms*Is1*cosd(w*t-alfa);
% plot(t,ans,t,Vout*sind(w*t-beta));
% title('seconder 2')
%% Alfa and Beta Finding
K1=w*M1*Is1;
K2=w*M2*Is2;
if K1+K2>Vin
        x1= acosd((Vin^2-K1^2-K2^2)/(-2*K1*K2));
        x=180-x1;
        a=(1+K1*cosd(x)/K2)/ (K1*sind(x)/K2);
        alpha= atand((1+K1*cosd(x)/K2)/ (K1*sind(x)/K2));
        if(alpha<90)
            alpha=-alpha;
        else 
            alpha=180-alpha;
            
        end
        betta=-x1+180+abs(alpha);
        if alpha <90
            betta=-180+betta;
            
        else 
            betta=-betta;
        end
else 
        x=0;
        x1=180;
        alpha=-90;
        betta=-90;
       disp('increase the secondary current')
   
end


%% o=[cos(theta), sin(theta), Ms]  A*o=V  o = A^-1*V
A11=w*M1*Ip; A12=0 ; A13=w*Is2*cosd(betta);
A21=0 ; A22=w*M1*Ip; A23=w*Is2*sind(betta);
A31=w*M2*Ip; A32 =0; A33=w*Is1*cosd(alpha);
A41=0; A42=w*M2*Ip; A43=w*Is1*sind(alpha);

A=[A11, A12, A13; A21, A22, A23; A31, A32,A33;A41, A42, A43];
v=[-Vout*sind(alpha); Vout*cosd(alpha); -Vout*sind(betta); Vout*cosd(betta)];
inverse_A= pinv(A);
o=inverse_A*v;
c=o(3)/68.8e-6;
x3=o(1)^2+o(2)^2;
o(1);
o(2);
fprintf('%f\n',x3)
fprintf('Coupling is %f.2',c)

