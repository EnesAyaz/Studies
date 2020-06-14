k=0.9; % modulation index
f_o=50; % output frequcency(fundamental)
f_c=4e4; % carrier frequency (switching)
The_o=2*pi/3; % output phase
The_c=0; % carrier phase
m_max=4; % maximum harmonics of carrier
n_max=10; % The number of sidebands

[f, Mag, Phase] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);

figure();
subplot(2,1,1);
stem(f/1000,Mag);
title('Switching Function');
xlabel('Freqeuncy(kHz)');
ylabel('Magnitude')
set(findall(gcf,'-property','FontSize'),'FontSize',20)
grid on;
% xlim([39850 40150])
% xlim([0 100])
subplot(2,1,2);
stem(f/1000,Phase*180/pi);
title('Switching Function');
xlabel('Freqeuncy(kHz)');
ylabel('Angle(Degree)')
set(findall(gcf,'-property','FontSize'),'FontSize',20)
grid on;
% xlim([0 100])
% xlim([39850 40150])
%%
f_new= 0:f_o:max(f);
y=(f/f_o)+1;
Mag_new=zeros(1,length(f_new));
Phase_new=zeros(1,length(f_new));

for i=1:length(y)
Mag_new((y(i))) =Mag(i);
Phase_new((y(i)))=Phase(i);
end


%%

figure();
stem(f,Mag,'r');
hold on;
stem(f_new,Mag_new,'--b')
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')
% xlim([39850 40150])

figure();
stem(f,Phase*180/pi,'r');
hold on;
stem(f_new,Phase_new*180/pi,'--b')
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')
% xlim([39850 40150])

%%
I_mag=10;
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
figure();
stem(f_new_right,Phase_new_right*180/pi,'r');
hold on;
stem(f_new_left,Phase_new_left*180/pi,'--b')
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')
xlim([39850 40150])

%%

figure();
stem(f_new,Mag_new,'k');
hold on;
stem(f_new_left,Mag_new_left,'r');
hold on;
stem(f_new_left,Mag_new_right,'--b')
xlim([-100 100])
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')

%%
% Mag_resultant=abs(Mag_new_right.*cos(Phase_new_right)+Mag_new_left.*cos(Phase_new_left));
% Phase_resultant=angle(Mag_new_right.*cos(Phase_new_right)+Mag_new_left.*cos(Phase_new_left));


% Mag_resultant=sqrt(Mag_new_right.*Mag_new_right+Mag_new_left.*Mag_new_left-2*Mag_new_right.*Mag_new_left.*cos(Phase_new_right-Phase_new_left));
% Phase_resultant=atan((Mag_new_right.*sin(Phase_new_right)+Mag_new_left.*sin(Phase_new_left))./ ...
%                     (Mag_new_right.*cos(Phase_new_right)+Mag_new_left.*cos(Phase_new_left)));

Phase_resultant=mod(Phase_resultant,2*pi);           
%%
figure();
stem(f_new_left,Mag_resultant,'k');
hold on;
stem(f_new_left,Mag_new_left,'r');
hold on;
stem(f_new_left,Mag_new_right,'--b')
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')

%%

figure();
stem(f_new_left,Phase_resultant*180/pi,'k');
hold on;
stem(f_new_left,Phase_new_left*180/pi,'r');
hold on;
stem(f_new_left,Phase_new_right*180/pi,'--b')
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')
%%

figure();
stem(f_new_left,Phase_resultant*180/pi,'k');
hold on;
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Phase')

%%

k=0.9;
f_o=50;
f_c=4e4;
The_o=2*pi/3;
The_c=0;
m_max=3;
n_max=5;
I_mag=10;
I_phase=0;

[f_resultant, Mag_resultant, Phase_resultant] = LegFunction(I_mag,I_phase,k,f_o,f_c,The_o,The_c,m_max,n_max);

figure();
stem(f_resultant,Mag_resultant,'k');
hold on;
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Magnitude')
% xlim([39850 40150])
% xlim([79650 80550])


figure();
stem(f_resultant,Phase_resultant*180/pi,'k');
hold on;
title('Switching Function');
xlabel('Freqeuncy');
ylabel('Phase(Degree)')
% xlim([39850 40150])
% xlim([0 200])
%%
k=0.9;
f_o=50;
f_c=4e4;
The_c=0;
m_max=20;
n_max=20;
I_mag=10;



I_phase=0;
The_o=0;
[f_resultant, Mag_resultantA, Phase_resultantA] = LegFunction(I_mag,I_phase,k,f_o,f_c,The_o,The_c,m_max,n_max);



I_phase=-2*pi/3;
The_o=-2*pi/3;
[f_resultant, Mag_resultantB, Phase_resultantB] = LegFunction(I_mag,I_phase,k,f_o,f_c,The_o,The_c,m_max,n_max);



I_phase=2*pi/3;
The_o=2*pi/3;
[f_resultant, Mag_resultantC, Phase_resultantC] = LegFunction(I_mag,I_phase,k,f_o,f_c,The_o,The_c,m_max,n_max);







