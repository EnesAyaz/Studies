opts = delimitedTextImportOptions("NumVariables", 1);
opts.DataLines = [1, Inf];
opts.Delimiter = ",";
opts.VariableNames = "voltage";
opts.VariableTypes = "double";
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
tbl = readtable("D:\Github\Studies\Roebel\Induced MMF\induced_voltage.txt", opts);
voltage = tbl.voltage;
clear opts tbl

voltage=[voltage; voltage(1)];
%%
theta=linspace(0,2*pi,300);
plot(theta*180/pi,voltage/1000);
hold on;
plot(theta*180/pi,sin(theta-0.0506)*max(voltage)/1000);
xlim([0 360])
xlabel('Theta (^o)');
ylabel('Voltage (kV)');
%%

figure1 = figure;
axes1 = axes('Parent',figure1,...
    'Position',[0.128214285714286 0.111587298748985 0.775 0.813412701251015]);
hold(axes1,'on');
plot1 = plot(theta*180/pi,voltage/1000);
plot2 = plot(theta*180/pi,sin(theta-0.0506)*max(voltage)/1000);
set(plot1,'DisplayName','FEA','Color',[0 0 0]);
set(plot2,'DisplayName','FHA','Color',[1 0 0]);
ylabel('Voltage (kV)','FontName','Times New Roman');
xlabel('Theta (Degree)','FontName','Times New Roman');
xlim(axes1,[0 360]);
box(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',20,'GridColor',[0 0 1],...
    'MinorGridColor',[0 1 1],'MinorGridLineStyle','-');
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.659903078802632 0.745993862173105 0.18141592547825 0.0716034252027842]);
%%
Y = fft(voltage);
L=length(voltage);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Fs=1/(theta(2)-theta(1));
f = Fs*(0:(L/2))/L;
%%

stem(f*2*pi,P1/max(P1)) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("Harmonic number")
ylabel("|P1(f)|")
xlim([0 40])
ylim([0 1])
%%

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
stem(f*2*pi,P1/max(P1),'MarkerSize',4,'Marker','^','LineWidth',1,'Color',[0 0 1]);
ylabel('Normalized |V(n)|','FontName','Times New Roman');
xlabel('Harmonic number','FontName','Times New Roman');
title('Single-Sided Amplitude Spectrum of V(t)');
ylim(axes1,[0 0.02]);
xlim([0 40])
box(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15);

