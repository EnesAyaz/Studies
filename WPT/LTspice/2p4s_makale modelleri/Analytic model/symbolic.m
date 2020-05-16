syms w
% syms k
k=0.20;
ks=-0.3;

w_r=2*pi*150e3;
Lp= 107.42e-6;
Ls=68.8e-6;
RL=16.21;
M=k*sqrt(Lp*Ls);
Ms= ks*Ls;
deltaw= (w^2-w_r^2)/w;
Zp=deltaw*1i*Lp;
Zs=deltaw*1i*Ls+ RL;


Zin=( Zp*Zs^2+ w^2*Ms^2*Zp+2*w^2*M^2*Zs+1i*2*w^3*M^2*Ms)/ (Zs^2+w^2*Ms^2);


pretty (Zin)

% root(Zin,w)

% fzero(Zin,w)
fplot(Zin)