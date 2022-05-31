syms w M1 M2 RL Zp Zr Zs Is Ip Ir 

% syms Lp Ls Lr wo dw


% A= w^2*M1*M2*RL/(Zs*(Zp*Zr+w^2*M1^2+w^2*M2^2*Zp/Zs));
% (-Zp*Zr*Zs*(Zs*M1^2 + Zp*M2^2))^(1/2)/(Zs*M1^2 + Zp*M2^2)

%%
A= [Zp 1i*w*M1 0 ; ...
   1i*w*M1 -Zr -1i*w*M2 ; ...
   0 1i*w*M2 -Zs ; ...
    ];

I=inv(A)*[1 ; 0 ;0 ]

I(1)
%%
(Zp*Zr*Zs*(Zs*M1^2 + Zp*M2^2))^(1/2)/(Zs*M1^2 + Zp*M2^2);
%%
w0=150*2*pi*1e3;

%%
Qrx=2;
RL=10;
Ls=Qrx*RL/w0
Cs=1/(w0^2*Ls);
Zs=1i*w*Ls+ 1/(1i*w*Cs) +RL;
%%
k2=0.4;
M2=17e-6;
Lr=M2^2/(k2^2*Ls);
Cr=1/(w0^2*Lr);
Zr=1i*w*Lr+ 1/(1i*w*Cr);
%%
k1=0.4;
M1=15.4e-6;
Lp=M1^2/(k1^2*Lr)
Cp=1/(w0^2*Lp);
Zp=1i*w*Lp+ 1/(1i*w*Cp);
%%
A= [Zp 1i*w*M1 0 ; ...
   1i*w*M1 -Zr -1i*w*M2 ; ...
   0 1i*w*M2 -Zs ; ...
    ];

I=inv(A)*[1 ; 0 ;0 ]

Xin=[];
for i=100:1:200
    w=2*pi*1*i*1e3;
    Zs=1i*w*Ls+ 1/(1i*w*Cs) +RL;
    Zr=1i*w*Lr+ 1/(1i*w*Cr);
    Zp=1i*w*Lp+ 1/(1i*w*Cp);
    
    A= [Zp 1i*w*M1 0 ; ...
   1i*w*M1 -Zr -1i*w*M2 ; ...
   0 1i*w*M2 -Zs ; ...
    ];

   I=inv(A)*[1 ; 0 ;0 ];
    Xin=[Xin phase(1/I(1))];
end
% pole= poles(1/I(1),w)
%%
plot(Xin)

% plot(pole,'o')
hold on;


