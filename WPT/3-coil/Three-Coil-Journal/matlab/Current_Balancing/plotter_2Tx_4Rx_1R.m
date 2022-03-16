opts = delimitedTextImportOptions("NumVariables", 5);
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";
opts.VariableNames = ["time", "ILs1", "ILs2", "ILs3", "ILs4"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
Data = readtable("D:\Github\Studies\WPT\3-coil\Three-Coil-Journal\matlab\Current_Balancing\three_coil_diode -2Tx-4Rx_balance", opts);
Data = ...
    readtable(...
    "D:\Github\Studies\WPT\3-coil\Three-Coil-Journal\matlab\Current_Balancing\three_coil_diode -2Tx-4Rx_unbalance"...
    , opts);
Data = ...
    readtable(...
    "D:\Github\Studies\WPT\3-coil\Three-Coil-Journal\matlab\Current_Balancing\three_coil_diode-2Tx-1T-4Rx_balanced"...
    , opts);
Data = ...
    readtable(...
    "D:\Github\Studies\WPT\3-coil\Three-Coil-Journal\matlab\Current_Balancing\three_coil_diode-2Tx-1T-4Rx_unbalance"...
    , opts);
clear opts

%%
figure1 = figure('Position', [0 0 300 200]);
axes1 = axes('Parent',figure1,'YTick',[-12 -6  0 6  12]);
set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.5,...
    'XTick',[0 3.5 7 10.5 14],'ZColor',[0 0 0]);
set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.5,...
    'XTick',[2 5.5 9 12.5 16],'ZColor',[0 0 0]);
hold(axes1,'on');
colororder([0 0.447 0.741]);

plot(Data.time*1e6,Data.ILs1,'DisplayName','I_{Rx1}','Color',[1 0 0],'LineWidth',2,'LineStyle','-');
plot(Data.time*1e6,Data.ILs2,'DisplayName','I_{Rx2}','Color',[0 0 1],'LineWidth',2,'LineStyle','-');
plot(Data.time*1e6,Data.ILs3,'DisplayName','I_{Rx3}','LineWidth',2,...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],'LineStyle','-.');
plot(Data.time*1e6,Data.ILs4,'DisplayName','I_{Rx4}','LineWidth',2,'Color',[0.93,0.69,0.13],'LineStyle',':');


ylabel('Current(A)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');
% 
ylim(axes1,[-12 12]);

xlim(axes1,[2 16]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');

% legend1 = legend(axes1,'show');
% set(legend1,...
%     'Position',[0.640069872290127 0.209204405734087 0.146800001068115 0.287666673088074],...
%     'FontSize',14,...
%     'EdgeColor','none');
xlabel('time($\mu s$)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');