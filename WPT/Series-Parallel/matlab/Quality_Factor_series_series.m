fo=150e3;
wo=2*pi*150e3;
Ls=66e-6;
Cs= 1/(wo^2*Ls);
RLx= 64;
M=8.5e-6; 

a1=0.1;
M1=M*(1+a1);
M2=M*(1-a1);

f=1e5:1e2:2e5;
w=2*pi*f;

Zs=1i*w*Ls+1./(1i*w*Cs);





figure();
c=[0 0 1];
RL=35.1;
Is1=M1*w.*(1./(Zs+RL));
plot(f/1000,Is1,'color',c,'LineWidth',1);
hold on;
RL=RLx-RL;
Is2=M2*w.*(1./(Zs+RL));
plot(f/1000,Is2,'--','color',c,'LineWidth',2);
hold on;

