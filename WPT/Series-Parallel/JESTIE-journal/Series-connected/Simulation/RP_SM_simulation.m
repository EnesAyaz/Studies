%% series-parallel
fig = openfig('parallel_series_simulation_detailed.fig');
axObjs = fig.Children;
dataObjs = axObjs.Children;
x_fig = dataObjs(1).XData;
y_fig = dataObjs(1).YData;
z_fig = dataObjs(1).ZData;
Mx=y_fig(:,1);
fx=x_fig(1,:)*150e3;
Pratio=z_fig;

%%
z_fig(z_fig>97)=100;
figure1=figure();
set(gcf, 'Position',  [100, 100, 600, 300])

axes1 = axes('Parent',figure1);
hold(axes1,'on');
contourf(x_fig,y_fig,z_fig);
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