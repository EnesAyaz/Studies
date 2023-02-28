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
readtable("D:\Github\Studies\Roebel\Induced MMF\samet\1280_Calculator Expressions Table 1_1280_surface.csv",...
opts);
% Convert to output type
Flux = tbl.Flux;
% Clear temporary variab
clear opts tbl
%%

p=8; % pole
length_pole=round(length(Flux)/p);

flux_per_pole=[];
Flux2=[Flux;Flux];

for i=0:length(Flux)-1
    Sum=0;
    for j=1:length_pole
    Sum=Sum+Flux2(i+j);
    end
    
    flux_per_pole=[flux_per_pole; Sum];
    
end
%%
Mech_angle=linspace(0,360,1282);
Mech_angle=Mech_angle(1:end-1);
%%
figure1 = figure;
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');
plot(Mech_angle,Flux,'Parent',subplot1,'Color',[0.5 0 0])
ylim([-2.5e-3 2.5e-3])
xlim([0 360])
ylabel({' Fluxes within',' mechanical 1.12 degrees '},...
    'FontName','Times New Roman');
box(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times New Roman','FontSize',12);
grid on; 
grid minor;
subplot2 = subplot(2,1,2,'Parent',figure1);
hold(subplot2,'on');
plot(Mech_angle,flux_per_pole,'Parent',subplot2,'Color',[0 0 0.5])
ylim([-0.25 0.25])
xlabel('Mechanical angle ^o','FontName','Times New Roman');
ylabel('Flux per pole','FontName','Times New Roman');
xlim([0 360])
box(subplot2,'on');
hold(subplot2,'off');
set(subplot2,'FontName','Times New Roman','FontSize',12);
grid on; 
grid minor;
%%
flux_per_pole2=[flux_per_pole;flux_per_pole];
pp_step=106;
i=1+106;
theta=pi/160.25;
Flux_fft=flux_per_pole2(i:i+length(flux_per_pole));
Y = fft(Flux_fft);
L=length(Flux_fft);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P4 = angle(Y/L);
P5 = P4(1:L/2+1);
% P5(2:end-1) = P5(2:end-1);
Fs=1/theta;
f = Fs*(0:(L/2))/L;

%%
% figure1=figure('Position', [0 0 900 400]);
% stem(f*2*pi,P1/max(P1)) 
% title("Single-Sided Amplitude Spectrum of X(t)")
% xlabel("Harmonic number")
% ylabel("|P1(f)|")
% xlim([0 21])
% ylim([0 1])

%%
n=f*2*pi;
figure1 = figure('Position', [0 0 900 500]);
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');
stem(n,P1/max(P1),'Parent',subplot1,'Color',[0.5 0 0])
ylim([0 1])
xlim([0 21])
% ylabel({' Fluxes within',' mechanical 1.12 degrees '},...
%     'FontName','Times New Roman');
box(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times New Roman','FontSize',12);
grid on; 
grid minor;

subplot2 = subplot(2,1,2,'Parent',figure1);
hold(subplot2,'on');
stem(n,P5*180/pi,'Parent',subplot2,'Color',[0 0 0.5])
ylim([-180 180])
% xlabel('Mechanical angle ^o','FontName','Times New Roman');
% ylabel('Flux per pole','FontName','Times New Roman');
xlim([0 21])
box(subplot2,'on');
hold(subplot2,'off');
set(subplot2,'FontName','Times New Roman','FontSize',12);
grid on; 
grid minor;

%%
n_short_listed=[];
mag_short_listed=[];
angle_short_listed=[];
for k=[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21]
   i=k*4+1;
   n_short_listed=[n_short_listed n(i)];
   mag_short_listed=[mag_short_listed P1(i) ];
   angle_short_listed=[angle_short_listed P5(i) ];
end

% f(P1/max(P1)<0.02)=[];

%%
figure1 = figure('Position', [0 0 900 500]);
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');
stem(n_short_listed,mag_short_listed/max(mag_short_listed),'Parent',subplot1,'Color',[0.5 0 0])
set(gca,'yscal','log')
ylim([0 1])
xlim([0 21])
ylabel({'Normalized flux per pole','distribution (Log scale)'},...
 'FontName','Times New Roman');
box(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times New Roman','FontSize',12);
grid on; 
grid minor;

subplot2 = subplot(2,1,2,'Parent',figure1);
hold(subplot2,'on');
stem(n_short_listed,angle_short_listed*180/pi,'Parent',subplot2,'Color',[0 0 0.5])
ylim([-180 180])
xlabel('Harmonic number','FontName','Times New Roman');
ylabel('Phase(^o)','FontName','Times New Roman');
xlim([0 21])
ylim([-200 200])
box(subplot2,'on');
hold(subplot2,'off');
set(subplot2,'FontName','Times New Roman','FontSize',12);
grid on; 
grid minor;
%%
% mag_short_listed'
angle_short_listed'*180/pi

%%
n_short_listed=[];
mag_short_listed=[];
angle_short_listed=[];
for k=[1 5 7 11 13 17 19]
   i=k*4+1;
   n_short_listed=[n_short_listed n(i)];
   mag_short_listed=[mag_short_listed P1(i) ];
   angle_short_listed=[angle_short_listed P5(i) ];
end

mag_short_listed_B=mag_short_listed;
angle_short_listed_B=angle_short_listed;

%%
k=[1 5 7 11 13 17 19];
time = 0:2*pi/400:2*pi;
kw=[0.958 0.205 0.157 0.128 0.133 0.267 1.407];

Va=0;
Vb=0;
Vaf=0;
Vbf=0;
for i=1:length(k)
    
Va=Va+100*kw(i)*2*pi*50*k(i)*mag_short_listed_A(i)*sin(k(i).*time-angle_short_listed_A(i));
Vb=Vb+100*kw(i)*2*pi*50*k(i)*mag_short_listed_B(i)*sin(k(i).*time-angle_short_listed_B(i));
Vaf=100*kw(1)*2*pi*50*k(1)*mag_short_listed_A(1)*sin(k(1).*time-angle_short_listed_A(1));
Vbf=100*kw(1)*2*pi*50*k(1)*mag_short_listed_B(1)*sin(k(1).*time-angle_short_listed_B(1));
end
% plot(time,Va)
% hold on;
% plot(time,Vb)
figure1=figure('Position',[0 0 800 600]);
hold on;
plot(time*180/pi,2*(Va-Vb)/1e3,'Color',[1 0 0],'LineWidth',1)
hold on;
plot(time*180/pi,2*(Vaf-Vbf)/1e3,'Color',[0 0 1],'LineWidth',1)
xlim([0 360])
ylim([-25 25])
xlabel('Angle','FontName','Times New Roman');
ylabel('Line-to-line Voltage (kV)','FontName','Times New Roman');
set(gca,'FontName','Times New Roman','FontSize',15);
legend('With harmonics','Fundamental')
grid on;
grid minor;





