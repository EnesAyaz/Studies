load('data_gain_separate_load.mat')

%%
figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
plot(series(:,1),series(:,2))
hold(axes1,'on');
ylabel({'Gain $\frac{V_{out}}{V_{in}}$'},'Interpreter','latex');
xlabel({'Frequency $\frac{f}{f_r}$'},'Interpreter','latex');
box(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15,'XTick',...
    [100000 120000 150000 180000 200000],'XTickLabel',...
    {'0.66','0.8','1','1.2','1.34'});
ylim([-23 2])
grid on;

%%
figure2 = figure('WindowState','maximized');
axes1 = axes('Parent',figure2);
plot(parallel(:,1),parallel(:,2))
hold(axes1,'on');
ylabel({'Gain $\frac{V_{out}}{V_{in}}$'},'Interpreter','latex');
xlabel({'Frequency $\frac{f}{f_r}$'},'Interpreter','latex');
box(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15,'XTick',...
    [100000 120000 150000 180000 200000],'XTickLabel',...
    {'0.66','0.8','1','1.2','1.34'});
ylim([-16 2])
grid on;
