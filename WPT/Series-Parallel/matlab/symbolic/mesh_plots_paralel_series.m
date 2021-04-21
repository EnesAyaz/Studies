%% paralel-series
syms k
syms Zs;
syms RL;
syms RL1;

a= -4*k;
b=2*(1+k)^2*RL;
c=-4*k*Zs^2-(1+k)^2*RL^2;
ans=solve(a*RL1^2+ b*RL1+ c,RL1);
kx=[];

fo=150e3;
wo=2*pi*150e3;
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 64;
M=9.7e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 


RL1k=[];
for k=0.001:0.01:1
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
   w=2*pi*f;
   wRL=[wRL w];
   Zs=abs((1i*w*Ls)/(1-w^2*Cs*Ls));
   Rx= (RL + 2*RL*k + RL*k^2 + (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
   Rx=(RL + 2*RL*k + RL*k^2 - (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
   RL1=[RL1 Rx];
   
end
RL1k=[RL1k ; RL1];
end 

RL1k(RL1k>=64)=64;

% plot(wRL/(2*pi),RL1/32,'LineWidth',3);
% hold on; 
% plot(wRL/(2*pi),(RL-RL1)/32,'--','LineWidth',3);
% hold on;
%%
i=1;
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
subplot(1,2,1);
mesh(y,x,RL1k)
view([0 90])
subplot(1,2,2);
mesh(y,x,64-RL1k)
view([0 90])

