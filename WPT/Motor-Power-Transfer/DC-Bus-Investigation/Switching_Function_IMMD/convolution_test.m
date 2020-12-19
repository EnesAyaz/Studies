fsw=4e4;
% carrier_phase=pi+pi/4;
carrier_phase=pi/2;
sampleTime=1e-8;
ModulationIndex=0.9;
ffund=50;
fundemental_phase=pi/2+2*pi/3;
Phase_Current=10;
load_phase=pi/2+pi/4;
%%
sim('switching_simulink',0.04);
%%
time=Phase_current.time;
phase_current=Phase_current.data;
leg_current=Leg_Current.data;
fundamental=fundmental.data;
carrier=Carrier.data;
switchingFunc= switching_func.data;
%%
L=length(phase_current);
phase_current_FFT_mag=fft(phase_current);
phase_current_FFT_mag=abs(phase_current_FFT_mag/L);
phase_current_FFT_mag=phase_current_FFT_mag(1:L/2+1);
phase_current_FFT_mag(2:end-1)=2*phase_current_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


phase_current_FFT_angle=fft(phase_current);
phase_current_FFT_angle=angle(phase_current_FFT_angle);
phase_current_FFT_angle=phase_current_FFT_angle(1:L/2+1);

threshold=max(abs(phase_current_FFT_mag)/100);
phase_current_FFT_angle(abs(phase_current_FFT_mag)<threshold)=0; 
phase_current_FFT_mag(abs(phase_current_FFT_mag)<threshold)=0;

%%
% figure();
% stem(f,phase_current_FFT_mag) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% xlim([0 200])
%%
% figure();
% plot(f,180*phase_current_FFT_angle/pi) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% xlim([0 300])
% ylabel('Phase <Angle')
%%
L=length(leg_current);
leg_current_FFT_mag=fft(leg_current);
leg_current_FFT_mag=abs(leg_current_FFT_mag/L);
leg_current_FFT_mag=leg_current_FFT_mag(1:L/2+1);
leg_current_FFT_mag(2:end-1)=2*leg_current_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


leg_current_FFT_angle=fft(leg_current);
leg_current_FFT_angle=angle(leg_current_FFT_angle);
leg_current_FFT_angle=leg_current_FFT_angle(1:L/2+1);


threshold=max(abs(leg_current_FFT_mag)/100);
leg_current_FFT_angle(abs(leg_current_FFT_mag)<threshold)=0; 
leg_current_FFT_mag(abs(leg_current_FFT_mag)<threshold)=0;
%%

% figure();
% stem(f,leg_current_FFT_mag) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% xlim([0 300])
% xlim([39750 40250])
% xlim([79500 80500])
% xlim([119500 120500])
%%
% figure();
% stem(f,180*leg_current_FFT_angle/pi) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% % xlim([0 300])
% ylabel('Phase <Angle')
%%


L=length(fundamental);
fundamental_FFT_mag=fft(fundamental);
fundamental_FFT_mag=abs(fundamental_FFT_mag/L);
fundamental_FFT_mag=fundamental_FFT_mag(1:L/2+1);
fundamental_FFT_mag(2:end-1)=2*fundamental_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


fundamental_FFT_angle=fft(fundamental);
fundamental_FFT_angle=angle(fundamental_FFT_angle);
fundamental_FFT_angle=fundamental_FFT_angle(1:L/2+1);

threshold=max(abs(fundamental_FFT_mag)/100);
fundamental_FFT_angle(abs(fundamental_FFT_mag)<threshold)=0; % determines the low-amplitude threshold
fundamental_FFT_mag(abs(fundamental_FFT_mag)<threshold)=0;

%%
% figure();
% stem(f,fundamental_FFT_mag) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% xlim([0 300])
% xlim([39750 40250])
% xlim([79500 80500])
% xlim([119500 120500])
%%
% figure();
% stem(f,180*fundamental_FFT_angle/pi) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% % xlim([0 300])
% ylabel('Phase <Angle')

%%

L=length(carrier);
carrier_FFT_mag=fft(carrier);
carrier_FFT_mag=abs(carrier_FFT_mag/L);
carrier_FFT_mag=carrier_FFT_mag(1:L/2+1);
carrier_FFT_mag(2:end-1)=2*carrier_FFT_mag(2:end-1);
f_c1 = (1/sampleTime)*(0:(L/2))/L;


carrier_FFT_angle=fft(carrier);
carrier_FFT_angle=angle(carrier_FFT_angle);
carrier_FFT_angle=carrier_FFT_angle(1:L/2+1);

threshold=max(abs(carrier_FFT_mag)/100);
carrier_FFT_angle(abs(carrier_FFT_mag)<threshold)=0; % determines the low-amplitude threshold
carrier_FFT_mag(abs(carrier_FFT_mag)<threshold)=0;

%%
% figure();
% stem(f_c,carrier_FFT_mag) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% % xlim([0 300])
% % xlim([39750 40250])
% % xlim([79500 80500])
% % xlim([119500 120500])

%%
% figure();
% plot(f_c1,180*carrier_FFT_angle/pi) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% % xlim([0 300])
% ylabel('Phase <Angle')
% xlim([38000 42000])

%% 
L=length(switchingFunc);
switchingFunc_FFT_mag=fft(switchingFunc);
switchingFunc_FFT_mag=abs(switchingFunc_FFT_mag/L);
switchingFunc_FFT_mag=switchingFunc_FFT_mag(1:L/2+1);
switchingFunc_FFT_mag(2:end-1)=2*switchingFunc_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


switchingFunc_FFT_angle=fft(switchingFunc);
switchingFunc_FFT_angle=angle(switchingFunc_FFT_angle);
switchingFunc_FFT_angle=switchingFunc_FFT_angle(1:L/2+1);

threshold=max(abs(switchingFunc_FFT_mag)/100);
switchingFunc_FFT_angle(abs(switchingFunc_FFT_mag)<threshold)=0; % determines the low-amplitude threshold
switchingFunc_FFT_mag(abs(switchingFunc_FFT_mag)<threshold)=0;

%%

% figure();
% stem(f,switchingFunc_FFT_mag) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% xlim([0 300])
% xlim([39750 40250])
% xlim([79500 80500])
% xlim([119500 120500])

%%
% figure();
% plot(f,180*switchingFunc_FFT_angle/pi) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('Phase <Angle')

%%
load_phase=load_phase-pi/2+fundemental_phase;
f_new_left=f-ffund;
f_new_left = [f_new_left f(end)-ffund/2  f(end) f(end)+ffund/2 f(end)+ffund];
leg_current_left_mag= [(switchingFunc_FFT_mag*Phase_Current)/2 ;0 ;0 ;0 ; 0];
leg_current_left_angle=[(switchingFunc_FFT_angle-load_phase) ;0 ;0 ;0 ;0];


%%

f_new_right=f+ffund;
f_new_right = [-ffund -ffund/2 0 ffund/2 f_new_right ];
leg_current_right_mag= [0;0;0;0; (switchingFunc_FFT_mag*Phase_Current)/2];
leg_current_right_angle=[0;0;0;0;(switchingFunc_FFT_angle+load_phase)];



%%
leg_current_real_mag =abs(leg_current_right_mag.*exp(1i*leg_current_right_angle)+ ...
    leg_current_left_mag.*exp(1i*leg_current_left_angle));
leg_current_real_mag(3)=leg_current_left_mag(3)*cos(leg_current_left_angle(3));

leg_current_real_angle =angle(leg_current_right_mag.*exp(1i*leg_current_right_angle)+ ...
    leg_current_left_mag.*exp(1i*leg_current_left_angle));



%%
% figure();
% stem(f,leg_current_FFT_mag,'r') 
% hold on; 
% stem(f_new_right,leg_current_real_mag,'--b') 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% % xlim([-100 300])
% xlim([-100 300])
% xlim([39750 40250])
% xlim([79500 80500])
% xlim([119500 120500])
%%
% figure();
% stem(f,leg_current_FFT_mag,'r') 
% % xlim([-100 300])
% xlim([-100 300])
% xlim([39750 40250])
% xlim([79500 80500])
% xlim([119500 120500])
%%
% figure();
% plot(f,180*leg_current_FFT_angle/pi) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% % xlim([0 300])
% ylabel('Phase <Angle')

%%

%%
k=ModulationIndex; % modulation index
f_o=ffund; % output frequcency(fundamental)
f_c=fsw; % carrier frequency (switching)
The_o=-pi/2+fundemental_phase; % output phase
% The_c=pi+carrier_phase-0.0552; % carrier phase
% The_c=(-pi-carrier_phase-0.0552)+pi/2; % carrier phase
The_c=-carrier_phase;
m_max=8; % maximum harmonics of carrier
n_max=20; % The number of sidebands

[f_1, Mag, Phase] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);

f_new= 0:f_o:max(f_1);
y=(f_1/f_o)+1;
Mag_new=zeros(1,length(f_new));
Phase_new=zeros(1,length(f_new));

for i=1:length(y)
Mag_new((y(i))) =Mag(i);
Phase_new((y(i)))=Phase(i);
end

I_mag=Phase_Current;
% I_phase=load_phase+fundemental_phase+pi/2;
I_phase=load_phase;



Mag_0=Mag_new(1);
f_new=f_new(2:end);
Mag_new=Mag_new(2:end);
Phase_new=Phase_new(2:end);

f_new_left_2=f_new-f_o;
f_new_left_2 = [f_new_left_2 f_new(end) f_new(end)+f_o];
Mag_new_left= [(Mag_new*I_mag)/2 0 0 ];
Phase_new_left=[(Phase_new-I_phase) 0 0 ];


f_new_right_2= f_new+f_o;
f_new_right_2 = [0 f_o f_new_right_2];
Mag_new_right= [0 0 (Mag_new*I_mag)/2  ];
Phase_new_right=[0 0 (Phase_new+I_phase) ];

Mag_resultant= abs(Mag_new_right.*exp(1i*Phase_new_right)  +  Mag_new_left.*exp(1i*Phase_new_left)) ;          
Phase_resultant =angle(Mag_new_right.*exp(1i*Phase_new_right)  +  Mag_new_left.*exp(1i*Phase_new_left));
Mag_resultant(1)= Mag_new_left(1)*cos(Phase_new_left(1));

% Phase_resultant=mod(Phase_resultant,2*pi);        
% f_new_right_2=f_new_right_2(2:end);
% Mag_resultant(3)=abs(Mag_resultant(1).*exp(1i*Phase_resultant(1))  +  Mag_resultant(3).*exp(1i*Phase_resultant(3)));
% Phase_resultant(3)=angle(Mag_resultant(1).*exp(1i*Phase_resultant(1))  +  Mag_resultant(3).*exp(1i*Phase_resultant(3)));
% Mag_resultant=Mag_resultant(2:end);
% Phase_resultant=Phase_resultant(2:end);
Mag_resultant(2)=Mag_0*I_mag;
Phase_resultant(2)=I_phase;

%%
figure();
stem(f,leg_current_FFT_mag,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,Mag_resultant,'--b','LineWidth',3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
legend('Simulation','Analytic');
% xlim([-100 300])
% % xlim([0 300])
% xlim([39750 40250])
% xlim([79500 80500])
xlim([0 300000])
%%
figure();

subplot(2,2,1)
stem(f,leg_current_FFT_mag,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,Mag_resultant,'--b','LineWidth',3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
legend('Simulation','Analytic');
set(gca,'FontSize',18);
xlim([0 300])


subplot(2,2,2)
stem(f,leg_current_FFT_mag,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,Mag_resultant,'--b','LineWidth',3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
legend('Simulation','Analytic');
set(gca,'FontSize',18);
xlim([39750 40250])


subplot(2,2,3)
stem(f,leg_current_FFT_mag,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,Mag_resultant,'--b','LineWidth',3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
legend('Simulation','Analytic');
set(gca,'FontSize',18);
xlim([79500 80500])

subplot(2,2,4)
stem(f,leg_current_FFT_mag,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,Mag_resultant,'--b','LineWidth',3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
legend('Simulation','Analytic');
set(gca,'FontSize',18);
xlim([119500 120500])


% 
% xlim([0 300])
% xlim([39750 40250])
% xlim([79500 80500])
% xlim([119500 120500])

%%
% threshold=max(abs(Mag_resultant)/100);
% Phase_resultant(abs(Mag_resultant)<threshold)=0; % determines the low-amplitude threshold
% 
% 
% 
% figure();
% stem(f,180*leg_current_FFT_angle/pi,'r') 
% hold on; 
% stem(f_new_right_2,180*Phase_resultant/pi,'--b') 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('Angle')
% % % xlim([-100 300])
% xlim([-100 300])
% xlim([39750 40250])
% % xlim([79500 80500])
% % xlim([119500 120500])

%%
threshold=max(abs(Mag_resultant)/100);
Phase_resultant(abs(Mag_resultant)<threshold)=0; % determines the low-amplitude threshold

figure();
subplot(2,2,1)
stem(f,180*leg_current_FFT_angle/pi,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,180*Phase_resultant/pi,'--b','LineWidth',3) 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('Angle')
legend('Simulation','Analytic');
set(gca,'FontSize',18);
xlim([0 300])

subplot(2,2,2)
stem(f,180*leg_current_FFT_angle/pi,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,180*Phase_resultant/pi,'--b','LineWidth',3) 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('Angle')
legend('Simulation','Analytic');
set(gca,'FontSize',18);

xlim([39750 40250])



subplot(2,2,3)
stem(f,180*leg_current_FFT_angle/pi,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,180*Phase_resultant/pi,'--b','LineWidth',3) 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('Angle')
legend('Simulation','Analytic');
set(gca,'FontSize',18);

xlim([79500 80500])



subplot(2,2,4)
stem(f,180*leg_current_FFT_angle/pi,'r','LineWidth',3) 
hold on; 
stem(f_new_right_2,180*Phase_resultant/pi,'--b','LineWidth',3) 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('Angle')
legend('Simulation','Analytic');
set(gca,'FontSize',18);
xlim([119500 120500])


%%

% threshold=max(abs(Mag)/100);
% Phase(abs(Mag)<threshold)=0; % determines the low-amplitude threshold
% 
% figure();
% stem(f_1,180*Phase/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_angle/pi,'--b','LineWidth',3) 
% title('Single-Sided Phase Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('Angle(Degree)')
% legend('Analytic','Simulation')
% % xlim([-100 300])
% % xlim([-100 300])
% % xlim([39750 40250])
% % xlim([79500 80500])
% % xlim([119500 120500])
% xlim([0 240000])
% set(gca,'FontSize',18);
% %%
% threshold=max(abs(Mag)/100);
% Phase(abs(Mag)<threshold)=0; % determines the low-amplitude threshold
% 
% figure();
% 
% subplot(2,2,1)
% stem(f_1,180*Phase/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_angle/pi,'--b','LineWidth',3) 
% title('Single-Sided Phase Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('Angle(Degree)')
% legend('Analytic','Simulation')
% set(gca,'FontSize',18);
% xlim([0 300])
% 
% subplot(2,2,2)
% stem(f_1,180*Phase/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_angle/pi,'--b','LineWidth',3) 
% title('Single-Sided Phase Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('Angle(Degree)')
% legend('Analytic','Simulation')
% set(gca,'FontSize',18);
% xlim([39750 40250])
% 
% subplot(2,2,3)
% stem(f_1,180*Phase/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_angle/pi,'--b','LineWidth',3) 
% title('Single-Sided Phase Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('Angle(Degree)')
% legend('Analytic','Simulation')
% set(gca,'FontSize',18);
% xlim([79500 80500])
% 
% subplot(2,2,4)
% stem(f_1,180*Phase/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_angle/pi,'--b','LineWidth',3) 
% title('Single-Sided Phase Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('Angle(Degree)')
% legend('Analytic','Simulation')
% set(gca,'FontSize',18);
% xlim([119500 120500])
% 
% 
% %%
% % 
% figure();
% stem(f_1,180*Mag/pi,'r','LineWidth',3) 
% hold on; 
% hold on; 
% stem(f,180*switchingFunc_FFT_mag/pi,'--b','LineWidth',3) 
% title('Single-Sided Amplitude Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('|Mag|')
% set(gca,'FontSize',18);
% 
% 
% % xlim([-100 300])
% % xlim([-100 300])
% % xlim([39750 40250])
% % xlim([79500 80500])
% % xlim([119500 120500])
% xlim([0 300000])
% 
% %%
% figure();
% 
% subplot(2,2,1)
% stem(f_1,Mag,'r','LineWidth',3) 
% hold on; 
% stem(f,switchingFunc_FFT_mag,'--b','LineWidth',3) 
% title('Single-Sided Amplitude Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('|Mag|')
% set(gca,'FontSize',18);
% xlim([0 300])
% 
% subplot(2,2,2)
% stem(f_1,180*Mag/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_mag/pi,'--b','LineWidth',3) 
% title('Single-Sided Amplitude Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('|Mag|')
% set(gca,'FontSize',18);
% xlim([39750 40250])
% 
% subplot(2,2,3)
% stem(f_1,180*Mag/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_mag/pi,'--b','LineWidth',3) 
% title('Single-Sided Amplitude Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('|Mag|')
% set(gca,'FontSize',18);
% xlim([79500 80500])
% 
% subplot(2,2,4)
% stem(f_1,180*Mag/pi,'r','LineWidth',3) 
% hold on; 
% stem(f,180*switchingFunc_FFT_mag/pi,'--b','LineWidth',3) 
% title('Single-Sided Amplitude Spectrum of Switching Function')
% xlabel('f (Hz)')
% ylabel('|Mag|')
% set(gca,'FontSize',18);
% xlim([119500 120500])

