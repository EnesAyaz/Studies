%% 1x3 rmxprt values
R1=0.000789831;
X1=0.0126978;
R2=0.00052717;
X2=0.0112829;
Rc=22.2001;
Xm=0.359696;

%% 2x3 model
R1a=2*R1;
X1a=2*X1;
R2a=2*R2/0.933;
X2a=2*X2/0.933;
Rca=2*Rc/0.9659;
Xma=2*Xm/0.9659;

%%
Power=4300e3;
Torque=34500;
pole=6;
pp=pole/2;r
Vll=700; 
f=60;
Stray_loss=29240;
Fricrtional_loss=1005.26;
Windage_loss=2031.75;
Jm=242.28;
N=1206;
wm=N/60*2*pi;
%%
L1=X1/2/pi/f;
L2=X2/2/pi/f;
Lm=Xm/2/pi/f;

L1a=X1a/2/pi/f;
L2a=X2a/2/pi/f;
Lma=Xma/2/pi/f;

%%
w=2*pi*2e3;
L=200e-6;
C=1/w^2/L*1e6

