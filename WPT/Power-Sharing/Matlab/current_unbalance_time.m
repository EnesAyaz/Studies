time=0:1.25e-5/100:1.25e-5;
theta=2*pi*160e3*time;
I1_a=10*sin(theta);
I2_a=10*sin(theta);


I1_m=20*sin(theta);
I2_m=0*sin(theta);

% 
% figure('Position',[0 0 500 200]);
% plot(theta,I1_a)
% hold on; 
% plot(theta,I2_a)
% ylim([-5 5])
% xlim([0 4*pi])


figure1 = figure('Position',[0 0 800 200]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot1 = plot(theta,I1_a);
plot2 = plot(theta,I2_a);
set(plot1,'DisplayName','I_{RX1}','LineWidth',1.5,'LineStyle','-',...
    'Color',[0 0 1]);
set(plot2,'DisplayName','I_{RX2}','LineWidth',1.5,'LineStyle','--',...
    'Color',[1 0 0]);

% Create ylabel
ylabel({'Current (A)'});

% Create xlabel
xlabel({'Time'});

ylim(axes1,[-20 20]);
xlim(axes1, [0 4*pi])
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.5,...
    'MinorGridAlpha',0.5,'XGrid','on','XMinorGrid','on','XTick',...
    [0 3.14 6.28 9.42 12.56],'XTickLabel',{'0','Ts/2','Ts','3Ts/2','2Ts'},...
    'YGrid','on','YMinorGrid','on','YTick',[-20 -15 -10 -5 0 5 10 15 20]);
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.736666689929764 0.6174139846041 0.155999998390675 0.262499992847443]);