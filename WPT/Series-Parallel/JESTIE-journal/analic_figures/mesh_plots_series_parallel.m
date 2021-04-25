kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Qrx=4;
for DeltaM=0:0.01:1
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for w=0.667*wo:0.01:1.33*wo
    a=(Qrx*(w^2-wo^2))/(w*wo);
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


%%

figure1=figure();
set(gcf, 'Position',  [100, 100, 600, 300])

axes1 = axes('Parent',figure1);
hold(axes1,'on');
[x,y] = meshgrid(wRL,DeltaMx);
contourf(x,y,100./abs(RL1k));
hold on;

xlabel('Normalized Frequency($f_r$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel({'$ \frac{\Delta M}{M_{(1)}}$'},'Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',18)
set(axes1,'XTick',[0.7 0.8 0.9 1 1.1 1.2 1.3],'YTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
colormap('jet');
% Create colorbar
colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
    'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
    'Limits',[50 100],...
    'FontSize',12,...
    'FontName','Times New Roman');

% Create textbox
annotation(figure1,'textbox',...
    [0.794659804983763 0.00162188485637581 0.210417881816656 0.136059148058712],...
    'Color',[1 0 0],...
    'String',{'$\%\frac{P_{(1)}}{P_{(1)}+P_{(2)}}100$'},...
    'Interpreter','latex',...
    'FontWeight','bold',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FontAngle','italic',...
    'FitBoxToText','off',...
    'EdgeColor','none');