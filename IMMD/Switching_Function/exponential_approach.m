clear;
clc;
close all;

%%
k=0.9; % modulation index
f_o=50; % output frequcency(fundamental)
f_c=4e4; % carrier frequency (switching)
The_o=2*pi/3; % output phase
The_c=0; % carrier phase
m_max=4; % maximum harmonics of carrier
n_max=10; % The number of sidebands

[f, Mag, Phase] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);

f_new= 0:f_o:max(f);
y=(f/f_o)+1;
Mag_new=zeros(1,length(f_new));
Phase_new=zeros(1,length(f_new));

for i=1:length(y)
Mag_new((y(i))) =Mag(i);
Phase_new((y(i)))=Phase(i);
end

I_mag=10.94;
I_phase=0;

f_new_left=f_new-f_o;
f_new_left = [f_new_left f_new(end) f_new(end)+f_o];
Mag_new_left= [(Mag_new*I_mag)/2 0 0 ];
Phase_new_left=[(Phase_new-I_phase) 0 0 ];

f_new_right= f_new+f_o;
f_new_right = [-f_o 0 f_new_right];
Mag_new_right= [0 0 (Mag_new*I_mag)/2  ];
Phase_new_right=[0 0 (Phase_new+I_phase) ];
%%
f_new_rl=f_new_right(2:end);
Mag_new_right(3)=Mag_new_right(1)+Mag_new_right(3);
Mag_new_right=Mag_new_right(2:end);
Mag_new_left(3)=Mag_new_left(1)+Mag_new_left(3);
Mag_new_left=Mag_new_left(2:end);
Phase_new_right=Phase_new_right(2:end);
Phase_new_left=Phase_new_left(2:end);

%%


f_new_rl= [-flip(f_new_rl(2:end)), f_new_rl(1:end)];
Mag_new_right=[(1/2)*flip(Mag_new_right(2:end)),Mag_new_right(1),(1/2)*Mag_new_right(2:end)];
Phase_new_right=[-flip(Phase_new_right(2:end)), Phase_new_right(1:end)];
Mag_new_left=[(1/2)*flip(Mag_new_left(2:end)),Mag_new_left(1),(1/2)*Mag_new_left(2:end)];
Phase_new_left=[-flip(Phase_new_left(2:end)), Phase_new_left(1:end)];

%%
Mag_resultant= abs(Mag_new_right.*exp(1i*Phase_new_right)  +  Mag_new_left.*exp(1i*Phase_new_left)) ;          
Phase_resultant =angle(Mag_new_right.*exp(1i*Phase_new_right)  +  Mag_new_left.*exp(1i*Phase_new_left));

Phase_resultant=mod(Phase_resultant,2*pi);          
%%
figure();
stem(f_new_rl,Mag_resultant);

title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')

%%

figure();
stem(f_new_rl,Phase_resultant*180/pi);
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')
%%
load('Y:\Github\DATA\Comparison\siyahlar\Data_with_parasitic50ohm');
ts=time(2)-time(1);
fs=1/ts;
number_of_sample= fs/50;
starting=1+1*number_of_sample;
ending= 1+3*number_of_sample;
%%
SAIA_new=SAIA(starting:ending);
yA = fft(SAIA_new);
LA=length(yA);
SAIA_mag2= abs(yA/LA);
SAIA_mag= [ flip(SAIA_mag2(1:(LA/2)+1)); flip(SAIA_mag2((LA/2)+1:end))]; 
SAIA_angle2=angle(yA/LA);
SAIA_angle= [ flip(SAIA_angle2(1:(LA/2)+1)); flip(SAIA_angle2((LA/2)+1:end))]; 
fA= fs*(0:(LA/2))/LA;
fA = [-flip(fA(2:end)) fA ];

%%
figure();
stem(f_new_rl,Mag_resultant,'r');
hold on;
stem(fA,SAIA_mag,'b');
xlim([-280000 280000])
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')
%%
figure();
stem(f_new_rl,Phase_resultant,'r');
hold on;
stem(fA,SAIA_angle,'b');
xlim([39850 40150])
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')


