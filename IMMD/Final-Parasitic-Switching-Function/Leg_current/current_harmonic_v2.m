I_rms_freq=[];
freq=[];
Vdc=48;
time=0:1e-8:2e-3;

Mag_phase=[];
Phase_phase=[];
for The_o=0:2*pi/3:4*pi/3
f_c=500e3;
k=1;
f_o=1e3;
% The_o=0;
The_c=0 ;
m_max=10;
n_max=10;
[f, Mag, Phase] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);
f=f(1:end);

Mag_phase=[Mag_phase ; Mag];
Phase_phase=[Phase_phase; Phase];

end
%%
mag_A=Mag_phase(1,:);
phase_A=Phase_phase(1,:);
phase=Phase_phase(1,:)-Phase_phase(2,:);
phase(phase<-3.14)=2*pi/3;
stem(phase)
%%
for i=1:length(phase)
    if phase(i)==0
        mag_A(i)=0;
    elseif phase(i)<0         
        phase_A(i)=-phase_A(i);
    end
end

%%

%%
% Phase_AB=angle(Mag_ll(1,:).*exp(1i*Phase_ll(1,:))-Mag_ll(2,:).*exp(1i*Phase_ll(2,:)));
% Mag_AB=abs(Mag_ll(1,:).*exp(1i*Phase_ll(1,:))-Mag_ll(2,:).*exp(1i*Phase_ll(2,:)));
% % 
% Phase_AB=Phase_ll(1,:)-Phase_ll(2,:);
% Mag_AB= Mag_ll(1,:)- Mag_ll(2,:);
%%
L=3.1e-6;
R=3;
% Z=abs(1i*2*pi*f*L+R);
% Z_phase=angle(1i*2*pi*f*L+R);
Z=1i*2*pi*f*L+R;
I=Vdc*mag_A.*exp(1i*phase_A)./Z;

I_tot=0;
V_tot=0;
for n=1:length(f)
% I_time=I(n)*cos(2*pi*f(n)*time+Phase(n)-Z_phase(n));
I_time=abs(I(n))*cos(2*pi*f(n)*time+angle(I(n)));
I_tot=I_time+I_tot;
% V_time = Mag(n)*cos(2*pi*f(n)*time+Phase(n));
% V_tot=V_tot+V_time;
end
% I_tot=I_tot+4*sqrt(2)*cos(2*pi*f(2)*time+Phase(2)+pi/3);
rms(I_tot)


%%
plot(time,I_tot)
hold on;
% plot(time,cos(2*pi*1e3*time))
% plot(freq,I_rms_freq)