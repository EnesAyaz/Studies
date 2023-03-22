% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 4);
% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";
% Specify column names and types
opts.VariableNames = ["time", "ID12", "ILs1", "ILs2"];
opts.VariableTypes = ["double", "double", "double", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
tbl = readtable("D:\Github\Studies\WPT\Power-Sharing\LTSpice\Fault-Short\3_case.txt", opts);

% Convert to output type
time = tbl.time;
ID12 = tbl.ID12;
ILs1 = tbl.ILs1;
ILs2 = tbl.ILs2;
% Clear temporary variables
clear opts tbl
           
%%
figure1 = figure('Position',[0 0 800 400]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot1 = plot(time*1e3,ID12);
plot2 = plot(time*1e3,ILs1);
plot3 = plot(time*1e3,ILs2);
set(plot1,'DisplayName','I_{C}','LineWidth',1,'LineStyle','-',...
    'Color',[1 0 0]);
set(plot2,'DisplayName','I_{RX1}','LineWidth',1,'LineStyle','-',...
    'Color',[ 0 1 0]);
set(plot3,'DisplayName','I_{RX2}','LineWidth',1,'LineStyle',':',...
    'Color',[0 0 1]);

% Create ylabel
ylabel({'Current (A)'});

% Create xlabel
xlabel({'Time (ms)'});

%ylim(axes1,[-6 6]);
xlim(axes1, [0 0.6])
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
    'MinorGridAlpha',0.5,'XGrid','on','XMinorGrid','on',...
    'YGrid','on','YMinorGrid','on');
% set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
%     'MinorGridAlpha',0.5,'XGrid','on','XMinorGrid','on','XTick',...
%     [0 3.14 6.28 9.42 12.56],'XTickLabel',{'0','Ts/2','Ts','3Ts/2','2Ts'},...
%     'YGrid','on','YMinorGrid','on','YTick',[-6 -3 0 3 6]);
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'EdgeColor','None',...
    'FontSize','10');
%%

% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["time1", "Vrx1", "Vrx2", "IC"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("D:\Github\Studies\WPT\Power-Sharing\LTSpice\Fault-Short\short.txt", opts);

% Convert to output type
time = tbl.time1;
Vrx1 = tbl.Vrx1;
Vrx2 = tbl.Vrx2;
IC = tbl.IC;

% Clear temporary variables
clear opts tbl

%%

%%
figure1 = figure('Position',[0 0 800 400]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
yyaxis right;
plot1 = plot(time*1e3,IC);
yyaxis left;
plot2 = plot(time*1e3,Vrx1);
plot3 = plot(time*1e3,Vrx2);
set(plot1,'DisplayName','I_{C}','LineWidth',1,'LineStyle','-',...
    'Color',[1 0 0]);
set(plot2,'DisplayName','V_{RX1}','LineWidth',1,'LineStyle','-',...
    'Color',[ 0 1 0]);
set(plot3,'DisplayName','V_{RX2}','LineWidth',1,'LineStyle',':',...
    'Color',[0 0 1]);

% Create ylabel
ylabel({'Current (A)'});

% Create xlabel
xlabel({'Time (ms)'});

%ylim(axes1,[-6 6]);
xlim(axes1, [0 0.5])
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
    'MinorGridAlpha',0.5,'XGrid','on','XMinorGrid','on',...
    'YGrid','on','YMinorGrid','on');
% set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
%     'MinorGridAlpha',0.5,'XGrid','on','XMinorGrid','on','XTick',...
%     [0 3.14 6.28 9.42 12.56],'XTickLabel',{'0','Ts/2','Ts','3Ts/2','2Ts'},...
%     'YGrid','on','YMinorGrid','on','YTick',[-6 -3 0 3 6]);
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'EdgeColor','None',...
    'FontSize','10');

%%
figure1 =  figure('Position',[0 0 800 400]);
% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.153166662792365 0.775 0.774333337207635]);
hold(axes1,'on');
colororder([0.85 0.325 0.098]);
% Activate the left side of the axes
yyaxis(axes1,'left');
% Create plot
plot(time*1e3,Vrx1,'DisplayName','V_{RX1}','LineWidth',1,'Color',[0 1 0]);
% Create plot
plot(time*1e3,Vrx2,'DisplayName','V_{RX2}','LineWidth',1,'LineStyle',':',...
    'Color',[0 0 1]);
% Create ylabel
ylabel({'Voltage (V)'},'FontName','Times New Roman');
% Set the remaining axes properties
set(axes1,'YColor',[0 0 0]);
% Activate the right side of the axes
yyaxis(axes1,'right');
% Create plot
ylim([0 15])
plot(time*1e3,IC,'DisplayName','I_{C}','Color',[1 0 0]);
% Create ylabel
ylabel({'Current (A)'});
% Set the remaining axes properties
set(axes1,'YColor',[1 0 0]);
% Create xlabel
xlabel({'Time (ms)'},'FontName','Times New Roman');
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0 0.5]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
    'MinorGridAlpha',0.5,'XGrid','on','XMinorGrid','on','YGrid','on',...
    'YMinorGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.748824423287491 0.650612388473624 0.117499998398125 0.237499993294477],...
    'EdgeColor','none');


