figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(t*1000,C1,'color','r','Linewidth',2)
hold on;
plot(t*1000,C2,'color','b','Linewidth',2)
hold on;
plot(t*1000,C1+C2,'color','k','Linewidth',2)
hold on;
xlim([100 200])
ylim([0 1400])
% Create ylabel
ylabel({'Voltage (V4+)'},'FontSize',14,'FontName','Times New Roman');
% Create xlabel
xlabel('Time ($m$s)','FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
hold(axes1,'off');
% Set the remaining axes properties
% set(axes1,'FontName','Times New Roman','XTickLabel',...
%     {'0','','20','','40','','60','','80','','100'});