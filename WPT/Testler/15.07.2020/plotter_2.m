load('MA135.mat');
figure();

subplot(3,1,1)
yyaxis left;
plot(timeTx,IinVin*20)
ylabel('Input FB Voltage (V)')
xlabel('time')
hold on;
yyaxis right;
plot(timeTx,Iin*5)
ylabel(' Transmitter Current (A)')
xlabel('time')
xlim([-1e-5, 1e-5])
ylim([-10 10 ])
set(gca,'fontSize',18)

subplot(3,1,2)
yyaxis left;
plot(timeRx1,Is1Vin*20)
ylabel('Input FB Voltage (V)')
xlabel('time')
hold on;
yyaxis right;
plot(timeRx1,Is1*5)
ylabel(' Receiver-1 Current (A)')
xlabel('time')
xlim([-1e-5, 1e-5])
ylim([-6 6])
set(gca,'fontSize',18)

subplot(3,1,3)
yyaxis left;
plot(timeRx2,Is2Vin*20)
ylabel('Input FB Voltage (V)')
xlabel('time')
hold on;
yyaxis right;
plot(timeRx2,Is2*5)
ylabel(' Receiver-2 Current (A)')
xlabel('time')
xlim([-1e-5, 1e-5])
ylim([-6 6 ])
set(gca,'fontSize',18)