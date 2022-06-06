syms Qs w kp ks w0 

x= w-w0^2/w;
Z= (Qs/w0)*(w^2*(kp^2+ks^2)-x^2)*(w^2*ks^2-x^2)- (w^2*kp^2-x^2) == 0;

% x= w^2-w0^2;
% Z= (Qs/w0)*(w^4*(kp^2+ks^2)-x^2)*(w^4*ks^2-x^2)- (w^4*kp^2-w^2*x^2);
% %%
% simplify(Z)
roots=solve(Z,w);

%%
 
syms M1 M2 c k1 k2 s
eqn = c*(M1+M2)*s^3+ k1*c*s^-1 == 0;
roots = solve(eqn, s)

% (- w0^2/w + w)^2
% - kp^2*w^2 + 
% (Qs*(ks^2*w^2 - (- w0^2/w + w)^2)*(w^2*(kp^2 + ks^2) - (- w0^2/w + w)^2))/w0 
%%

syms Qs w kp ks w0 
Qs=2;
w0=2*pi*150*1e3;
kp=0.8;
ks=0.4;

a=-Qs/w0;
b=1-kp^2+Qs*ks^2/w0+2*Qs*w0-Qs/w0;
c=-2*w0^2-Qs*w0^3*(kp^2+ks^2)+2*Qs*w0;
d= w0^4-Qs*w0^3;

eqn = a*w^4+b*w^2+c+ d*w^-2 ==0;
roots = vpasolve( eqn );

a=roots/942480

