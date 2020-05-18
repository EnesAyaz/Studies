load('Y:\Github\DATA\Comparison\siyahlar\Data_with_parasitic01ohm');
%%
ts=time(2)-time(1);
fs=1/ts;
number_of_sample= fs/50;

starting=1+1*number_of_sample;
ending= 1+3*number_of_sample;
%%
capA_cur_new=-capA_cur(starting:ending);
yA = fft(capA_cur_new);
LA=length(yA);
capA_cur_mag2= abs(yA/LA);
capA_cur_mag_with=capA_cur_mag2(1:LA/2+1);
capA_cur_mag_with(2:end-1)=2*capA_cur_mag_with(2:end-1);

P2A_phase= angle(yA/LA);
capA_cur_angle_with=P2A_phase(1:LA/2+1);

%%
load('Y:\Github\DATA\Comparison\siyahlar\Data_without_parasitic01ohm');
%%
capA_cur_new=-capA_cur(starting:ending);
yA = fft(capA_cur_new);
LA=length(yA);
capA_cur_mag2= abs(yA/LA);
capA_cur_mag_without=capA_cur_mag2(1:LA/2+1);
capA_cur_mag_without(2:end-1)=2*capA_cur_mag_without(2:end-1);

P2A_phase= angle(yA/LA);
capA_cur_angle_without=P2A_phase(1:LA/2+1);
fA= fs*(0:(LA/2))/LA;
%%
figure();
subplot(2,1,1)
stem(fA/1000,capA_cur_mag_with,'b-','Linewidth',1);
hold on;
stem(fA/1000,capA_cur_mag_without,'r-','Linewidth',1);
xlim([0 500])
% xlim([359 361])
% xlim([319 321])
% xlim([279 281])
% xlim([239 241])
% xlim([199 201])
% xlim([159 161])
% xlim([119.5 120.5])
% xlim([79.7 80.3])
% xlim([39.8 40.2])
ylabel('|Mag|','FontSize',20,'FontWeight','Bold')
xlabel('Frequency(kHz)','FontSize',20,'FontWeight','Bold')
legend({'With parasitic','Without parasitic'},'Location','best');
title('Capacitor Current-A ','FontSize',20,'FontWeight','Bold');
set(gca,'FontSize',20)

subplot(2,1,2)
stem(fA/1000,capA_cur_angle_with*180/pi,'b-','Linewidth',1);
hold on;
stem(fA/1000,capA_cur_angle_without*180/pi,'r-','Linewidth',1);
xlim([0 500])
% xlim([359 361])
% xlim([319 321])
% xlim([279 281])
% xlim([239 241])
% xlim([199 201])
% xlim([159 161])
% xlim([119.5 120.5])
% xlim([79.7 80.3])
% xlim([39.8 40.2])
ylabel('|Angle(Degree)|','FontSize',20,'FontWeight','Bold')
xlabel('Frequency(kHz)','FontSize',20,'FontWeight','Bold')
legend({'With parasitic','Without parasitic'},'Location','best');
title('Capacitor Current-A ','FontSize',20,'FontWeight','Bold');
set(gca,'FontSize',20)


