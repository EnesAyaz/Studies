k=[0.05:0.05:0.5];
s_i=find(isnan(freq_12));
%% magnitude plot
i=2;
a=freq_12(s_i(i)+1:s_i(i+1)-1)/1000;
b=mag_12(s_i(i)+1:s_i(i+1)-1);

figure();
plot(a,b)
hold on;


i=3;
a=freq_12(s_i(i)+1:s_i(i+1)-1)/1000;
b=mag_12(s_i(i)+1:s_i(i+1)-1);

plot(a,b)
hold on;



i=4;
a=freq_12(s_i(i)+1:s_i(i+1)-1)/1000;
b=mag_12(s_i(i)+1:s_i(i+1)-1);

plot(a,b)
hold on;





i=5;
a=freq_12(s_i(i)+1:s_i(i+1)-1)/1000;
b=mag_12(s_i(i)+1:s_i(i+1)-1);

plot(a,b)
hold on;