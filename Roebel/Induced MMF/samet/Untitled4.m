% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 1);
% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";
% Specify column names and types
opts.VariableNames = "Flux";
opts.VariableTypes = "double";
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
tbl = ...
readtable("D:\Github\Studies\Roebel\Induced MMF\samet\Calculator Expressions Plot 1_memory_solved - Copy.csv",...
opts);
% Convert to output type
Flux = tbl.Flux;
% Clear temporary variables
clear opts tbl

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
plot(VB);
hold on;
plot(VA-VB);
% hold on;
% plot(Flux)
%%
stem(f*2*pi,P1/max(P1)) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("Harmonic number")
ylabel("|P1(f)|")
xlim([0 21])
ylim([0 1])







