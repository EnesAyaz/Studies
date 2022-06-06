Q=2;
k=0.7;

wt=(-(2-1/Q^2)+sqrt((2-1/Q^2)^2+12*(1-k^2))/(2*(1-k^2)))^0.5 

wo= (( (2-1/Q^2)-sqrt((2-1/Q^2)^2-4*(1-k^2)))/(2*(1-k^2)))^0.5

we= (( (2-1/Q^2)+sqrt((2-1/Q^2)^2-4*(1-k^2)))/(2*(1-k^2)))^0.5

wr=[real(wo)  real(wt)  real(we) ];
wi=[imag(wo)  imag(wt)  imag(we)];
plot(wr,wi,'x')
hold on;
%%
syms w
A=[];
w0=150*2*pi*1e3;

w0=150*2*pi*1e3;
M2=17e-6;
M1=15.4e-6;

Qrx=2;
RL=8;
Ls=Qrx*RL/w0;

k2=0.4;
Lr= M2^2/(k2^2*Ls);

Cs=1/(w0^2*Ls);
Cr=1/(w0^2*Lr);

k1=0.1;
Lp=M1^2/(k1^2*Lr);
Cp=1/(w0^2*Lp);

Zs=1i*w*Ls+1/(1i*w*Cs)+RL;
Zr=1i*w*Lr+1/(1i*w*Cr);
Zp=1i*w*Lp+1/(1i*w*Cp);
Z=Zp*Zs*Zr+w^2*(Zs*M1^2+Zp*M2^2);




%%




% wr=[real(w(I)/w0) ];
% wi=[imag(w(I)/w0) ];
% plot(wr,wi,'x')
% hold on;

% w=w0*0.1: w0*0.1: w0*2
% plot(w/2/pi/1e3,A)
%%
%%
A=[];

syms w;

w0=150*2*pi*1e3;
M2=17e-6;
M1=15.4e-6;

Qrx=2;
RL=8;
Ls=Qrx*RL/w0;

k2=0.4;
Lr= M2^2/(k2^2*Ls);

Cs=1/(w0^2*Ls);
Cr=1/(w0^2*Lr);

k1=0.5;
Lp=M1^2/(k1^2*Lr);
Cp=1/(w0^2*Lp);

Zs=1i*w*Ls+1/(1i*w*Cs)+RL;
Zr=1i*w*Lr+1/(1i*w*Cr);
Zp=1i*w*Lp+1/(1i*w*Cp);
Z=(2*w^4*M1^2*M2^2*RL-3)*(Zp*Zs*Zr +w^2*(Zs*M1^2+Zp*M2^2)) + w^2*RL*M1^2 + RL*Zp*Zr
P=real(conj(1/Z))
solve(P,w)

%%
w=w0*0.1: w0*0.1: w0*3
plot(w,A)
[M,I]=min(A)
w(I)/w0;

%
% [M,I]=min(A)
% w(I)/w0;
% 
% wr=[real(w(I)/w0) ];
% wi=[imag(w(I)/w0) ];
% plot(wr,wi,'x')
% hold on;
% 




