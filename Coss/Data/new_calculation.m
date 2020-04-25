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
figure();
time= 0:Ts:Ts*(max_index-starting_index);
Vds= Vds(starting_index: max_index);
plot(time,Vds,'LineWidth',2)
title('Vds (0-max)')
xlabel('time(s)');
ylabel('Voltage(V)')

%%
Vds_new=[];
window_size=100;
for i =window_size:length(Vds)  
Vds_new= [Vds_new sum(Vds(i-window_size+1:i))/window_size];
end
figure();
plot(Vds_new)
Vds=Vds_new;


%%
Vds_integral_max = trapz(Vds(1:end))*Ts;
Cap=[];
Vcap= [];


a=[];
b=[];
for i=2:(length(Vds)-10)
    Vds_integral=trapz(Vds(1:i))*Ts;
    a=[a Vds_integral];
    Vds_der=(Vds(i)-Vds(i-1))/(Ts);
    b=[b Vds_der];
    C=(Vds_integral_max-Vds_integral)/(L1*Vds_der);
    Cap=[Cap C];
    Vcap=[Vcap ,Vds(i)];
end

%%
figure();
subplot(1,3,1)
plot(b)
title('Derivative')
subplot(1,3,2);
plot(a)
title('Integrate')
subplot(1,3,3)
plot(Vcap)
title('Signal')
%% 
b1=lowpass(b,1,Fs);
figure();
plot(b1)

%%
Vcap2=[];
Cap3=[];
for i=2:(length(Vcap))
    C=(Vds_integral_max-a(i))/(L1*b(i));
    Cap3=[Cap3 C];
    Vcap2=[Vcap2 ,Vcap(i)];
end

figure();
plot(Vcap2,Cap3*1e12)
grid on;
ylabel('Coss(pF)')
xlabel('Vds(V)')

%%








