clc;
clear all;
%%
load('data.mat');
L1=150e-6;
time= Vds532_195.time;
Vds= Vds532_195.Vds;

figure();
plot(time,Vds,'LineWidth',2);
title('Vds')
xlabel('time(s)');
ylabel('Voltage(V)')

figure();
subplot(2,1,1)
plot(time,Vds,'LineWidth',2);
title('Vds')
xlabel('time(s)');
ylabel('Voltage(V)')

subplot(2,1,2)
Ts=(time(2)-time(1));
Fs= 1/Ts;
L=length(time);
Y = fft(Vds);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
stem(f/1000,P1)
xlim([0 6000]);
ylim([0 150]);
grid on;
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (kHz)')
ylabel('|Vds(f)|')

%%
% figure();
% t=linspace(0,1e-6,1000);
% x= 60.46+124.8*sin(2*pi*499.9e3*t)+111.2*sin(2*pi*999.8e3*t)+ ...
%     92.8*sin(2*pi*1500e3*t)+69.25*sin(2*pi*2000e3*t)+47.82*sin(2*pi*2500e3*t)...
%     +28.57*sin(2*pi*2999e3*t)+15.19*sin(2*pi*3499e3*t)+5.883*sin(2*pi*3999e3*t);
% plot(t,x)

Vds = lowpass(Vds,1e4,Fs);
figure();
plot(time,Vds,'LineWidth',2);
title('Vds (Low Pass)')
xlabel('time(s)');
ylabel('Voltage(V)')


%%

[maxVds, max_index] = max(Vds);
a=find(Vds>10);
b=find(Vds<12);
c = intersect(a,b); 
starting_index= c(1);

figure();
time= 0:Ts:Ts*(max_index-starting_index);
Vds= Vds(starting_index: max_index);
plot(time,Vds,'LineWidth',2)
title('Vds (0-max)')
xlabel('time(s)');
ylabel('Voltage(V)')

%%

% Vds_new=[];
% window_size=100;
% for i =window_size:length(Vds)  
% Vds_new= [Vds_new sum(Vds(i-window_size+1:i))/window_size];
% end
% figure();
% plot(Vds_new)

%%
Vds_new=Vds;
%%
Vds_integral_max = trapz(Vds_new(1:end))*Ts;
Cap=[];
Vcap= [];

% Vds_dot = gradient(Vds_new)./Ts;
% time= 0:Ts:Ts*(length(Vds_new)-1);
% Vds_int = customintegral(time,Vds_new);

a=[];
b=[];
for i=2:(length(Vds_new)-10)
    Vds_integral=trapz(Vds_new(1:i))*Ts;
    a=[a Vds_integral];
    Vds_der=(Vds_new(i)-Vds_new(i-1))/Ts;
    b=[b Vds_der];
    C=(Vds_integral_max-Vds_integral)/(L1*Vds_der);
    Cap=[Cap C];
    Vcap=[Vcap ,Vds_new(i)];
end

%%
b1=[];
a1=[];
Vcap1=[];
window_size=200;
for i =window_size:length(b)  
b1= [b1 sum(b(i-window_size+1:i))/window_size];
a1= [a1 sum(a(i-window_size+1:i))/window_size];
Vcap1= [Vcap1 sum(Vcap(i-window_size+1:i))/window_size];
end
figure();
subplot(1,3,1)
plot(b1)
hold on; 
plot(b)
title('Derivative')
subplot(1,3,2)
plot(a1)
hold on; 
plot(a)
title('Integrate')
subplot(1,3,3)
plot(Vcap1)
hold on; 
plot(Vcap)
title('Signal')


%%
Vcap2=[];
Cap3=[];
for i=2:(length(Vcap1))
    C=(Vds_integral_max-a1(i))/(L1*b1(i));
    Cap3=[Cap3 C];
    Vcap2=[Vcap2 ,Vcap1(i)];
end

figure();
plot(Vcap2,Cap3*1e12)
grid on;
ylabel('Coss(pF)')
xlabel('Vds(V)')

%%





figure();
plot(Vcap,Cap*1e12)
grid on;
ylabel('Coss(pF)')
xlabel('Vds(V)')







% Vds_integral_max = trapz(Vds(1:end))*Ts;
% 
% %%C(i)=(Vds_int(peak_index)-Vds_int(i))/(L*Vds_dot(i))
% Cap=[];
% for i=2:max_index-starting_index
%     Vds_intrgral=trapz(Vds(1:i))*Ts
%     C=(Vds_integral_max-Vds_intrgral)/(L*(Vds(i)-Vds(i-1))/Ts);
%     Cap=[Cap C];
% 
% end
% figure();
% plot(Vds(2:end-1),Cap)
% 


%%
% Cap=[];
% Vcap= [];
% for i=2:20:max_index-starting_index
%     
%     C=(Vds_integral_max- trapz(Vds(1:i))*Ts)/(L*(Vds(i)-Vds(i-1))/(10*Ts));
%     Cap=[Cap C];
%     Vcap=[Vcap ,Vds(i)];
% end
% 
% 
% figure();
% plot(Vcap,Cap)

