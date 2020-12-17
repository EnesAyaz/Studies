load('higher_loading.mat');
% load('lower_loading.mat');

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(time,Vout,'LineWidth',2);
plot2 =plot(time,Is1*8,'LineWidth',2);
yline(0,'LineWidth',3,'Color','k','HandleVisibility','off');
set(plot1,'DisplayName','$V_{o}$','Color',[0 0 1]);
set(plot2,'DisplayName','$I_ {o}$','Color',[1 0 0]);
% xlim([4.6e-5 5.84e-5])
xlim([4.66e-5 5.9e-5])
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[4.64e-05 5.9e-05]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',zeros(1,0),'YTick',zeros(1,0));
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.747738203536216 0.828650791834271 0.10 0.07],...
    'Fontsize',12,'Interpreter','latex','EdgeColor','none');
