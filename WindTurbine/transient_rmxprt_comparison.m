%% rmxprt solution
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["H_z", "Torque"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
tbl = readtable("D:\Github\Studies\WindTurbine\Giris Torku vs Hiz2.csv", opts);
H_z = tbl.H_z;
Torque = tbl.Torque;
clear opts tbl

figure1 = figure;
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.111618122977346 0.775 0.815]);
hold(axes1,'on');

plot(H_z,abs(Torque),'DisplayName','Rmxprt Model','LineWidth',1,...
    'Color',[1 0 0]);
xlim([1200 1240])
xlim([1200 1215])

%%
% speed=1200:2:1240;
% Torque2=zeros(size(speed));
% for i=1:length(speed)
%     for j=1:length(H_z)-1
%         if H_z(j)<speed(i) && speed(i)<H_z(j+1)
%             Torque2(i)=(Torque(j)+Torque(j+1))/2;
%         end
%          
%     end 
% end
%%
Torquea=[0 -10.3 -20.18 -29.75 -38.72 -47.35 -55.20 -62.34 -68.85 -74.27 -79.27 -83.16 -85.97 -88.57 -90.2 -90.91 -91.48 -91.32 -90.7 -90 -89.1]

Torquea=[0 -10.97 -21.7 -31.87 -41.44 -50.16 -58.06 -64.99 -70.9 -75.86 -79.86 -83.08 -85.48 -87.07 -88.24 -88.82 -89.03 -88.88 -88.59 -88.09 -87.36]

% plot(speed,abs(Torquea))
plot(speed,abs(Torquea),'SeriesIndex',3,'DisplayName','Transient Model',...
    'LineWidth',1,...
    'Color',[0 0 1]);

% Create ylabel
ylabel({'Torque (kN.m)'});

% Create xlabel
xlabel({'Speed (RPM)'});

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',15,'GridAlpha',0.5,...
    'GridColor',[0 0 0],'LineWidth',1,'MinorGridAlpha',0.5,'MinorGridColor',...
    [0 0 0],'XMinorGrid','on','YMinorGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.472049498551226 0.6084142394822 0.397973941134993 0.117179070998229],...
    'FontSize',15);
xlim([1200 1215])

yline(34.5,'LineWidth',2)
% stem(speed,abs(Torquea),'Linestyle','none','Marker','x')

%%
% stem(speed,abs(Torque2),'Linestyle','none','Marker','x')

