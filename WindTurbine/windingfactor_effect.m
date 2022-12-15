%Parallel connection
R1=0.000789831;
X1=0.0126978;
R2=0.00052717;
X2=0.0112829;
Rc=22.2001;
Xm=0.359696;

s=-1:0.001:0;

Z1= R1+1i*X1;
Z2= 1/(1/Rc + 1/(1i*Xm));
Z3=R2+1i*X2;
Z4=R2.*(1-s)./s;

Zth=1/(1/Z1+1/Z2);
Rth=real(Zth);
Xth=imag(Zth);
Zin6= Zth+Z3+Z4;

Vin=700/sqrt(3)*0.9659;
Vth= abs(Z2/(Z2+Z1)*Vin);
pp=3; % pole pair
ws=2*pi*fs;
Te6= 3*(Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws/pp));
w=1-s;


figure();
plot(fs*20*w,abs(Te6/1000))
hold on;


%3-phase
R1=R1;
X1=X1;
R2=R2/0.933;
X2=X2/0.933;
Rc=Rc/0.9659;
Xm=Xm/0.9659;

s=-1:0.001:0;

Z1= R1+1i*X1;
Z2= 1/(1/Rc + 1/(1i*Xm));
Z3=R2+1i*X2;
Z4=R2.*(1-s)./s;

Zth=1/(1/Z1+1/Z2);
Rth=real(Zth);
Xth=imag(Zth);
Zin6= Zth+Z3+Z4;

Vin=700/sqrt(3);
Vth= abs(Z2/(Z2+Z1)*Vin);
pp=3; % pole pair
ws=2*pi*fs;
Te6= 3*(Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws/pp));
w=1-s;

plot(fs*20*w,abs(Te6/1000))

legend('Combined 3-phase','Combined 3-phase enhanced winding factor')

yline(33)
xline(1206.7)
