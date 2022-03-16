 % number of modules
m=2:1:6;
i=1 % nu8mber of failured modules

figure1 = figure( 'Position', [0 0 600 300]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

for i=0:1:3
m=i:1:6;
odr=(m./(m-i)) *100;

if i==0
plot(m,odr,'DisplayName','i=0','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[0 0 1]); 
elseif i==1
 plot(m,odr,'DisplayName','i=1','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[1 0 0]);       
          
elseif i==2
 plot(m,odr,'DisplayName','i=2','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);
elseif i==3   
plot(m,odr,'DisplayName','i=3','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[1 0 1]);
elseif i==4
plot(m,odr,'DisplayName','i=4','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[0 1 0]);
end
        
end


% Create ylabel
ylabel({'Overdesign','Ratio (%)'},'FontName','Times New Roman');

% Create xlabel
xlabel({'Number of Tx modules (m)','Number of Rx modules (n)'},...
    'FontName','Times New Roman');

% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 400]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.5,...
    'GridColor',[0 0 0],'XTick',[0 1 2 3 4 5 6 7 8 9 10],'YTick',...
    [0 50 100 150 200 250 300 350 400]);
% Create textbox
% annotation(figure1,'textbox',...
%     [0.669333333333337 0.830000000000005 0.179000000000001 0.11],...
%     'Color',[0 1 0],...
%     'String','i=4',...
%     'FontWeight','bold',...
%     'FontSize',14,...
%     'FontName','Times New Roman',...
%     'FitBoxToText','off',...
%     'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.529333333333335 0.760000000000004 0.179000000000001 0.11],...
    'Color',[1 0 1],...
    'String','i=3',...
    'FontWeight','bold',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.367666666666669 0.623333333333338 0.179 0.11],...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745],...
    'String','i=2',...
    'FontWeight','bold',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.212666666666667 0.483333333333335 0.179 0.11],'Color',[1 0 0],...
    'String','i=1',...
    'FontWeight','bold',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.152666666666667 0.293333333333334 0.229 0.11],'Color',[0 0 1],...
    'String','i=0 (healthy)',...
    'FontWeight','bold',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

