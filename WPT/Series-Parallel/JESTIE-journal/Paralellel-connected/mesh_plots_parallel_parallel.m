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
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=9.7e-6; %% bu yüzden mutual? indirdim primer ak?m gereksinimi artt? 

RL1k=[];
for DeltaM=0:0.01:1
 k=1-DeltaM;
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
RL1k(isnan(RL1k))=32;

%%
figure();
DeltaM=0:0.01:1;
[x,y] = meshgrid(wRL/2000/pi,DeltaM);
contourf(x,y,16./RL1k);


%%
%%
kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Qrx=0.7717;
Qrx=2;
for DeltaM=0:0.01:1
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for w=0.667*wo:0.01:1.33*wo
    a=(w*wo)/(Qrx*(w^2-wo^2));
    b=(1-k^2);
    c=1/((b/a^2)+1);
    d=k^2- (((1-k^2)^2)/a^2);
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;


% figure();
% DeltaM=0:0.01:1;
% [x,y] = meshgrid(wRL/2000/pi,DeltaM);
% contourf(x,y,1./RL1k);


figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

[x,y] = meshgrid(wRL,DeltaMx);
contourf(x,y,100./abs(RL1k));
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


