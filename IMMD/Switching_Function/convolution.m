function [f, mag, phase] =convolution(f1,mag1,phase1,f2,mag2,phase2)



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

f_new= [-flip(f_new(2:end)), f_new(1:end)];
Mag_new=[(1/2)*flip(Mag_new(2:end)),Mag_new(1),(1/2)*Mag_new(2:end)];
Phase_new=[-flip(Phase_new(2:end)), Phase_new(1:end)];
%%
I_mag=10;
I_phase=0;
Mag_current= zeros(1,length(f_new));
Phase_current= 











end 