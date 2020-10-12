%% aditya tasar?m? burada da geçerli
fo=150e3;
wo=2*pi*150e3;
Ls=66e-6;
Cs= 1/(wo^2*Ls);
% RL= 16;
% M=17e-6; 
RL= 64;
M=8.5e-6; 

a1=0.1;
M1=M*(1+a1);
M2=M*(1-a1);
% RL1=[];
% RL2=[];
wRL=[];
ZSR=[];
phaseRL1=[];
phaseRL2=[];
% Is1=[];
% Is2=[];
% Icirc=[]; 
f=1e5:1e2:2e5;
w=2*pi*f;
Zs=1i*w*Ls+1./(1i*w*Cs);
is1= (1i.*w*(M1+M2))./((2*Zs)+RL);


Va=1i*w*M2-is1.*Zs;
RL1=(((2*Zs+RL)*M2)/(M1+M2))-Zs;
RL2=(((2*Zs+RL)*M1)/(M1+M2))-Zs;



%%
figure();
plot(w/(2*pi),abs(RL1),'LineWidth',3);
hold on; 
plot(w/(2*pi),abs(RL2),'LineWidth',3);
hold on;
% plot(wRL,abs(Icirc),'LineWidth',3);

%%
Is1=Is1+Icirc;
Is2=Is2-Icirc;

figure();
plot(wRL/(2*pi),abs(Is1),'LineWidth',3);
hold on; 
plot(wRL/(2*pi),abs(Is2),'LineWidth',3);



%%
figure();
plot(wRL,phaseRL1,'LineWidth',3);
hold on; 
plot(wRL,phaseRL2,'--','LineWidth',3);

    %%

figure();
subplot(2,1,1)
plot(wRL/(2000*pi),abs(RL1),'LineWidth',3);
xlabel('Frequency (kHz)');
ylabel( 'Resistance(Ohm)')
title('Reflected Resistance from module 1')
ylim([14 35])
subplot(2,1,2)
RL2= 1./(1/RL-1./abs(RL1));
plot(wRL/(2000*pi),abs(RL2),'LineWidth',3);
xlabel('Frequency (kHz)');
ylabel('Reflected Resistance(Ohm)')
title('Reflected Resistance from module 2')
ylim([30 70])
    

figure();
subplot(2,1,1)
plot(wRL/(2000*pi),100./abs(RL1),'LineWidth',3);
xlabel('Frequency (kHz)');
ylabel( 'Current(A)')
title('Current  module 1')
subplot(2,1,2)
RL2= 1./(1/RL-1./abs(RL1));
plot(wRL/(2000*pi),100./abs(RL2),'LineWidth',3);
xlabel('Frequency (kHz)');
ylabel('Current(A)')
title('Current module 2')


figure();
plot(wRL/(2000*pi),100./abs(RL1),'b','LineWidth',3);
hold on;
plot(wRL/(2000*pi),100./abs(RL2),'r','LineWidth',3);
hold on;
line([wRL(1)/(2000*pi),wRL(end)/(2000*pi)], [100/32 ,100/32],'Color','k','LineWidth',3)
xlabel('Frequency (kHz)');
ylabel( 'Current(A)')
title('Current  module 1')