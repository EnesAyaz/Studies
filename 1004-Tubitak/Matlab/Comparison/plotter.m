load('IBC.mat');

I1=out.Im1.Data;
I2=out.Im2.Data;
Vout=out.Vout.Data;
t=out.tout;

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(t,I1,'color','r','Linewidth',2)
hold on;
plot(t,I2,'color','b','Linewidth',2)
hold on;
plot(t,I1+I2,'color','k','Linewidth',2)
xlim([0.4999 0.5])
ylim([0 25])

% Create ylabel
ylabel({'Current (A)'},'FontSize',14,'FontName','Times New Roman');

% Create xlabel
xlabel('Time ($\mu$s)','FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','XTickLabel',...
    {'0','','20','','40','','60','','80','','100'});

figure2 = figure;

% Create axes
axes2 = axes('Parent',figure2);
hold(axes2,'on');

plot(t,Vout,'color','k','Linewidth',2)
xlim([0.4999 0.5])
ylim([1188 1192])

% Create ylabel
ylabel({'Voltage (V)'},'FontSize',14,'FontName','Times New Roman');

% Create xlabel
xlabel('Time ($\mu$s)','FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
hold(axes2,'off');
% Set the remaining axes properties
set(axes2,'FontName','Times New Roman','XTickLabel',...
    {'0','','20','','40','','60','','80','','100'});

%%
load('3-level.mat');
I1=out.Im1.Data;

Vout=out.Vout.Data;
t=out.tout;

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(t,I1,'color','k','Linewidth',2)
xlim([0.4999 0.5])
ylim([0 25])

% Create ylabel
ylabel({'Current (A)'},'FontSize',14,'FontName','Times New Roman');

% Create xlabel
xlabel('Time ($\mu$s)','FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','XTickLabel',...
    {'0','','20','','40','','60','','80','','100'});

figure2 = figure;

% Create axes
axes2 = axes('Parent',figure2);
hold(axes2,'on');

plot(t,Vout,'color','k','Linewidth',2)
xlim([0.4999 0.5])
ylim([1188 1192])

% Create ylabel
ylabel({'Voltage (V)'},'FontSize',14,'FontName','Times New Roman');

% Create xlabel
xlabel('Time ($\mu$s)','FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
hold(axes2,'off');
% Set the remaining axes properties
set(axes2,'FontName','Times New Roman','XTickLabel',...
    {'0','','20','','40','','60','','80','','100'});
%%
load('2-level.mat');

I1=out.Im1.Data;

Vout=out.Vout.Data;
t=out.tout;

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(t,I1,'color','k','Linewidth',2)
xlim([0.4999 0.5])
ylim([0 25])

% Create ylabel
ylabel({'Current (A)'},'FontSize',14,'FontName','Times New Roman');

% Create xlabel
xlabel('Time ($\mu$s)','FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','XTickLabel',...
    {'0','','20','','40','','60','','80','','100'});

figure2 = figure;

% Create axes
axes2 = axes('Parent',figure2);
hold(axes2,'on');

plot(t,Vout,'color','k','Linewidth',2)
xlim([0.4999 0.5])
ylim([1188 1192])

% Create ylabel
ylabel({'Voltage (V)'},'FontSize',14,'FontName','Times New Roman');

% Create xlabel
xlabel('Time ($\mu$s)','FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
hold(axes2,'off');
% Set the remaining axes properties
set(axes2,'FontName','Times New Roman','XTickLabel',...
    {'0','','20','','40','','60','','80','','100'});
