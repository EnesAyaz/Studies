%% series-series
RL1k=[];
DeltaMx=[];
for DeltaM=0:0.01:1
    DeltaMx=[DeltaMx DeltaM];
    RL1=[];
    wRL=[];
for  w=100:1:200
      w=w/150;
     wRL=[wRL w];
     Rx=1/(2-DeltaM);
     RL1=[RL1 Rx];
end
RL1k=[RL1k ; RL1];
end

%%
figure1=figure();
set(gcf, 'Position',  [100, 100, 600, 300])

axes1 = axes('Parent',figure1);
hold(axes1,'on');
[x,y] = meshgrid(wRL,DeltaMx);
contourf(x,y,abs(RL1k)*100);
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
%%
% Qrx=wo*Ls/RL;
% DeltaM=0.6
% wo=1;
% Qrx=0.988;
% w=180/150;
% k=(2*DeltaM-DeltaM*DeltaM)/4;
% a=(k+1)^2;
% b=(k^2-1)^2;
% c=16*k^2;
% d=(Qrx^2*(w^2-wo^2)^2)/(w^2*wo^2);
% Rx= (a-sqrt(b-(c*d)))/(4*k);
% abs(Rx)
%     



