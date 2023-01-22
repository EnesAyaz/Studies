clc;
R1=0.000789831;
X1=0.0126978;
R2=0.00052717;
X2=0.0112829;
Rc=22.2001;
Xm=0.359696;

R2=R2/0.933
X2=X2/0.933;
Rc=Rc/0.9659;
Xm=Xm/0.9659;

s=-0.005264;
s=-0.00563;

Z1= R1+1i*X1;
Z2= 1/(1/Rc + 1/(1i*Xm));
Z3=R2+1i*X2;
Z4=R2*(1-s)/s;
Z5=Z3+Z4;

Vin=700/sqrt(3);

Z6=1/(1/Z2+1/Z5);
Z7=Z1+Z6;

Va=Vin*Z6/Z7

Ic=abs(Va/Rc)


Is=abs((Vin-Va)/Z1)

Pf=real((Vin-Va)/Z1)/abs((Vin-Va)/Z1)

Im=abs(Va/Xm)

P=abs((Z4*(Va/Z5)*(Va/Z5)))*3
T=P/20/2/pi
% 
% 
% Zth=1/(1/Z1+1/Z2);
% Rth=real(Zth);
% Xth=imag(Zth);
% Zin6= Zth+Z3+Z4;
% 
% fs=60;
% Vin=700/sqrt(3);
% Vth= abs(Z2/(Z2+Z1)*Vin);
% ws=2*pi*fs;
% Te6= 3*(3*Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws))

% abs(Vin/Zin6)
%real(Vin/Zin6)
% abs((Vin-Z1*(Vin/Zin6))/Rc)
%%

clc;
R1=0.000789831;
X1=0.0126978;
R2=0.00052717;
X2=0.0112829;
Rc=22.2001;
Xm=0.359696;

R2=2*R2/0.933
X2=2*X2/0.933;
Rc=2*Rc/0.9659;
Xm=2*Xm/0.9659;
R1=2*R1;
X1=2*X1;

s=-0.005264;
s=-0.00563;

Z1= R1+1i*X1;
Z2= 1/(1/Rc + 1/(1i*Xm));
Z3=R2+1i*X2;
Z4=R2*(1-s)/s;
Z5=Z3+Z4;

Vin=700/sqrt(3);

Z6=1/(1/Z2+1/Z5);
Z7=Z1+Z6;

Va=Vin*Z6/Z7

Ic=abs(Va/Rc)


Is=abs((Vin-Va)/Z1)

Pf=real((Vin-Va)/Z1)/abs((Vin-Va)/Z1)

Im=abs(Va/Xm)

P=abs((Z4*(Va/Z5)*(Va/Z5)))*3
T=P/20/2/pi
