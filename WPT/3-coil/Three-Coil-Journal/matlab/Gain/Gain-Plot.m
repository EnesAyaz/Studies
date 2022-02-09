opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = "\t";
opts.VariableNames = ["Freq", "Gain"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts = setvaropts(opts, "Gain", "TrimNonNumeric", true);
opts = setvaropts(opts, "Gain", "ThousandsSeparator", ",");
tbl = readtable("D:\Github\Studies\WPT\3-coil\Three-Coil-Journal\matlab\Gain\three_coil_frequency.txt", opts);
Freq = tbl.Freq;
Gain = tbl.Gain;
clear opts tbl

%% 

plot(Freq/1e3,(10.^(Gain/20)));

freq= 100:5:200;
V=[4.3 8.1 14.5 23.1 32 41.45 53.7 72.9 102.5 130.7 121.5 95.4 76.2 63.8 55.7 50.2 46.2 43.2 40.8 38.9 37.3];
% v1=[13.64 14.15 14.85 15.7 16.8 18.5 21.09 24.22 28 31.35 15.75*2 13.88*2 20.61 16.64 14.65 11.8 8.92 5.32 2.97 2.58 2.4];
% V=fliplr(v1)
hold on;
plot(freq,V/100)

%% Analytical model 
Q=[0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2 2.2 2.4 2.6 2.8 3 3.2 3.4 3.6 3.8 4];
Vdc=100;
V=[130 127 125 124 122 121.9 120.9 120 119.25 118.5 117.9 117.2 116.6 116 115.45 114.9 114.4 113.8 113.4 112.9];
V_anal=1.1*ones([1 20]);

V_sim=V/Vdc;

%%
figure1 = figure( 'Position', [0 0 500 200]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


plot(Q,V_sim,'DisplayName','Simulation','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[0 0 1]); 
plot(Q,V_anal,'DisplayName','Analytical','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[1 0 0]); 


% Create ylabel
ylabel('$\frac{V_{out}}{V_{in}}$','Interpreter','Latex','FontSize',18,'FontName','Times');

% Create xlabel
xlabel('$Q_{Rx}$','Interpreter','Latex','FontSize',14,'FontName','Times');

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off')
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'GridColor',[0 0 0],'XTick',...
    0:0.4:4,'YTick',[0  0.2  0.4  0.6  0.8 1  1.2 1.4]);
ylim([0 1.4])
    
legend1 = legend(axes1,'show');

set(legend1,...
    'Position',[0.69426666422526 0.381413963194963 0.204400002441406 0.158500003242493]);