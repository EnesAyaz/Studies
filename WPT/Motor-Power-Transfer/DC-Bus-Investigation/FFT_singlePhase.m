%% 
% x=1
load('FFT_result3.mat')

tout=IDc{1}.Values.Time;
y=IDc{1}.Values.Data;
% plot(tout,y);

f_s= 1/(tout(2)-tout(1));
y = fft(y);
L=length(y);
P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f= f_s*(0:(L/2))/L;

P1((P1/max(P1))<0.05)=NaN;

figure();
stem(f/1000,P1,'b','LineWidt',3)
% xlim([0 x])
hold on;


load('FFT_result_withoutWPT3.mat')

tout=IDc{1}.Values.Time;
y=IDc{1}.Values.Data;
% plot(tout,y);

f_s= 1/(tout(2)-tout(1));
y = fft(y);
L=length(y);
P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f= f_s*(0:(L/2))/L;

P1((P1/max(P1))<0.05)=NaN;


stem(f/1000,P1,'r','LineWidt',3)
% xlim([0 160])
legend('/WPT','/outWPT')
set(gca,'Fontsize',20)
xlabel('Frequency(kHz)')
ylabel('Inverter Current(A)')

%%




%% 
% x=1
load('FFT_result3.mat')

tout=IMotor{2}.Values.Time;
y=IMotor{2}.Values.Data;
% plot(tout,y);

f_s= 1/(tout(2)-tout(1));
y = fft(y);
L=length(y);
P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f= f_s*(0:(L/2))/L;

P1((P1/max(P1))<0.05)=NaN;

figure();
stem(f/1000,P1,'b','LineWidt',3)
% xlim([0 x])
hold on;


load('FFT_result_withoutWPT3.mat')

tout=IMotor{2}.Values.Time;
y=IMotor{2}.Values.Data;
% plot(tout,y);

f_s= 1/(tout(2)-tout(1));
y = fft(y);
L=length(y);
P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f= f_s*(0:(L/2))/L;

P1((P1/max(P1))<0.05)=NaN;


stem(f/1000,P1,'r','LineWidt',3)
% xlim([0 160])
legend('/WPT','/outWPT')
set(gca,'Fontsize',20)
xlabel('Frequency(kHz)')
ylabel('Motor Current(A)')
%%


%% 
% x=1
load('FFT_result3.mat')

tout=IWpt{1}.Values.Time;
y=IWpt{1}.Values.Data;
% plot(tout,y);

f_s= 1/(tout(2)-tout(1));
y = fft(y);
L=length(y);
P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f= f_s*(0:(L/2))/L;

P1((P1/max(P1))<0.05)=NaN;

figure();
stem(f/1000,P1,'b','LineWidt',3)
% xlim([0 x])
hold on;

legend('/WPT')
set(gca,'Fontsize',20)
xlabel('Frequency(kHz)')
ylabel('WPT Current(A)')