
kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Qrx=1.00;
for k=0:0.001:1
 DeltaMx=[DeltaMx 1-(sqrt(4-4*k)/2)];
 kx=[kx k];
 RL1=[];
 wRL=[];
for  w=0.667*wo:0.001:1.33*wo
    a=(k+1)^2;
    b=(k^2-1)^2;
    c=16*k^2;
    d=(Qrx^2*(w^2-wo^2)^2)/(w^2*wo^2);
 
    Rx= (a-sqrt(b-(c*d)))/(4*k);
    
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k>=1)=1;

figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

[x,y] = meshgrid(wRL,DeltaMx);
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


%%
Qrx=wo*Ls/RL;
DeltaM=0.2;
wo=1;
Qrx=0.988;
w=180/150;
k=(2*DeltaM-DeltaM*DeltaM)
a=(k+1)^2;
b=(k^2-1)^2;
c=16*k^2;
d=(Qrx^2*(w^2-wo^2)^2)/(w^2*wo^2);
Rx= (a-sqrt(b-(c*d)))/(4*k)
if Rx>1
    Rx=1
end

    



