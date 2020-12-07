syms k
syms Zs;
syms RL;
syms RL1;

a= (k^2-1)*RL^2-Zs^2;
b=2*RL*Zs^2;
c=(k^2-1)*RL^2*Zs^2;

ans=solve(a*RL1^2+ b*RL1+ c,RL1);
kx=[];

fo=150e3;
wo=2*pi*150e3;
Ls=68e-6;
Cs= 1/(wo^2*Ls);
RL= 16;
M=17e-6; 


RL1k=[];
for k=0.00001:0.01:1
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
    w=2*pi*f;
   wRL=[wRL w];
    Zs=abs(1i*w*Ls+1./(1i*w*Cs));
     Rx=  (RL*Zs^2 + RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
%  Rx= (RL*Zs^2 - RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
 
    RL1=[RL1 Rx];

   
end
RL1k=[RL1k ; RL1];
end

RL1k(RL1k<16)=16;

%%



for i=1:length(kx)
plot3(kx(i)*ones(size(wRL)),wRL/2000/pi,RL1k(i,:))
hold on;

end
%%
% RL1k(RL1k==64)=NaN;
% i=1;
% for i=1:length(kx)
% plot3(kx(i)*ones(size(wRL)),wRL/2000/pi,RL1k(i,:))
% hold on;
% 
% end

%%

[x,y] = meshgrid(wRL/2000/pi,kx);
mesh(y,x,RL1k)
