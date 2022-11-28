%%
time= CMC_NN.time;
NN_current= CMC_NN.signals.values;

figure();
plot(time,NN_current)

Fs = 1/(time(2)-time(1)) ;            % Sampling frequency                    
L=length(time);
Y = fft(NN_current);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")

xlim([0 80e3])


%%
time= CMC_NT.time;
NT_current= CMC_NT.signals.values;
figure();
plot(time,NT_current)

Fs = 1/(time(2)-time(1)) ;            % Sampling frequency                    
L=length(time);
Y = fft(NT_current);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")

xlim([0 80e3])

%%

time= CMV_NN.time;
NN_voltage= CMV_NN.signals.values;
figure();
plot(time,NN_voltage)

Fs = 1/(time(2)-time(1)) ;            % Sampling frequency                    
L=length(time);
Y = fft(NN_voltage);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")

xlim([0 80e3])


%%

time= CMV_NT.time;
NT_voltage= CMV_NT.signals.values;
figure();
plot(time,NT_voltage)

Fs = 1/(time(2)-time(1)) ;            % Sampling frequency                    
L=length(time);
Y = fft(NT_voltage);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")

xlim([0 80e3])

%%

