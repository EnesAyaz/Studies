%% aditya tasar?m? burada da geçerli
fo=150e3;
wo=2*pi*150e3;
Ls=17e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=12e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 
%% 
a1=0.1;
M1=M*(1+a1);
M2=M*(1-a1);
RL1=[];
RL2=[];
wRL=[];
ZSR=[];
%%
Za= @(w) 1-w^2*Ls*Cs;
Zb= @(w) 1i*w*Ls;



for  f=1e4:1e2:3e5
    w=2*pi*f;
   wRL=[wRL w];
   ZSR=[ZSR Zb(w)];
   Rx= ((Za(w)*(M1-M2)*RL+M2*Zb(w)*RL)/(M1*Zb(w)))+RL   
   
    RL1=[RL1 Rx];

   
   
end
%%
figure();
plot(wRL,abs(RL1),'LineWidth',3);
hold on; 
RL2= 1./(1/RL-1./abs(RL1));
plot(wRL,abs(RL2),'--','LineWidth',3);
ylim([16 40])
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
    
%%
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

%%
figure();
plot(wRL/(2000*pi),100*(1+a1)*abs(RL1./Zb(wRL)),'b','LineWidth',3);
hold on;
plot(wRL/(2000*pi),100*(1-a1)*abs(RL2./Zb(wRL)),'r--','LineWidth',3);
hold on;
line([wRL(1)/(2000*pi),wRL(end)/(2000*pi)], [100*abs(RL/Zb(wo)) ,100*abs(RL/Zb(wo))],'Color','k','LineWidth',3)
xlabel('Frequency (kHz)');
ylabel( 'Current(A)')
title('Current  module 1')