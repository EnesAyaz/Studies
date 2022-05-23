%% ZVS VDS
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
VDS = readtable("G:\My Drive\WPT-Testler\wpt-sic\14022022\C1ZVS_DS00000.dat", opts);
clear opts
%% ZVS ITX
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
ITX = readtable("G:\My Drive\WPT-Testler\wpt-sic\14022022\C2ZVS_itx00000.dat", opts);
clear opts
%% ZVS GS
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
VGS = readtable("G:\My Drive\WPT-Testler\wpt-sic\14022022\C3ZVS_GS00000.dat", opts);
clear opts
%%

figure1=figure('position',[0 0 400 300]);
% yyaxis left;
% plot(ITX.time, ITX.data,'-','Color','k');
yyaxis right;
hold on;
plot(VGS.time, VGS.data,'-','Color','r');
yyaxis left;
hold on;
plot(VDS.time, VDS.data,'-','Color','b');
xlim([-4e-6 7e-6])
grid on;

%%
figure1 = figure;
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.113333333333333 0.775 0.815],...
    'YTick',[-5 -2.5 0 2.5 5 7.5 10 12.5 15]);
hold(axes1,'on');
%%%%%
colororder([0 0.447 0.741]);
yyaxis(axes1,'left');
plot(VDS.time, VDS.data,'Color',[0 0 1]);
ylabel('Vds (V)');
set(axes1,'YColor',[0 0 1],'YTick',[-5 -2.5 0 2.5 5 7.5 10 12.5 15]);
%%%%%
yyaxis(axes1,'right');
plot(VGS.time, VGS.data,'Color',[1 0 0]);
ylabel('Vgs (V)');
set(axes1,'YColor',[1 0 0],'YTick',[-10 -5 0 5 10 15 20 25]);
xlabel({'Time ($\mu s$)'},'FontSize',16,'Interpreter','latex');

grid(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
    'GridColor',[0 0 0],'XTickLabel',{'0','2','4','6','8','10'});
% 
xlim([-4e-6 7e-6])


% xlim([-0.1e-6 0.5e-6])

%%
figure1 = figure;
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.113333333333333 0.775 0.815],...
    'YTick',[-5 -2.5 0 2.5 5 7.5 10 12.5 15]);
hold(axes1,'on');
%%%%%
colororder([0 0.447 0.741]);
yyaxis(axes1,'left');
plot(VDS.time*1e6, VDS.data,'Color',[0 0 1]);
ylabel('Vds (V)');
set(axes1,'YColor',[0 0 1],'YTick',[-5 -2.5 0 2.5 5 7.5 10 12.5 15]);
%%%%%
yyaxis(axes1,'right');
plot(VGS.time*1e6, VGS.data,'Color',[1 0 0]);
ylabel('Vgs (V)');
set(axes1,'YColor',[1 0 0],'YTick',[-10 -5 0 5 10 15 20 25]);
xlabel({'Time ($\mu s$)'},'FontSize',16,'Interpreter','latex');

grid(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
    'GridColor',[0 0 0],'XTickLabel',{'4','4.1','4.2','4.3','4.4','4.5' });
% 
xlim([0 0.5])


% xlim([-0.1e-6 0.5e-6])


%% Waveforms 

%% VFB IRES Itx
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
VFB = readtable("G:\My Drive\WPT-Testler\wpt-sic\15022022\C1VFB00000.dat", opts);
clear opts
%
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
Ires = readtable("G:\My Drive\WPT-Testler\wpt-sic\15022022\C2IRES00000.dat", opts);
clear opts
%
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
Itx = readtable("G:\My Drive\WPT-Testler\wpt-sic\15022022\C3ITX00000.dat", opts);
clear opts

%%


figure1 = figure('Position',[0 0 600 500]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
%%%%%
colororder([0 0.447 0.741]);
yyaxis(axes1,'right');
plot(VFB.time, VFB.data,'Color',[0 0 1],'LineWidth',1);
ylabel('$V_{FB}$ (V)','Interpreter','latex');
set(axes1,'YColor',[0 0 1]);
%%%%%
yyaxis(axes1,'left');
plot(Itx.time, Itx.data*10,'-','Color',[1 0 0],'LineWidth',1);
hold on;
plot(Ires.time, Ires.data*10,':','Color',[1 0 0],'LineWidth',2);
ylabel(' $I_{Tx}$ / $I_{Res}$ (A)','Interpreter','latex');
set(axes1,'YColor',[1 0 0]);
xlabel({'Time ($\mu s$)'},'FontSize',16,'Interpreter','latex');
legend('Tx','Resanotor','Interpreter','latex',...
    'FontSize',14,...
    'EdgeColor','none',...
    'Color','none')

grid(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.4,...
    'GridColor',[0 0 0],'XTickLabel',{'0','2','4','6','8','10','12','14'});

xlim([-6e-6 8e-6])

%%

%% Irxs
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
Irx1 = readtable("G:\My Drive\WPT-Testler\wpt-sic\15022022\C2Irx100000.dat", opts);
clear opts
%
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
Irx2 = readtable("G:\My Drive\WPT-Testler\wpt-sic\15022022\C3Irx200000.dat", opts);
clear opts
%
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
Irx3 = readtable("G:\My Drive\WPT-Testler\wpt-sic\15022022\C3Irx300000.dat", opts);
clear opts
%
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
Irx4 = readtable("G:\My Drive\WPT-Testler\wpt-sic\15022022\C2Irx400000.dat", opts);
clear opts
%%

figure1 = figure('Position',[0 0 600 500]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
%%%%%
% colororder([0 0.447 0.741]);

plot(Irx1.time, Irx1.data*10,'-','Color',[1 0 0],'LineWidth',2);
hold on;
plot(Irx2.time, Irx2.data*10,'-','Color',[0 0 1],'LineWidth',1);
hold on;
plot(Irx3.time, -Irx3.data*10,'-','Color',[1 0 1],'LineWidth',1);
hold on;
plot(Irx4.time, -Irx4.data*10,'-','Color',[0 0 0],'LineWidth',2);

ylabel(' $I_{Rx}$ (A)','Interpreter','latex');
set(axes1,'YColor',[0 0 0],'YTick',[-5 -2.5 0 2.5 5]);
xlabel({'Time ($\mu s$)'},'FontSize',16,'Interpreter','latex');
legend('$I_{Rx1}$','$I_{Rx2}$','$I_{Rx3}$','$I_{Rx4}$','Interpreter','latex',...
    'FontSize',14,...
    'EdgeColor','none',...
    'Color','none')

grid(axes1,'on');
hold(axes1,'off');
box(axes1,'on');
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.4,...
    'GridColor',[0 0 0],'XTickLabel',{'0','2','4','6','8','10','12','14'});

xlim([-6e-6 8e-6])
