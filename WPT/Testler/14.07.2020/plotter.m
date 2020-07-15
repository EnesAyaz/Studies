load('Full_DATA.mat');

%% Full-Aligned 150kHz Res Cap

FA150Vin; FA150Iin; FA150Is1; FA150Is2; time_FA150;

figure();
yyaxis left;
plot(time_FA150,FA150Vin*20)
ylabel('Input Square Wave Voltage (V)')
xlabel('time')
hold on;
yyaxis right;
plot(time_FA150,FA150Iin*5)
ylabel(' Transmitter Current (A)')
xlabel('time')

figure();
plot(time_FA150,FA150Is1*5)
hold on; 
plot(time_FA150,FA150Is2*5)
ylabel('Current (A)')
xlabel('time')
title('Receiver Current');
%%
%% Mis-Aligned 150kHz Res Cap

MA150Vin; MA150Iin; MA150Is1; MA150Is2; time_MA150;

figure();
yyaxis left;
plot(time_MA150,MA150Vin*20)
ylabel('Input Square Wave Voltage (V)')
xlabel('time')
hold on;
yyaxis right;
plot(time_FA150,MA150Iin*5)
ylabel(' Transmitter Current (A)')
xlabel('time')
figure();
plot(time_FA150,MA150Is1*5)
hold on; 
plot(time_FA150,MA150Is2*5)
ylabel('Current (A)')
xlabel('time')
title('Receiver Current');
%%

%% Full-Aligned 135kHz Res Cap

FA135Vin; FA135Iin; FA135Is1; FA135Is2; time_FA135;

figure();
yyaxis left;
plot(time_FA135,FA135Vin*20)
ylabel('Input Square Wave Voltage (V)')
xlabel('time')
hold on;
yyaxis right;
plot(time_FA150,FA135Iin*5)
ylabel(' Transmitter Current (A)')
xlabel('time')

figure();
plot(time_FA150,FA135Is1*5)
hold on; 
plot(time_FA150,FA135Is2*5)
ylabel('Current (A)')
xlabel('time')
title('Receiver Current');
%%

%% Full-Aligned 135kHz Res Cap

MA135Vin; MA135Iin; MA135Is1; MA135Is2; time_MA135;

figure();
yyaxis left;
plot(time_MA135,MA135Vin*20)
ylabel('Input Square Wave Voltage (V)')
xlabel('time')
hold on;
yyaxis right;
plot(time_FA150,MA135Iin*5)
ylabel(' Transmitter Current (A)')
xlabel('time')

figure();
plot(time_FA150,MA135Is1*5)
hold on; 
plot(time_FA150,MA135Is2*5)
ylabel('Current (A)')
xlabel('time')
title('Receiver Current');

%% Comparison 

figure();
subplot(2,1,1)
plot(time_FA150,MA150Is1*5)
hold on; 
plot(time_FA150,MA150Is2*5)
hold on; 
max2= 5*max(MA150Is1)*ones([size(time_FA150),1]);
plot(time_FA150,max2,'k','LineWidth',5)
hold on; 
max3= 5*max(MA150Is2)*ones([size(time_FA150),1]);
plot(time_FA150,max3,'k','LineWidth',5)

diff=string(max2(1)-max3(1));
text(0.3e-5,3.5,strcat("Delta-Current=",diff),'FontSize',20)

xlim([-1e-5, 1e-5])
set(gca,'fontSize',18)
ylabel('Current (A)')
xlabel('time')
grid on;
title(' Receiver with same resonant frequency');
legend('Rx-1','Rx-2')


subplot(2,1,2)
plot(time_FA135,MA135Is1*5)
hold on; 
plot(time_FA135,MA135Is2*5);
hold on; 


max2= 5*max(MA135Is1)*ones([size(time_FA135),1]);
plot(time_FA135,max2,'k','LineWidth',5)
hold on; 
max3= 5*max(MA135Is2)*ones([size(time_FA135),1]);
plot(time_FA135,max3,'k','LineWidth',5)


xlim([-1e-5, 1e-5])
diff=string(max2(1)-max3(1));
text(0.3e-5,3.4,strcat("Delta-Current=",diff),'FontSize',20)
set(gca,'fontSize',18)
ylabel('Current (A)')
xlabel('time')
grid on; 
title('Receiver with smaller resonant frequency ');
legend('Rx-1 ','Rx-2')



