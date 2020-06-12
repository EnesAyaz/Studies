syms w;
syms ws;
syms Ls;
syms M1;
syms M2;
syms RL1;
syms RL2;
syms Ip;


delta_ws= (w^2-ws^2)/w;

Zs= 1i*delta_ws*Ls;

A= [1i*delta_ws*Ls+RL1, 0 ; ...
    0 , 1i*delta_ws*Ls+RL2];

B=[1i*w*M1*Ip; 1i*w*M2*Ip];

x= inv(A)*B;

Is1=simplify(x(1));
Is2=simplify(x(2));
pretty(Is1)
pretty(Is2)

% abs(Is1);
% abs(Is2);

%%
syms RL2;
syms RL1; 
syms M1;
syms M2;
syms RL;
syms w;
syms ws;
syms Ls;
syms Ip;

% w=ws;


% RL2=(RL1*RL)/(RL1-RL);

n1=RL1*Ip*M1^2;
d1=RL2*Ip*M2^2; 
n2=sqrt((RL1^2*w^2+ Ls^2*(w^2-ws^2)^2));
d2=sqrt((RL2^2*w^2+ Ls^2*(w^2-ws^2)^2));

x=n1*d2-n2*d1;


pretty(simplify(x));
%%

w=2*pi*150e3;
ws=2*pi*100e3:2*pi*5e3:2*pi*200e3;
Ls=66e-6;
RL2=20;
Q=8;
RL2=w*Ls/Q;
L=[];
R=[];
for i= 1:length(ws)
L= [ L (w^2-ws(i)^2)^2*Ls^2 ];
R=  [R RL2^2*w^2 ];

end

figure;
plot(ws/(2000*pi),L);
hold on;
plot(ws/(2000*pi),R)
hold on; 


legend('Inductive Part','Resistive Part');


figure();

plot(ws/(2000*pi),L./R);
