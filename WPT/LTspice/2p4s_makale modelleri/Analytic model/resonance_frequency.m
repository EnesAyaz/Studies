w_r=150e3*2*pi;
Lp= 107.42e-6;
rp=0;
Cp=1/(Lp*w_r*w_r);
Ls=68.8e-6;
rs=0;
Cs=1/(Ls*w_r*w_r);
M1= 17.19e-6;
M2 = M1;
Ms= 0*Ls;
R1=80*8/(pi^2);
R2=80*8/(pi^2);

%%
len=1e4;
f=logspace(4.1,5.4,len);
w=2*pi*f;
%%
Zp1=(rp+(1./(1i*w*Cp))+1i*w*Lp);
Zs1=(R1+rs+(1./(1i*w*Cs))+1i*w*Ls);
Zs2=(R2+rs+(1./(1i*w*Cs))+1i*w*Ls);

%%
deter_anal=(Zp1.*Zs1.*Zs2)+ (w.*w.*Ms*Ms.*Zp1)+(w.*w.*M1*M1.*Zs2)+(2*1i*w.*w.*w*M1*M2*Ms)+(w.*w.*M2*M2.*Zs1);
m1_anal= ((Zs1.*Zs2)+(w.*w.*Ms.*Ms))./deter_anal;
V=[1;0;0];
ip=[];
is1=[];
is2=[];
deter=[];
m1=[];
m2=[];
m3=[];
for i=1:len
A=[Zp1(i),       -1i*w(i)*M1, -1i*w(i)*M2 ; ...
   1i*w(i)*M1,   -Zs1(i),     +1i*w(i)*Ms ; ...
   1i*w(i)*M2,   1i*w(i)*Ms,  -Zs2(i) ];
deter= [ deter det(A) ];
k=inv(A);
I=inv(A)*V;
m1=[m1 k(1,1)];
m2=[m2 k(2,1) ];
m3=[m3 k(3,1) ];
ip=[ip I(1)];
is1=[is1 I(2)];
is2=[is2 I(3)];

end
% Vout1= is1*R1;
% Vout2=is2*R2;
% figure();
% plot(f,phase(ip));
% hold on; 
% plot(f,phase(is1));
% hold on;
% plot(f,phase(is2));
% 
% figure();
% plot(f,abs(Vout1));
% hold on; 
% plot(f,abs(Vout2));

%%
% figure('name', 'determinant');
% plot(f,phase(deter_anal));
% hold on;
% plot(f,phase(deter),'--');
% xlim([1e5 2e5])
% legend('anal','calc')
%% 
% figure();
% plot(f,abs(m1_anal));
% hold on;
% plot(f,abs(m1),'--');
% hold on; 
% xlim([1e5 2e5])
% % plot(phase(m1_anal));
% hold on;
% plot(phase(m1),'--');
% legend('anal','calc')

%%
a=find(phase(ip)<0);
f(a(1))
%%
V_in=(ones(1,len));
Z_in2=V_in./ip;
Z_in=V_in./m1_anal;
%%
figure();
plot(f,abs(Z_in2));
hold on; 
plot(f,abs(Z_in),'--');
legend(' mag calc','mag anal')
xlim([100000 200000])
figure();
plot(f,phase(Z_in2));
hold on; 
plot(f,phase(Z_in), '--');
legend('mag calc','mag anal')
%%
% Lp= 107.42e-6;
% Ls=68.8e-6;
% Ms=-0.3*Ls;
% R_L=40*8/(pi^2);
% w_r=150e3*2*pi;
% w=156e3*2*pi;
% Delta_w= (w^2-w_r^2)/w;
% % error=(w*Ms)^3-Delta_w*Lp*R_L^2
% 
% k= [Ms^3 0 -Lp*R_L^2 0 w_r^2*Lp*R_L^2];
% 
% roots(k)/(2000*pi)
