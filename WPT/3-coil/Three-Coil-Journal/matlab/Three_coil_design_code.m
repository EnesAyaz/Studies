clear all;

Pin=500;
Pout=500;
R_L=16.2;
Vout=100;
Vin=90;
f_0=150e3;
w_0=2*pi*f_0;
Iout=Vout/R_L;
Iin=Pin/Vin;
kpr=0.2;
krs=0.4;
Qs=0.6;


k_irip=1.1;
Ir=Iin*k_irip;
Mrs=Vout/(w_0*Ir);
Ls=Qs*R_L/w_0;
Lr=Mrs^2/((krs^2)*Ls);
Mpr=Vin/(w_0*Ir);
Lp=Mpr^2/((kpr^2)*Lr);
Req=((w_0)^2*(Mrs)^2)/R_L;
Qt=(w_0*Lr)/(Req);
kc=(1/Qt)*sqrt(1-1/(4*Qt^2));
Cp=1/(w_0^2*Lp);
Cr=1/(w_0^2*Lr);
Cs=1/(w_0^2*Ls);

Lr=Lr*1e6;
Ls=Ls*1e6;
Lp=Lp*1e6;

[Lp Lr Ls Mpr*1e6 Mrs*1e6 Cp*1e9 Cr*1e9 Cs*1e9 ]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





