%% 
omega=0:45:360;
MSR=17;
LT1x=82;
L_tot_Tx1=[119 119.5 121 120 119.5 119 118 118.5 119];
M_Tx1=(L_tot_Tx1-LT1x-MSR)/2;

LT2x=82.5;
L_tot_Tx2=[119 119 118 118.7 118.8 119 120.5 119.8 119];
M_Tx2=(L_tot_Tx2-LT2x-MSR)/2;

a=max(M_Tx1);
M_Tx1=(M_Tx1/a)*100;
b=max(M_Tx2);
M_Tx2=(M_Tx2/b)*100;

plot(omega,M_Tx1)
hold on;
plot(omega,M_Tx2)

ylim([0 100])

%%
figure1 = figure( 'Position', [0 0 500 200]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(omega,M_Tx1,'DisplayName','$M_{Tx1,MSR}$','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[0 0 1]); 
plot(omega,M_Tx2,'DisplayName','$M_{Tx1,MSR}$','MarkerSize',8,'Marker','o','LineWidth',1,'LineStyle','--',...
    'Color',[1 0 0]); 


% Create ylabel
ylabel({'$M_{Tx,MSR}$', 'Change ($\%$)'},'Interpreter','Latex','FontSize',16,'FontName','Times');

% Create xlabel
xlabel('Mechanical Rotation ($^o$)','Interpreter','Latex','FontSize',14,'FontName','Times');

% Uncomment the following line to preserve the Y-limits of the axes

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off')
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'GridColor',[0 0 0],'XTick',...
    0:45:360, 'YTick',0:20:100);
ylim(axes1,[0 100]);
xlim(axes1,[0 360]); 
legend1 = legend(axes1,'show','interpreter','latex','FontSize',12);

set(legend1,...
    'Position',[0.69426666422526 0.381413963194963 0.204400002441406 0.158500003242493]);