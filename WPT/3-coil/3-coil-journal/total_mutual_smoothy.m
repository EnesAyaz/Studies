numberOfModules=10;

modules=1:1:numberOfModules;
power_rating=ones(1,length(modules));

power_rating_single_fault = ((modules(1:end-1)./modules(2:end))).^2;


figure2=figure();
yyaxis left 

fitx=linspace(2,10,1000);
fity = interp1(modules(2:end),power_rating_single_fault,fitx,'spline');

plot(modules(2:end),power_rating_single_fault,'LineStyle','None','Marker','x', ...
    'MarkerSize',10,'Color','b','LineWidth',2);
hold on;
plot(fitx,fity,'LineStyle','-','Color','b','LineWidth',2);
hold on;

plot(modules(1:end),power_rating,'LineStyle','-','Marker','o', ...
    'MarkerSize',5,'Color','b','Linewidth',2);
ylim([0 1.2])
set(gca,'ycolor','b') 
ylabel({'Rated Power(p.u)'},'Color','b','Interpreter','Latex',...
    'FontName','Times New Roman','FontSize',20,'FontWeight','Bold')

hold on;
yyaxis right

fitx=linspace(2,10,1000);
fity = interp1(modules(2:end),100*sqrt(1./power_rating_single_fault),fitx,'spline');


plot(modules(2:end),100*sqrt(1./power_rating_single_fault),'LineStyle','None','Marker','x', ...
    'MarkerSize',10,'Color','r','Linewidth',2);
hold on;
plot(fitx,fity,'LineStyle','-','Color','r','LineWidth',2);
hold on;

ylabel('Overdesign Rating($\%$)','Color','r','Interpreter','Latex',...
    'FontName','Times New Roman','FontSize',20,'FontWeight','Bold')
set(gca,'ycolor','r','XTick',[1 2 3 4 5 6 7 8 9 10]) 


xlabel('Number of Modules','Color','k','Interpreter','Latex',...
    'FontName','Times New Roman','FontSize',20,'FontWeight','Bold')
xlim([1 numberOfModules])
set(gca, 'FontSize', 12)
annotation(figure2,'textarrow',[0.560509554140128 0.563057324840765],...
    [0.86940618955513 0.810444874274662],'String',{'No-Fault Power Transfer'},...
    'FontSize',14,...
    'FontName','Times New Roman');

% Create textarrow
annotation(figure2,'textarrow',[0.638853503184716 0.62547770700637],...
    [0.526079303675056 0.588007736943907],...
    'String',{'Single-Rx Fault', 'Power Transfer'},...
    'FontSize',14,...
    'FontName','Times New Roman','HorizontalAlignment','center');

% Create textarrow
annotation(figure2,'textarrow',[0.501428571428571 0.500636942675159],...
    [0.237142857142857 0.321083172147002],...
    'String',{'Overdesign Rating of Each Module'},...
    'FontSize',14,...
    'FontName','Times New Roman');

