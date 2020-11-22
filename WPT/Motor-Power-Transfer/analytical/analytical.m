f_fund= 50;
f_switch=40e3;
carrierLength=40;
f_sample=f_switch*carrierLength;
f_resonant=10e3;

carrierSignal_1=[-1:4/(carrierLength):1];
carrierSignal_2=[1:-4/(carrierLength):-1];
carrierSignal_1period=[carrierSignal_1,carrierSignal_2(2:end-1)];


sampleTime=1/f_sample;
stopTime=8/f_fund;
time=0:sampleTime:stopTime-sampleTime;

repeat_time=length(time)/carrierLength;

carrierSignal=[];

for i=1:repeat_time
    carrierSignal=[carrierSignal carrierSignal_1period];
end
%%
% figure()
% title('Carrier_Test')
% plot(time,carrierSignal,'LineWidth',3);
% xlabel('Time(s)');
% ylim([-2 2])
% ylabel('-1 to 1');
% xlim([0 sampleTime*carrierLength*5] );

%% 
m_fund=0.9;
% m_resonant=0.8-m_fund;
m_resonant=0;

referenceSignal= m_fund*cos(2*pi*f_fund*time-pi)+m_resonant*cos(2*pi*f_resonant*time-pi);

% figure()
% title('Carrier_Test')
% plot(time,carrierSignal,'LineWidth',3);
% hold on;
% plot(time,referenceSignal,'LineWidth',3);
% xlabel('Time(s)');
% ylim([-2 2])
% ylabel('-1 to 1');
% xlim([0 sampleTime*carrierLength*5] );
%%
% figure()
% title('Carrier_Test')
% plot(time,referenceSignal,'LineWidth',3);
% xlabel('Time(s)');
% ylim([-2 2])
% ylabel('-1 to 1');


%%
PWM=double((referenceSignal>carrierSignal));

% figure()
% title('Carrier_Test')
% plot(time,PWM,'LineWidth',3);
% xlabel('Time(s)');
% ylim([-2 2])
% ylabel('-1 to 1');

%% 
y = fft(PWM);
L=length(y);
PWM_mag2= abs(y/L);
PWM_mag= [ flip(PWM_mag2(1:(L/2)+1)), flip(PWM_mag2((L/2)+1:end))]; 
PWM_angle2=angle(y/L);
PWM_angle= [ flip(PWM_angle2(1:(L/2)+1)), flip(PWM_angle2((L/2)+1:end))]; 
f= f_sample*(0:(L/2))/L;
f = [-flip(f(2:end)) f ];

PWM_mag=PWM_mag((length(PWM_mag))/2:end);
PWM_mag(2:end)=PWM_mag(2:end)*2;
f= f_sample*(0:(L/2))/L;
%%
PWM_mag(PWM_mag<0.1)=nan;
figure();
stem(f/1000,PWM_mag,'LineWidth',2);
xlim([0 3*f_switch/1000])
% set(gca,'XTick',0:f_fund:2*f_switch)
% set(gca,'XTickLabel',0:1:1600)
xlabel('Frequency(kHz)');
title('FFT of a Switching Function')
ylabel('Mag')
%%
f_draw=[f_fund ,f_resonant ];

harmonic_fund=PWM_mag(f==50);

% harmonic_switch=sqrt(PWM_mag(f==39800)^2+PWM_mag(f==39900)^2+PWM_mag(f==40000)^2 ...
% +PWM_mag(f==40100)^2+PWM_mag(f==40200)^2);

harmonic_resonant=sqrt(PWM_mag(f==f_resonant-6*f_fund)^2+PWM_mag(f==f_resonant-4*f_fund)^2+PWM_mag(f==f_resonant-2*f_fund)^2 ...
+PWM_mag(f==f_resonant)^2+PWM_mag(f==f_resonant+2*f_fund)^2+PWM_mag(f==f_resonant+4*f_fund)^2+PWM_mag(f==f_resonant+6*f_fund)^2);

% plot(m_xy,x,'LineWidth',3);
% 
% h_draw=[harmonic_fund ,harmonic_switch];
h_draw=[harmonic_fund ,harmonic_resonant];

%%
% stem(f_draw,h_draw,'filled','LineWidth',3)
% 
% hold on;
%%
% x=[];
% x1=[];
% m_xy=[];

x=[x,harmonic_fund];
x1=[x1,harmonic_resonant];
% m_xy=[m_xy m_fund];
m_xy=[m_xy m_resonant];


%%
% figure();
% plot(m_xy,x,'LineWidth',3);
% hold on;
% plot(m_xy,x1,'LineWidth',3);
