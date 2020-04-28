load('data_v1-90degree_phase_pos_seq.mat')
id1=Module1{1}.Values.Data(:);
id2=Module2{1}.Values.Data;
tout=Module2{1}.Values.time;
%%
Fs=1/(tout(2)-tout(1));
L=length(tout);
y1_raw=fft(id1);
y2_raw=fft(id2);
%%
y1 = abs(y1_raw/L);
y1 = y1(1:L/2+1);
y1(2:end-1) = 2*y1(2:end-1);

y1_ang = angle(y1_raw/L);
y1_ang = y1_ang(1:L/2+1);
y1_ang(2:end-1) = 2*y1_ang(2:end-1);

y2 = abs(y2_raw/L);
y2 = y2(1:L/2+1);
y2(2:end-1) = 2*y2(2:end-1);

y2_ang = angle(y2_raw/L);
y2_ang = y2_ang(1:L/2+1);
y2_ang(2:end-1) = 2*y2_ang(2:end-1);

f = Fs*(0:(L/2))/L;
%%
figure();
subplot(1,2,1);
stem(f,y1)
hold on;
stem(f,y2)
xlim([39000, 41000])
subplot(1,2,2);
stem(f,y1_ang)
hold on;
stem(f,y2_ang)
xlim([39000, 41000])

%%

figure();
subplot(1,2,1);
stem(f,y1)
hold on;
stem(f,y2)
subplot(1,2,2);
stem(f,y1_ang)
hold on;
stem(f,y2_ang)