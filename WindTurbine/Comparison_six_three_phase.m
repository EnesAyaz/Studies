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

Vin=700/sqrt(3);
Vth= abs(Z2/(Z2+Z1)*Vin);
pp=3; % pole pair
ws=2*pi*fs;
Te6= 3*(Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws/pp));
w=1-s;

plot(fs*20*w,abs(Te6/1000))
hold on;


%6-phase
R1=2*R1;
X1=2*X1;
R2=2*R2/0.933;
X2=2*X2/0.933;
Rc=2*Rc/0.9659;
Xm=2*Xm/0.9659;

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
Te6= 6*(Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws/pp));
w=1-s;

plot(fs*20*w,abs(Te6/1000))

legend('Combined 3-phase','6-phase')

yline(33)
xline(1206.7)
%%

opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["H_z", "Torque"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
tbl = readtable("D:\Github\Studies\WindTurbine\Giris Torku vs Hiz2.csv", opts);
H_z = tbl.H_z;
Torque = tbl.Torque;
clear opts tbl


plot(H_z,abs(Torque))
hold on;

speed=1200:2:1240;
Torquea=[0 -10.3 -20.18 -29.75 -38.72 -47.35 -55.20 -62.34 -68.85 -74.27 -79.27 -83.16 -85.97 -88.57 -90.2 -90.91 -91.48 -91.32 -90.7 -90 -89.1]

Torquea=[0 -10.97 -21.7 -31.87 -41.44 -50.16 -58.06 -64.99 -70.9 -75.86 -79.86 -83.08 -85.48 -87.07 -88.24 -88.82 -89.03 -88.88 -88.59 -88.09 -87.36]

plot(speed,abs(Torquea))

hold on;

plot(fs*20*w,abs(Te6/1000))
% xlim([1200 1215])
legend('3-ph','6-ph','6-ph calculation')
%%

