clc;
clear all;
%%
load('data.mat');
L1=150e-6;
time= Vds532_195.time;
Vds= Vds532_195.Vds;
%%
figure();
plot(time,Vds,'LineWidth',2);
title('Vds')
xlabel('time(s)');
ylabel('Voltage(V)')
%%
Ts=(time(2)-time(1));
Fs=1/Ts;
Vds = lowpass(Vds,1e4,Fs);
figure();
plot(time,Vds,'LineWidth',2);
title('Vds (Low Pass)')
xlabel('time(s)');
ylabel('Voltage(V)')


%%
[maxVds, max_index] = max(Vds);
a=find(Vds>3);
b=find(Vds<5);
c = intersect(a,b); 
starting_index= c(1);
%%








