%% aditya tasar?m? burada da geçerli
fo=150e3;
wo=2*pi*150e3;
Ls=66e-6;
Cs= 1/(wo^2*Ls);
RL= 16;
M=17e-6;
%% 
a1=0.2;
M1=M*(1+a1);
M2=M*(1-a1);
RL1=[];
RL2=[];
wRL=[];
ZSR=[];
%%
Zs= @(w) 1i*w*Ls+1/(1i*w*Cs);

R1= @(Z) ((M1+M2)*RL*Z)/((M1-M2)*RL+M1*Z);


for  f=1e5:1e2:2e5
    w=2*pi*f;
   Z=Zs(w);
   ZSR=[ZSR Z];
   wRL=[wRL w];
   
   if (abs(R1(Z))< RL)
       RL1=[RL1 RL];
   else
       
         RL1=[RL1 R1(Z)];  
 
   end
       
     

   
   
end
%%
figure();
plot(wRL/(2*pi),abs(RL1),'LineWidth',3);
hold on; 
RL2= 1./(1/RL-1./abs(RL1));
plot(wRL/(2*pi),RL2,'--','LineWidth',3);
ylim([16 80])
    
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