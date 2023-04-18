filename="D:\Github\Studies\Roebel\Induced MMF\samet2\fpp3d.csv";
dataLines= [8 8];
data= importfile(filename, dataLines);
%%
Flux=data(2:end);
%%
p=8; % pole
length_pole=round(length(Flux)/p);

flux_per_pole=[];
Flux2=[Flux,Flux];

for i=0:length(Flux)-1
    Sum=0;
    
    for j=1:length_pole
    Sum=Sum+Flux2(i+j);
    end
    
    flux_per_pole=[flux_per_pole; Sum];
end
%%
Mech_angle=linspace(0,360,length(Flux)+1);
Mech_angle=Mech_angle(1:end-1);
%%
%%
flux_per_pole2=[flux_per_pole;flux_per_pole];
pp_step=length_pole;
i=1; %phase  A
% i=1+pp_step*2/3; % phase B
% i=1+pp_step*4/3; % phase C
theta=pi/pp_step;
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
n=2*pi*f;
n_short_listed=[];
mag_short_listed=[];
angle_short_listed=[];
for k=[1 5 7 11 13 17 19]
   i=k*4+1;
   n_short_listed=[n_short_listed n(i)];
   mag_short_listed=[mag_short_listed P1(i) ];
   angle_short_listed=[angle_short_listed P5(i) ];
end

mag_short_listed_A=mag_short_listed;
angle_short_listed_A=angle_short_listed;

%%
%%
flux_per_pole2=[flux_per_pole;flux_per_pole];
pp_step=length_pole;
i=1; %phase  A
i=1+pp_step*2/3; % phase B
% i=1+pp_step*4/3; % phase C
theta=pi/pp_step;
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
n=2*pi*f;
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
%%
flux_per_pole2=[flux_per_pole;flux_per_pole];
pp_step=length_pole;
i=1; %phase  A
i=1+pp_step*2/3; % phase B
i=1+pp_step*4/3; % phase C
theta=pi/pp_step;
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
n=2*pi*f;
n_short_listed=[];
mag_short_listed=[];
angle_short_listed=[];
for k=[1 5 7 11 13 17 19]
   i=k*4+1;
   n_short_listed=[n_short_listed n(i)];
   mag_short_listed=[mag_short_listed P1(i) ];
   angle_short_listed=[angle_short_listed P5(i) ];
end

mag_short_listed_C=mag_short_listed;
angle_short_listed_C=angle_short_listed;

%%
k=[1 5 7 11 13 17 19];
time = 0:2*pi/400:2*pi;
kw=[0.958 0.205 0.157 0.128 0.133 0.267 0.1];

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


