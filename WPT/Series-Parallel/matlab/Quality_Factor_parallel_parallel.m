fo=150e3;
wo=2*pi*150e3;
Ls=17e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RLx= 16;
M=12e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 
a1=0.2;
M1=M*(1+a1);
M2=M*(1-a1);

f=1e5:1e2:2e5;
w=2*pi*f;


figure();
    c=[0 0 1];
    RL=23;
    Za=(RL./(1i*w*Cs))./(RL+(1./(1i*w*Cs)));
    Vout1=M1*w.*(Za./(1i*w*Ls+Za));
    plot(f/1000,Vout1,'color',c,'LineWidth',1);
    hold on;
    RL=1/((1/RLx)-(1/RL));
    Za=(RL./(1i*w*Cs))./(RL+1./(1i*w*Cs));
    Vout2=M2*w.*(Za./(1i*w*Ls+Za));
    plot(f/1000,Vout2,'--','color',c,'LineWidth',2);
    hold on;
%    %
%     c=[0 1 0];
%     RL=18;
%     Za=(RL./(1i*w*Cs))./(RL+(1./(1i*w*Cs)));
%     Vout1=M1*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout1,'color',c,'LineWidth',2);
%     hold on;
%     RL=1/((1/RLx)-(1/RL));
%     Za=(RL./(1i*w*Cs))./(RL+1./(1i*w*Cs));
%     Vout2=M2*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout2,'--','color',c,'LineWidth',3);
%     hold on;
%    %
%     c=[1 0 0];
%     RL=20;
%     Za=(RL./(1i*w*Cs))./(RL+(1./(1i*w*Cs)));
%     Vout1=M1*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout1,'color',c,'LineWidth',2);
%     hold on;
%     RL=1/((1/RLx)-(1/RL));
%     Za=(RL./(1i*w*Cs))./(RL+1./(1i*w*Cs));
%     Vout2=M2*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout2,'--','color',c,'LineWidth',3);
%     hold on;
%    %
%     c=[0 0 0];
%     RL=22;
%     Za=(RL./(1i*w*Cs))./(RL+(1./(1i*w*Cs)));
%     Vout1=M1*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout1,'color',c,'LineWidth',2);
%     hold on;
%     RL=1/((1/RLx)-(1/RL));
%     Za=(RL./(1i*w*Cs))./(RL+1./(1i*w*Cs));
%     Vout2=M2*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout2,'--','color',c,'LineWidth',3);
%     hold on;
%     
% %    
%     c=[0 1 1];
%     RL=25;
%     Za=(RL./(1i*w*Cs))./(RL+(1./(1i*w*Cs)));
%     Vout1=M1*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout1,'color',c,'LineWidth',2);
%     hold on;
%     RL=1/((1/RLx)-(1/RL));
%     Za=(RL./(1i*w*Cs))./(RL+1./(1i*w*Cs));
%     Vout2=M2*w.*(Za./(1i*w*Ls+Za));
%     plot(f/1000,Vout2,'--','color',c,'LineWidth',3);
%     hold on;
% %     legend('RL1=35.2','RL1=36','RL1=40')