opts = delimitedTextImportOptions("NumVariables", 4);
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";
opts.VariableNames = ["time","ILp2","ILr","ILs1"];
opts.VariableTypes = ["double", "double","double","double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
tbl = readtable("D:\Github\Studies\WPT\3-coil\Three-Coil-Journal\matlab\3rd-harmonic\three_coil_diode.txt", opts);
time = tbl.time;
ILs = tbl.ILs1;
ILp = tbl.ILp2;
ILr = tbl.ILr;
clear opts tbl

%%
figure1 = figure('Position',[0 0 600 150]);

axes1 = axes('Parent',figure1,'FontName','Times New Roman','FontSize',12);
hold(axes1,'on');
% plot(time*1e6,ILp,'DisplayName','$I_{Tx}$','Color',"b",'LineWidth',1);
% plot(time*1e6,ILr,'DisplayName','$I_r$','Color',"r",'LineWidth',1);
plot(time*1e6,ILs,'DisplayName','$I_{Rx}$','Color',[0 0.5 0],'LineWidth',1);
xlim([20.4 60.2])

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','GridAlpha',0.4,'YTick',[-10 -5 0 5 10]);

% set(axes1,'FontName','Times New Roman','FontSize',12,'GridAlpha',0.4,...
%     'XTick',zeros(1,0),'YTick',[-10 -5 0 5 10]);
% plot(time,ILr,'DisplayName','k_c (Simulation)','Color',"b",'LineWidth',1);
% plot(time,ILs,'DisplayName','k_c (Simulation)','Color',"b",'LineWidth',1);
% ylabel({'Current(A)'},'Interpreter','Latex','FontSize',16);
xlabel({'Time( $\mu s$)'},'Interpreter','Latex','FontSize',16);
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.777888903182422 0.744626757717154 0.117000000762939 0.149732623253276],...
    'Interpreter','latex',...
    'FontSize',12);
