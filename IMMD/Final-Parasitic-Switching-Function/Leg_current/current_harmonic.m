I_rms_freq=[];
freq=[];
Vdc=48;
time=0:1e-8:2e-3;
for f_c=1000e3:50e3:1000e3
k=1;
f_o=1e3;
The_o=0;
The_c=0 ;
m_max=5;
n_max=10;
[f, Mag, Phase] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);
f=f(1:end);
Mag=Mag(1:end);
Phase=Phase(1:end);
L=3.1e-6;
R=500e-3;


% Z=abs(1i*2*pi*f*L+R);
% Z_phase=angle(1i*2*pi*f*L+R);
Z=1i*2*pi*f*L+R;
I=Vdc*Mag.*exp(1i*Phase)./Z;

I_tot=0;
V_tot=0;
for n=3:length(f)
% I_time=I(n)*cos(2*pi*f(n)*time+Phase(n)-Z_phase(n));
I_time=abs(I(n))*cos(2*pi*f(n)*time+angle(I(n)));
I_tot=I_time+I_tot;
% V_time = Mag(n)*cos(2*pi*f(n)*time+Phase(n));
% V_tot=V_tot+V_time;
end
I_tot=I_tot+4*sqrt(2)*cos(2*pi*f(2)*time+Phase(2));
rms(I_tot)

I_rms=sqrt(sum(I.^2));
I_rms_freq=[I_rms_freq I_rms];
freq=[freq f_c];
end
%%
plot(time,I_tot)
hold on;
plot(time,cos(2*pi*1e3*time))
% plot(freq,I_rms_freq)