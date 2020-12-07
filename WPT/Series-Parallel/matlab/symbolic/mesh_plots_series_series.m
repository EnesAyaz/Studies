%% series-series
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
Ls=68e-6;
Cs= 1/(wo^2*Ls);
RL= 64;
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
    Rx= (RL + 2*RL*k + RL*k^2 + (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
     Rx=(RL + 2*RL*k + RL*k^2 - (-(- RL*k^2 + 4*Zs*k + RL)*(RL*k^2 + 4*Zs*k - RL))^(1/2))/(4*k);
    RL1=[RL1 Rx];

   
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k>=64)=64;
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
%%
% % Create zlabel
% zlabel({'Normalized Power (P/P_{rated})'});
% 
% % Create ylabel
% ylabel({'Frequency(f/f_r)'},'Rotation',-25);
% 
% % Create xlabel
% xlabel('\frac{\DeltaM}{M}','Interpreter','Latex','FontSize',12,'FontName','Times New Roman','Rotation',15);
% 
% grid on;
% 
% % Set the remaining axes properties
% set(gca,'YTick',[100 125 150 175 200],'YTickLabel',...
%     {'0.60','0.80','1','1.20','1.40'});

