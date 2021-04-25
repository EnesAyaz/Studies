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

% DeltaM=0:0.01:1

RL1k=[];
DeltaMx=[];
for DeltaM=0:0.01:1
 DeltaMx=[DeltaMx, DeltaM];
 k=(2*DeltaM-DeltaM*DeltaM)/4;
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

%%
figure();
[x,y] = meshgrid(wRL/2000/pi,DeltaMx);
contour(x,y,RL1k/64);

%%
%%
% Ls=22e-6;
% RL= 64;
% wo=2*pi*150e3;
% Qrx=RL/(wo*Ls);
%%
kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Qrx=3.0866;
Qrx=6.0866;
for DeltaM=0:0.001:1
 DeltaMx=[DeltaMx, DeltaM];
 k=(2*DeltaM-DeltaM*DeltaM)/4;
 kx=[kx k];
 RL1=[];
 wRL=[];
for  w=0.667*wo:0.001:1.33*wo
    a=(k+1)^2;
    b=(k^2-1)^2;
    c=16*k^2;
    d=(Qrx^2*(w^2-wo^2)^2)/(w^2*wo^2);
 
    Rx= (a-sqrt(b-(c/d)))/(4*k);
    
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k>=1)=1;

figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

[x,y] = meshgrid(wRL,kx);
contourf(x,y,abs(RL1k)*100);
hold on;

xlabel('Normalized Frequency','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel('Normalized Mutual Difference ($ \frac{\Delta M}{M_1}$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)
colormap('jet');
% Create colorbar
colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
    'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
    'Limits',[50 100],...
    'FontSize',12,...
    'FontName','Times New Roman');
% colorbar.Title.String='Percentage(%)'
