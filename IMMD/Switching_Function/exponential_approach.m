clear;
clc;
close all;

%%
k=0.9; % modulation index
f_o=50; % output frequcency(fundamental)
f_c=4e4; % carrier frequency (switching)
The_o=0; % output phase
The_c=0.125; % carrier phase
m_max=8; % maximum harmonics of carrier
n_max=20; % The number of sidebands

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

% Phase_resultant=mod(Phase_resultant,2*pi);          
%%

%% Time array
Tstep = 1e-6; % s
Ts = Tstep; % s
ma = 0.9;
fout = 50; % Hz
fsw = 40e3; % Hz
fs=1/Ts;
Tfinal =1/fout ; % s
time_array = 0:Tstep:Tfinal-Tstep;
NumberofSteps = numel(time_array);
%% Generate switching signals
The_c=0;
The_o=-pi/2-The_o;
VrefA = ma*sin(2*pi*fout*time_array-The_o);
VrefB = ma*sin(2*pi*fout*time_array-2*pi/3);
VrefC = ma*sin(2*pi*fout*time_array-4*pi/3);
Vtriang = zeros(1, NumberofSteps);
for k = 1:Tfinal*fsw
   Triang_temp = triang(1/(Ts*fsw));
   Vtriang((length(Triang_temp)*(k-1)+1:k/(Tstep*fsw))) = (Triang_temp*2)-1;
end
Vcarrier = Vtriang;
SA = double(VrefA > Vcarrier);
SB = double(VrefB > Vcarrier);
SC = double(VrefC > Vcarrier);
%%
IA=10*sin(2*pi*fout*time_array-The_o);
SAIA=SA.*IA;
%%
%%
SAIA_new=SAIA;
yA = fft(SAIA_new);
LA=length(yA);
SAIA_mag2= abs(yA/LA);
SAIA_mag= [ flip(SAIA_mag2(1:(LA/2)+1)), flip(SAIA_mag2((LA/2)+1:end))]; 
SAIA_angle2=angle(yA/LA);
SAIA_angle= [ -flip(SAIA_angle2(1:(LA/2)+1)), flip(SAIA_angle2((LA/2)+1:end))]; 
fA= fs*(0:(LA/2))/LA;
fA = [-flip(fA(2:end)) fA ];

%%
figure();
i=40;
stem(f_new_rl/1000,Mag_resultant,'r','LineWidth',3);
hold on;
stem(fA/1000,SAIA_mag,'b','LineWidth',3);
xlim([i-0.30 ,i+0.30])
title('Switching Function');
xlabel('Freqeuncy(kHz)');
ylabel('Magnitude')
set(gca,'fontsize',18)
%%
figure();
stem(f_new_rl,180*Phase_resultant/pi,'r');
hold on;
stem(fA,180*SAIA_angle/pi,'b');
xlim([39850 40150])
xlim([-100 100])
% xlim([79850 80150])
% xlim([119850 120150])
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')


