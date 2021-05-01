figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gcf, 'Position',  [100, 100, 700, 300])

frequency=[100 105 110 115 120 125 130 135 140 145 ...
    150 155 160 165 170 175 180 185 190 195 200];
V1=[2.9 3.34 3.83 4.32 4.90 5.48 5.8 6.05 6.38 6.56 ...
    6.54 6.3 6.4 6.5 6.22 5.95 5.97 5.91 5.65 5.35 5.35];
V2=[2.27 2.6 3.05 3.51 4 4.5 4.75 4.87 5.09 5.3 5.28 ...
    5.12 5.14 5.22 4.92 4.65 4.72 4.73 4.52 4.35 4.42];

plot1=stem(frequency,V1./(V1+V2),'LineStyle','none');
set(plot1,'DisplayName','Experiment','Marker', ...
    'square','LineWidth',1,'Color',[1 0 0],'MarkerSize',8);
hold on;
M1=3.93e-6; %  3.0711e-06
M2=3e-6;
(M1-M2)/M1
M1/(M1+M2);
yline(M1/(M1+M2),'DisplayName','Mathematical model','Parent',axes1,...
    'Alpha',0.5,...
    'Color',[1 0 0],...
    'LineWidth',1);

hold on;
%%
k=V1./(V1+V2);
k2=M1/(M1+M2);
e=100*sum(abs(k-k2)./k)/length(k)

%%
frequency=[100 105 110 115 120 125 130 135 140 145 150 155 ...
    160 165 170 175 180 185 190 195 200];
V1=[3.25 3.67 4.09 4.5 5.04 5.6 5.91 6.2 6.59 6.75 ...
    6.7 6.5 6.62 6.75 6.53 6.3 6.24 6.18 5.97 5.65 5.67];
V2=[1.62 1.91 2.35 2.83 3.32 3.72 3.96 4.01 4.12 ...
    4.35 4.33 4.2 4.22 4.24 3.92 3.78 3.87 3.85 3.64 3.61 3.62];


plot3=stem(frequency,V1./(V1+V2),'LineStyle','none');
set(plot3,'DisplayName','Experiment','Marker', ...
    'x','LineWidth',1,'Color',[0 0 1],'MarkerSize',8);
hold on;

M1=4.13e-6; %  3.0711e-06
M2=2.45e-6;
M1/(M1+M2);
(M1-M2)/M1
yline(M1/(M1+M2),'DisplayName','Mathematical model','Parent',axes1, ...
    'Alpha',0.5,...
    'Color',[0 0 1],...
    'LineWidth',1);
ylim([0 1])
%%
k=V1./(V1+V2);
k2=M1/(M1+M2);
e=100*sum(abs(k-k2)./k)/length(k)
%%
xlabel('Frequency($kHz$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');
ylabel('Power Distribution ($\frac{P_1}{P_1+P_2}$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');

hold(axes1,'off');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','southeast','FontSize',12,...
    'FontName','Times New Roman',...
    'EdgeColor','none',...
    'Color','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.493 0.221333333333334 0.0538571428571429 0.0893333333333335],...
    'Color',[0 0 1],...
    'String','$\Delta M = 0.40$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.495857142857143 0.349333333333334 0.0538571428571428 0.0853333333333334],...
    'Color',[1 0 0],...
    'String','$\Delta M = 0.24$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
%%
% Create textbox
annotation(figure1,'textbox',...
    [0.505571428571429 0.830666666666668 0.0475714285714285 0.0853333333333333],...
    'Color',[1 0 0],...
    'String','$ | \epsilon |= \% 2.26$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.505 0.744000000000002 0.0475714285714286 0.0853333333333334],...
    'Color',[0 0 1],...
    'String','$ | \epsilon |= \%2.80$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');



