%% 6 phase 
% Parallel
R1=0.000789831;
X1=0.0126978;
R2=0.00052717;
X2=0.0112829;
Rc=22.2001;
Xm=0.359696;

% Series 
% R1=0.00315932;
% X1=0.0510511;
% R2=0.00210868;
% X2=0.0460172;
% Rc=88.7937;
% Xm=1.52607;

Jm= 2;
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


%%
R1=0.00315932;
X1=0.0510511;
R2=0.00210868;
X2=0.0460172;
Rc=88.7937;
Xm=1.52607;

R1=R1/2;
X1=X1/2;
% Rc= 1.8624

% Rc=(1.0719*Rc)/2;
% Xm=(1.0719*Xm)/2;
% R2=(1.0719*R2)/2;
% X2=(1.0719*X2)/2;

Rc=(Rc)*0.5369;
Xm=(Xm)*0.5369;
R2=(R2)*0.5;
X2=(X2)*0.5;

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
% Vin=1400;
Vth= abs(Z2/(Z2+Z1)*Vin);
ws=2*pi*fs;
Te6= 2*(3*Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws));
w=1-s;
% figure();
plot(fs*20*w,abs(Te6/1000))

smaxT= R2/(sqrt((Rth+R2)^2+(Xth+X2)^2));
% 2*(3*Vth^2./((Rth+(R2./smaxT)).^2+(Xth+X2).^2)).*(R2./(smaxT*ws))/1000

%% 3 phase 

R1=7.898e-3*2;
X1=12.698e-3*2;
R2=5.272e-3*2;
X2=11.283e-3*2;
Rc=22.2*2;
Xm=0.3597*2;

% L1=X1/2/pi/fs;
% L2=X2/2/pi/fs;
% Lm=Xm/2/pi/fs;


Z1= R1+1i*X1;
Z2= 1/(1/Rc + 1/(1i*Xm));
Z3=R2+1i*X2;
Z4=R2.*(1-s)./s;

Zth=1/(1/Z1+1/Z2);
Rth=real(Zth);
Xth=imag(Zth);
Vth= Z2/(Z2+Z1);
ws=2*pi*fs;
Te3= (3*Vth^2./((Rth+R2./s).^2+(Xth+X2).^2)).*R2./s./ws;
Zin3= Zth+Z3+Z4;

w=1-s;
% plot(w,Te3)

%%
figure();
plot(1200*w,Te6,'b')
hold on;
plot(1200*w,2*Te3,'r--')
hold on;
plot(1200*w,Te3,'r')
xlabel('Speed (RPM)');
ylabel('Torque (p.u)');
legend('6-phase','2x3-phase','3-phase')

%%

% figure();
% plot(w,Zin6)
% hold on;
% plot(w,Zin3,'--')

figure();
plot(w,180*angle(Zin6)/pi,'b')
hold on;
plot(w,180*angle(Zin3)/pi,'r--')
xlabel('Speed (p.u)');
ylabel('Angle of Input Impedance (^o)');
legend('6-phase','3-phase')

%%
figure();
plot(w,-cos(angle(1./Zin6)),'b')
hold on;
plot(w,-cos(angle(1./Zin3)),'r--')
xlabel('Speed (p.u)');
ylabel('Power factor');
legend('6-phase','2x3-phase','3-phase')




