%%
load('misalign_series_series.mat')
% load('align_series_series.mat')

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1 = plot(time,Vs1,'LineWidth',3);
plot2 = plot(time,Vs2,'LineWidth',3);
set(plot1,'Color',[1 0 0]);
set(plot2,'Color',[0 0 1]);
plot3=plot(time,Vout,'LineWidth',3);
set(plot3,'Color',[0 0 0]);

ylabel({'Voltage (V)'},'FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');
% Create xlabel
xlabel({'Time ($\mu$sec)'},'FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');
xlim(axes1,[0.009980 0.01]);
ylim([-250 250])
box(axes1,'on');
hold(axes1,'off');
set(axes1,'XTick',...
    [0.009982 0.009984 0.009986 0.009988 0.00999 0.009992 0.009994 0.009996 0.009998 0.01],...
    'XTickLabel',...
    {'0','2','4','6','8','10','12','14','16','18'});
legend ('Receiver-1','Receiver-2','Output Voltage','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex')
%%

load('align_series_paralel.mat')
% load('align_series_series.mat')

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
yyaxis left;
plot1 = plot(time,ILs1,'LineWidth',3);
plot2 = plot(time,ILs2,'--','LineWidth',3);
set(plot1,'Color',[1 0 0]);
set(plot2,'Color',[0 0 1]);
set(axes1,'YColor',[0 0 0]);
ylabel({'Current(A)'},'FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');
ylim([-10 10])
yyaxis right;
plot3=plot(time,Vout,'LineWidth',3);
set(plot3,'Color',[0 0 0]);
set(axes1,'YColor',[0 0 0]);

ylabel({'Voltage (V)'},'FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');
% Create xlabel
xlabel({'Time ($\mu$sec)'},'FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');
xlim(axes1,[0.009980 0.01]);
ylim([0 150])
box(axes1,'on');
hold(axes1,'off');
set(axes1,'XTick',...
    [0.009982 0.009984 0.009986 0.009988 0.00999 0.009992 0.009994 0.009996 0.009998 0.01],...
    'XTickLabel',...
    {'0','2','4','6','8','10','12','14','16','18'});
legend ('Receiver-1','Receiver-2','Output Voltage','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex')
