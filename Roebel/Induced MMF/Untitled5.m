
%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 1);
% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:A600";
% Specfy column names and types
opts.VariableNames = "e05";
opts.VariableTypes = "double";
% Import the data
Flux = readtable("D:\Github\Studies\Roebel\Induced MMF\samet\Book1.xlsx", opts, "UseExcel", false);
Flux = table2array(Flux);
%Clear temporary variables
clear opts
Flux=[0 ;Flux];

%%

p=8; % pole
length_pole=round(length(Flux)/p);

flux_per_pole=[];
Flux2=[Flux;Flux];

for i=0:length(Flux)
    Sum=0;
    for j=1:length_pole
    Sum=Sum+Flux2(i+j);
    end
    
    flux_per_pole=[flux_per_pole; Sum];
    
end


%%
figure();
plot(Flux)
hold on;
plot(flux_per_pole)

%% Induced Voltage
% flux_per_pole2=[flux_per_pole; flux_per_pole]
w=2*pi*50;

delta_theta=pi/length_pole;
Delta_flux=[];
for i=2:length(flux_per_pole)

    Delta_flux=[Delta_flux ; flux_per_pole(i)-flux_per_pole(i-1)];

end

%%
Vln=100*w*Delta_flux/delta_theta;
Vln2=[Vln;Vln];

phase_B_phase=round(4*pi/3/delta_theta);

VA=Vln;
VB=Vln2(phase_B_phase:phase_B_phase+length(VA)-1);

%%
figure();
plot(VA);
hold on;
plot(Flux*500000);
hold on;
% plot(VA-VB);
% hold on;
% plot(Flux)

%%
i=1;
theta=pi/75;
Flux_fft=flux_per_pole(i:end);
Y = fft(Flux_fft);
L=length(Flux_fft);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P4 = angle(Y/L);
P5 = P4(1:L/2+1);
P5(2:end-1) = P5(2:end-1);
Fs=1/theta;
f = Fs*(0:(L/2))/L;

%%
stem(f*2*pi,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("Harmonic number")
ylabel("|P1(f)|")
xlim([0 40])
ylim([0 1])

%%
stem(f*2*pi,180*P5/pi) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("Harmonic number")
ylabel("|P1(f)|")
xlim([0 40])
ylim([-180 180])




