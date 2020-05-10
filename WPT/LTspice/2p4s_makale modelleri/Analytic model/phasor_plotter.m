w=2*pi*150e3;
Lp= 107.42e-6;
Ls=68.8e-6;
M1= 17.19e-6;
M2 = 15.47e-6;
Ms=-0.32*Ls;
Ip=7.9385;
Is1=3.1487;
Is2=2.399;
alfa=86.32;
beta=95.11;
theta=-30;

Vout1_m=112;
Vout1_a=86.32*(2*pi/360);
Vout2_m=109;
Vout2_a=95.11*(2*pi/360);

jwm2Is2_m=w*M2*Is2;
jwm2Is2_a=(beta+90)*(2*pi/360);

jwm1Is1_m=w*M1*Is1;
jwm1Is1_a=(alfa+90)*(2*pi/360);

jwm1Ip_m=w*M1*Ip;
jwm1Ip_a=(theta+90)*(2*pi/360);

jwm2Ip_m=w*M2*Ip;
jwm2Ip_a=(theta+90)*(2*pi/360);

jwmsIs1_m=w*Ms*Is1;
jwmsIs1_a=(alfa+90)*(2*pi/360);

jwmsIs2_m=w*Ms*Is2;
jwmsIs2_a=(beta+90)*(2*pi/360);

Vout1_v=Vout1_m*exp(1i*Vout1_a);
Vout2_v=Vout2_m*exp(1i*Vout2_a);
jwm1Is1_v=jwm1Is1_m*exp(1i*jwm1Is1_a);
jwm2Is2_v=jwm2Is2_m*exp(1i*jwm2Is2_a);
jwm1Ip_v=jwm1Ip_m*exp(1i*jwm1Ip_a);
jwm2Ip_v=jwm2Ip_m*exp(1i*jwm2Ip_a);
jwmsIs1_v=jwmsIs1_m*exp(1i*jwmsIs1_a);
jwmsIs2_v=jwmsIs2_m*exp(1i*jwmsIs2_a);
is1_v=Is1*40*exp(1i*alfa*2*pi/360);
is2_v=Is2*40*exp(1i*beta*2*pi/360);
figure;
scatter(real(Vout1_v), imag(Vout1_v));
hold on;
scatter(real(Vout2_v), imag(Vout2_v));
hold on;
scatter(real(jwm1Is1_v), imag(jwm1Is1_v));
hold on;
scatter(real(jwm2Is2_v), imag(jwm2Is2_v));
hold on;
scatter(real(jwm1Ip_v), imag(jwm1Ip_v));
hold on;
scatter(real(jwm2Ip_v), imag(jwm2Ip_v));
hold on;
scatter(real(jwmsIs1_v), imag(jwmsIs1_v));
hold on;
scatter(real(jwmsIs2_v), imag(jwmsIs2_v));
hold on;
scatter(real(is1_v), imag(is1_v));
hold on;
scatter(real(is2_v), imag(is2_v));
xlim([-140 140]);
grid minor;
legend("Vout1","Vout2","M_{1}I_{s1}","M_{2}I_{s2}","M_{1}I_{p}","M_{2}I_{p}","M_{s}I_{s1}","M_{s}I_{s2}","Is1","Is2")