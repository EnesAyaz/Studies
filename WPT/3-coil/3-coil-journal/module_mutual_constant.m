numberOfModules=10;

modules=1:numberOfModules;
power_rating=modules.^2;

power_rating_single_fault =power_rating(1:end-1) ;

% plot(modules,power_rating);

figure1=figure();
yyaxis left 
plot(modules(2:end),power_rating_single_fault,'LineStyle','-','Marker','x', ...
    'MarkerSize',10,'Color','b','Linewidth',2);
hold on;
plot(modules(1:end),power_rating,'LineStyle','-','Marker','o', ...
    'MarkerSize',5,'Color','b','Linewidth',2);
set(gca,'ycolor','b') 
ylabel({'Power Rating'},'Color','b','Interpreter','Latex',...
    'FontName','Times New Roman','FontSize',20,'FontWeight','Bold')

hold on;
yyaxis right
plot(modules(2:end),(modules(2:end)./modules(1:end-1)),'LineStyle','-','Marker','None', ...
    'MarkerSize',10,'Color','r','Linewidth',2);
ylabel('Overdesign Rating','Color','r','Interpreter','Latex',...
    'FontName','Times New Roman','FontSize',20,'FontWeight','Bold')
set(gca,'ycolor','r') 


xlabel('Number of Modules','Color','k','Interpreter','Latex',...
    'FontName','Times New Roman','FontSize',20,'FontWeight','Bold')
set(gca, 'FontSize', 16)

