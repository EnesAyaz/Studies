syms k
syms Zs;
syms RL;
syms RL1;

a= (k^2-1)*RL^2-Zs^2;
b=2*RL*Zs^2;
c=(k^2-1)*RL^2*Zs^2;

ans=solve(a*RL1^2+ b*RL1+ c,RL1);
kx=[];
%%
fo=150e3;
wo=2*pi*150e3;
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=9.7e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 

RL1k=[];
for k=0.00001:0.01:1
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
    w=2*pi*f;
    wRL=[wRL w];
    Zs=abs((1i*w*Ls)/(1-w^2*Cs*Ls));
    Rx=  (RL*Zs^2 + RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
%  Rx= (RL*Zs^2 - RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
 
 
    RL1=[RL1 Rx];

   
end
RL1k=[RL1k ; RL1];
end


RL1k(RL1k<16)=16;
% RL1k(isnan(RL1k))=16;

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
figure();
subplot(3,1,1);
[x,y] = meshgrid(wRL/2000/pi,1-kx);
mesh(y,x,1./RL1k)
hold on;
subplot(3,1,2);
RL2k=(1/RL)-(1./RL1k);
mesh(y,x,RL2k)
subplot(3,1,3);
RL2k=1./RL2k;
RL2k.*(1-kx).^2

mesh(y,x,ones(size(RL1k))./16)



%%



