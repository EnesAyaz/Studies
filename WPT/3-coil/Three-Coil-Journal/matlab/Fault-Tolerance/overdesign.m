 % number of modules
m=2:1:10;
i=1 % nu8mber of failured modules

figure1 = figure( 'Position', [0 0 500 300]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

for i=0:1:4
m=i:1:10;
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
ylabel({'Overdesign','Ratio (%)'},'FontSize',14,'FontName','Times');

% Create xlabel
xlabel({'Number of Tx modules (m)','Number of Rx modules (n)'},'FontSize',14,'FontName','Times');

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'GridColor',[0 0 0],'XTick',...
    [0 1 2 3 4 5 6 7 8 9 10],'YTick',[0  50  100  150  200  250  300 350 400 450 500 ]);
ylim([0 500])
    
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.184095236804372 0.539745988797168 0.18150000128746 0.32666667397817],...
    'FontSize',12,...
    'FontName','Times New Roman');
