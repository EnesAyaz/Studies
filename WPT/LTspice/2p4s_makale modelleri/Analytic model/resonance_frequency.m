w_r=150e3*2*pi;
Lp= 107.42e-6;
rp=0;
Cp=1/(Lp*w_r*w_r);
Ls=68.8e-6;
rs=0;
Cs=1/(Ls*w_r*w_r);
M1= 17.19e-6;
M2 = M1;
Ms= 0.3*Ls;
R1=40*8/(pi^2);
R2=40*8/(pi^2);
%%
len=1e4;
f=logspace(0,5.4,len);
w=2*pi*f;
%%
Zp1=(rp+(1./(1i*w*Cp))+1i*w*Lp);
Zs1=(R1+rs+(1./(1i*w*Cs))+1i*w*Ls);
Zs2=(R2+rs+(1./(1i*w*Cs))+1i*w*Ls);

%%
V=[127;0;0];
ip=[];
is1=[];
is2=[];
for i=1:len
A=[Zp1(i),       -1i*w(i)*M1, -1i*w(i)*M2 ; ...
   1i*w(i)*M1,   -Zs1(i),      1i*w(i)*Ms ; ...
   1i*w(i)*M2,   1i*w(i)*Ms,  -Zs2(i) ];

I=inv(A)*V;
ip=[ip I(1)];
is1=[is1 I(2)];
is2=[is2 I(3)];

end
Vout1= is1*R1;
Vout2=is2*R2;
figure();
plot(f,phase(ip));
hold on; 
plot(f,phase(is1));
hold on;
plot(f,phase(is2));

figure();
plot(f,abs(Vout1));
hold on; 
plot(f,abs(Vout2));


%%
a=find(phase(ip)<0);
f(a(1))
%%
% Ms=0*Ls;
% a=[3*Ls^4 0 (-6*Ls^4*w_r^2-Ms^2), 0, (3*Ls^4*w_r^4) 0];
% roots(a)/(2*pi)

