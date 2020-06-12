%% First Design a 1Tx-1Rx condition

% symbolic functions
syms w;
syms wp;
syms ws;
syms Vin;
syms Lp;
syms Ls;
syms M;
syms RL

delta_wp= (w^2-wp^2)/w;
delta_ws= (w^2-ws^2)/w;

syms delta_wp;
syms delta_ws;

Zp= 1i*delta_wp*Lp;
Zs= 1i*delta_ws*Ls;
% we can write a matrix equation Ax=b where x is [Ip Is]'
A=[Zp, 1i*w*M ; -1i*w*M Zs+RL];

x= inv(A)*[Vin ;0];

Ip=simplify(x(1));
Is=simplify(x(2));
pretty(Ip)
pretty(Is)

[Np,Dp] = numden(Ip);
z1a=angle(Np);
p1a=angle(Dp);

z1m=abs(Np);
p1m=abs(Dp);



[Ns,Ds] = numden(Is);
z2=solve(Np,w);
p2=solve(Dp,w);

%%

wp=2*pi*150e3;
ws=2*pi*140e3;
Vin=127;
Lp=83e-6;
Ls=66e-6;
M=14.6e-6;
RL=20*8/pi^2;

% w=2*pi*150e3;
% delta_wp= (w^2-wp^2)/w;
% delta_ws= (w^2-ws^2)/w;
% Zp= 1i*delta_wp*Lp;
% Zs= 1i*delta_ws*Ls;
% 
% A=[Zp, 1i*w.*M ; -1i*w.*M, Zs+RL];
% x= inv(A)*[Vin ;0];


x=[];
for w=110e3:0.5e3:2*pi*180e3 

delta_wp= (w^2-wp^2)/w;
delta_ws= (w^2-ws^2)/w;
Zp= 1i*delta_wp*Lp;
Zs= 1i*delta_ws*Ls;

A=[Zp, 1i*w.*M ; -1i*w.*M, Zs+RL];
x= [x inv(A)*[Vin ;0] ];


end
w=110e3:0.5e3:2*pi*180e3 ;

figure;

plot(w/(2*pi),abs(x(1,:)));
hold on; 
plot(w/(2*pi),abs(x(2,:)));


figure; 
plot(w/(2*pi),180*angle(x(1,:))/pi);
hold on; 
plot(w/(2*pi),180*angle(x(2,:))/pi);

%%
%% changing RL 

wp=2*pi*150e3;
ws=2*pi*150e3;
Vin=127;
Lp=83e-6;
Ls=66e-6;
M=14.6e-6;
RL=10*8/pi^2;


% w=2*pi*150e3;
% delta_wp= (w^2-wp^2)/w;
% delta_ws= (w^2-ws^2)/w;
% Zp= 1i*delta_wp*Lp;
% Zs= 1i*delta_ws*Ls;
% 
% A=[Zp, 1i*w.*M ; -1i*w.*M, Zs+RL];
% x= inv(A)*[Vin ;0];
RL=1*8/pi^2:20*8/pi^2:161*8/pi^2;



for i=1:length(RL)
    x=[];
    for w=100e3*2*pi:0.5e3:2*pi*200e3 

    delta_wp= (w^2-wp^2)/w;
    delta_ws= (w^2-ws^2)/w;
    Zp= 1i*delta_wp*Lp;
    Zs= 1i*delta_ws*Ls;

    A=[Zp, 1i*w.*M ; -1i*w.*M, Zs+RL(i)];
    x= [x inv(A)*[Vin ;0] ];


    end
    x_r.values{i}=(x);
    x_r.label{i}=(num2str(RL(i)));
end
figure();
hold on;
w=100e3*2*pi:0.5e3:2*pi*200e3 ;
legends= [];
for i=1:length(RL)
 
 plot(w/(1000*2*pi),abs(x_r.values{i}(2,:)));
 hold on;
 legends= [legends, strcat("R=",string(RL(i)))];
end
legend(legends)
title('Seconder Current');
ylabel('Current(A)');
xlabel('Frequency(kHz)')
grid on;

figure();
legends= [];
for i=1:length(RL)
 
 plot(w/(1000*2*pi),RL(i)*abs(x_r.values{i}(2,:)));
 hold on;
 legends= [legends, strcat("R=",string(RL(i)))];
end
legend(legends)
title('Load Voltages');
ylabel('Voltage(V))');
xlabel('Frequency(kHz)')
grid on;


%%
%% changing mutual

wp=2*pi*150e3;
ws=2*pi*120e3;
Vin=127;
Lp=83e-6;
Ls=66e-6;
M=14.6e-6;
RL=10*8/pi^2;

M=10.6e-6:1e-6:16.6e-6;

for i=1:length(M)
    x=[];
    for w=100e3*2*pi:0.5e3:2*pi*200e3 

    delta_wp= (w^2-wp^2)/w;
    delta_ws= (w^2-ws^2)/w;
    Zp= 1i*delta_wp*Lp;
    Zs= 1i*delta_ws*Ls;

    A=[Zp, 1i*w.*M(i) ; -1i*w.*M(i), Zs+RL];
    x= [x inv(A)*[Vin ;0] ];


    end
    x_r.values{i}=(x);
    x_r.label{i}=(num2str(M(i)));
end
figure();
hold on;
w=100e3*2*pi:0.5e3:2*pi*200e3 ;
legends= [];
for i=1:length(M)
 
 plot(w/(1000*2*pi),abs(x_r.values{i}(2,:)));
 hold on;
 legends= [legends, strcat("M=",string(M(i)))];
end
legend(legends)
title('Seconder Current');
ylabel('Current(A)');
xlabel('Frequency(kHz)')
grid on;


figure();
legends= [];
for i=1:length(M)
 
 plot(w/(1000*2*pi),RL*abs(x_r.values{i}(2,:)));
 hold on;
 legends= [legends, strcat("M=",string(M(i)))];
end
legend(legends)
title('Load Voltages');
ylabel('Voltage(V))');
xlabel('Frequency(kHz)')
grid on;

%%
%% a 1Tx-2Rx condition

% symbolic functions
syms w;
syms wp;
syms ws;
syms Vin;
syms Lp;
syms Ls;
syms M1;
syms M2;
syms RL1;
syms RL2;

% M1=14.7e-6;
% M2=0.80*M1;
% wp=150e3*2*pi;
% ws=120e3*2*pi;
% Lp=83e-6;
% Ls=66e-6;
% Vin=127;


delta_wp= (w^2-wp^2)/w;
delta_ws= (w^2-ws^2)/w;

Zp= 1i*delta_wp*Lp;
Zs= 1i*delta_ws*Ls;
% we can write a matrix equation Ax=b where x is [Ip Is]'
A=[Zp, 1i*w*M1, 1i*w*M2 ; ...
    1i*w*M1, -Zs-RL1, 0 ; ...
    1i*w*M2, 0 , -Zs-RL2];

x= inv(A)*[Vin ;0;0];

Ip=simplify(x(1));
Is1=simplify(x(2));
Is2=simplify(x(3));

pretty(Ip)
pretty(Is1)
pretty(Is2)

[Np,Dp] = numden(Ip);
z1a=angle(Np);
p1a=angle(Dp);

z1m=abs(Np);
p1m=abs(Dp);



[Ns,Ds] = numden(Is1);
z2=solve(Np,w);
p2=solve(Dp,w);


