k=0.9; % modulation index
f_o=50; % output frequcency(fundamental)
f_c=2e4; % carrier frequency (switching)
The_o=0; % output phase
The_c=0; % carrier phase
m_max=4; % maximum harmonics of carrier
n_max=10; % The number of sidebands

[fA, MagA, PhaseA] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);
The_o=-pi; % output phase
[fB, MagB, PhaseB] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);

f=fA;
% Mag= MagAMagB;
% 
Mag= sqrt(MagA.^2+MagB.^2-2*MagA.*MagB.*cosd(PhaseA-PhaseB));
Phase=PhaseA-PhaseB;

% Mag=MagB;
% Phase=PhaseB;


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









