%% No coupling between secondary
Vin=127;
Ip=7.1475*sqrt(2);
Is1=4.041*sqrt(2);
Is2=1.4371*sqrt(2);
theta=20.76;
alfa=-86.6;
beta=-100.86;
Vout2=106.37*sqrt(2);
Vout1=110.1*sqrt(2);
Vout=(Vout1+Vout2)/2;
w=2*pi*150*1e3;
t=linspace(0,1e-3,10000);
M1=17.89e-6;
M2=16.34e-6;
Ms=13.76e-6;
%%
% ans3=Vin*sin(w*t)-w*M1*Is1
figure();
subplot(2,2,1);
ans=w*M1*Ip*cosd(w*t-theta)+w*Ms*Is2*cosd(w*t-beta);
plot(t,ans,t,Vout*sind(w*t-alfa));
title('seconder 1')
subplot(2,2,2);
ans=w*M1*Is1*cosd(w*t-alfa)+w*M2*Is2*cosd(w*t-beta);
plot(t,ans,t,-Vin*sind(w*t));
title('input')
subplot(2,2,3);
ans=w*M2*Ip*cosd(w*t-theta)+w*Ms*Is1*cosd(w*t-alfa);
plot(t,ans,t,Vout*sind(w*t-beta));
title('seconder 2')