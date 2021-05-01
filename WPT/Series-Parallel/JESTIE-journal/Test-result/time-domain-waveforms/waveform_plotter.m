%% DeltaM 018 RS-MP
folder_path="D:\Github\Studies\WPT\Series-Parallel\JESTIE-journal\Test-result\time-domain-waveforms\2021.04.29-commonDCbus\SeriesCompensated-Parallelmodule\deltaM0.18";
data_name="\C1Is100000.dat";
Is1=data_reader(folder_path,data_name);
data_name="\C3Is200000.dat";
Is2=data_reader(folder_path,data_name);
data_name="\C4Itx00000.dat";
Itx=data_reader(folder_path,data_name);
clear data_name folder_path

figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gcf, 'Position',  [100, 100, 700, 300])
plot1=plot(Is1.time*1e6,Is1.data,'LineWidth',1.5);
set(plot1,'DisplayName','Module-2','Color',[1 0 0]);
hold on;
plot2=plot(Is2.time*1e6,-Is2.data,'LineWidth',1.5);
set(plot2,'DisplayName','Module-1','Color',[0 0 1]);
xlim([0 14])
ylim([-2 2])
xlabel('Time($\mu s$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');
ylabel('Current($A$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');
hold(axes1,'off');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',12,'FontName','Times New Roman','EdgeColor','none',...
    'Color','none',...
    'Location','best');
%%

%% DeltaM 040 RS-MP
folder_path="D:\Github\Studies\WPT\Series-Parallel\JESTIE-journal\Test-result\time-domain-waveforms\2021.04.29-commonDCbus\SeriesCompensated-Parallelmodule\deltaM04";
data_name="\C1is100000.dat";
Is1=data_reader(folder_path,data_name);
data_name="\C3is200000.dat";
Is2=data_reader(folder_path,data_name);
data_name="\C4itx00000.dat";
Itx=data_reader(folder_path,data_name);
clear data_name folder_path

figure2=figure();
axes1 = axes('Parent',figure2);
hold(axes1,'on');
set(gcf, 'Position',  [100, 100, 700, 300])
plot1=plot(Is1.time*1e6,Is1.data,'LineWidth',1.5);
set(plot1,'DisplayName','Module-2','Color',[1 0 0]);
hold on;
plot2=plot(Is2.time*1e6,-Is2.data,'LineWidth',1.5);
set(plot2,'DisplayName','Module-1','Color',[0 0 1]);
xlim([0 14])
ylim([-2 2])
xlabel('Time($\mu s$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');
ylabel('Current($A$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');
hold(axes1,'off');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',12,'FontName','Times New Roman','EdgeColor','none',...
    'Color','none',...
    'Location','best');
