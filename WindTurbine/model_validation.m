%% 1x3 phase parallel
% Parallel
R1=0.000789831;
X1=0.0126978;
R2=0.00052717;
X2=0.0112829;
Rc=22.2001;
Xm=0.359696;

fs=60;

L1=X1/2/pi/fs;
L2=X2/2/pi/fs;
Lm=Xm/2/pi/fs;
s=-1:0.001:0;

Z1= R1+1i*X1;
Z2= 1/(1/Rc + 1/(1i*Xm));
Z3=R2+1i*X2;
Z4=R2.*(1-s)./s;

Zth=1/(1/Z1+1/Z2);
Rth=real(Zth);
Xth=imag(Zth);
Zin6= Zth+Z3+Z4;

Vin=700;
Vin=1400;
Vth= abs(Z2/(Z2+Z1)*Vin);
ws=2*pi*fs;
Te6= (3*Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws));
w=1-s;

figure();
plot(fs*20*w,abs(Te6/1000))
hold on;

smaxT= R2/(sqrt((Rth+R2)^2+(Xth+X2)^2))


