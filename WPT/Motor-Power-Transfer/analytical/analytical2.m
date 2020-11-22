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
m_fund=0.1;


referenceSignal1= m_fund*cos(2*pi*f_fund*time-pi);
referenceSignal2= m_fund*cos(2*pi*f_fund*time-pi-2*pi/3);
referenceSignal3 = m_fund*cos(2*pi*f_fund*time-pi-4*pi/3);

%%
PWM1=double((referenceSignal1>carrierSignal));
PWM2=double((referenceSignal2>carrierSignal));
PWM3=double((referenceSignal3>carrierSignal));
PWM=PWM1-PWM2-PWM3;

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
xlim([0 6*f_switch/1000])
% set(gca,'XTick',0:f_fund:2*f_switch)
% set(gca,'XTickLabel',0:1:1600)
xlabel('Frequency(kHz)');
title('FFT of a Switching Function')
ylabel('Mag')
