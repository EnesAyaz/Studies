fo=150e3;
wo=2*pi*150e3;
Ls=66e-6;
Cs= 1/(wo^2*Ls);
RL= 16;
M=17e-6; 
a1=0.1;
M1=M*(1+a1);
M2=M*(1-a1);

f=1e5:1e2:2e5;
w=2*pi*f;
Zs=1i*w*Ls+1./(1i*w*Cs);

figure();
for RL=16:8:64
    Vout1=M1*w.*(RL./(Zs+RL));
    plot(f/1000,Vout1,'b');
    hold on;
end
for RL=16:8:64
    Vout1=M2*w.*(RL./(Zs+RL));
    plot(f/1000,Vout1,'r');
    hold on;
end

%%
fo=150e3;
wo=2*pi*150e3;
Ls=17e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=12e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 
a1=0.1;
M1=M*(1+a1);
M2=M*(1-a1);

f=1e5:1e2:2e5;
w=2*pi*f;

figure();
for RL=24:8:64
    Za=(RL./(1i*w*Cs))./(RL+1./(1i*w*Cs));
    Vout1=M1*w.*(Za./(1i*w*Ls+Za));
    plot(f/1000,Vout1,'b');
    hold on;
end
for RL=24:8:64
    Za=(RL./(1i*w*Cs))./(RL+1./(1i*w*Cs));
    Vout1=M2*w.*(Za./(1i*w*Ls+Za));
    plot(f/1000,Vout1,'r');
    hold on;
end
%%
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

f=1e5:1e2:2e5;
w=2*pi*f;

Zs=1i*w*Ls+1./(1i*w*Cs);

figure();
for RL=64:-8:16
    Vout1=M1*w.*(1./(Zs+RL));
    plot(f/1000,Vout1,'b');
    hold on;
end
for RL=64:-8:16
   Vout2=M2*w.*(1./(Zs+RL));
    plot(f/1000,Vout2,'r');
    hold on;
end


%%

figure();
    c=[0 0 1];
    RL=35.2;
    Vout1=M1*w.*(1./(Zs+RL));
    plot(f/1000,Vout1,'color',c,'LineWidth',2);
    hold on;
    RL=64-RL;
    Vout2=M2*w.*(1./(Zs+RL));
    plot(f/1000,Vout2,'--','color',c,'LineWidth',2);
    hold on;
   %
    c=[0 1 0];
    RL=36;
    Vout1=M1*w.*(1./(Zs+RL));
    plot(f/1000,Vout1,'color',c,'LineWidth',2);
    hold on;
    RL=64-RL;
    Vout2=M2*w.*(1./(Zs+RL));
    plot(f/1000,Vout2,'--','color',c,'LineWidth',2);
    hold on;
   %
    c=[1 0 0];
    RL=40;
    Vout1=M1*w.*(1./(Zs+RL));
    plot(f/1000,Vout1,'color',c,'LineWidth',2);
    hold on;
    RL=64-RL;
    Vout2=M2*w.*(1./(Zs+RL));
    plot(f/1000,Vout2,'--','color',c,'LineWidth',2);
   %
    c=[0 0 0];
    RL=50;
    Vout1=M1*w.*(1./(Zs+RL));
    plot(f/1000,Vout1,'color',c,'LineWidth',2);
    hold on;
    RL=64-RL;
    Vout2=M2*w.*(1./(Zs+RL));
    plot(f/1000,Vout2,'--','color',c,'LineWidth',2);
    
%     
%     legend('RL1=35.2','RL1=36','RL1=40')
%%

    
    
    



