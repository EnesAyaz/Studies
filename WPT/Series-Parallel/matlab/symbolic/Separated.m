%% Series 
M=1;
DeltaM=linspace(-1,1,10000);

P1=M^2 +2*M*DeltaM+DeltaM.^2;
P2=M^2 -2*M*DeltaM+DeltaM.^2;
%%
figure();
plot(DeltaM,P1./(P1+P2),'LineWidth',3);
hold on;
plot(DeltaM,P2./(P1+P2),'LineWidth',3);

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
     -1:0.5:1,'XTickLabel',...
    {'-M','-0.5M','0','0.5M','M'});
legend('Rx1','Rx2')

ylabel('Normalized Power','FontSize',12);
xlabel('Change in Mutual Inductance','FontSize',12);


%%
figure();
plot(DeltaM,P1,'--','LineWidth',3);
hold on;
plot(DeltaM,P2,'--','LineWidth',3);
hold on;
plot(DeltaM,P1+P2,'LineWidth',3);
hold on;





%%
figure();
plot(DeltaM,1./(P1+P2),'LineWidth',3);
hold on;
%%
figure();
plot(DeltaM,P1/max(P1),'--','LineWidth',3);
hold on;
plot(DeltaM,P2/max(P2),'--','LineWidth',3);
hold on;
plot(DeltaM,(1./(P1+P2))*2,'LineWidth',3);
hold on;
%%

figure();
plot(DeltaM,P1/max(P1),'--','LineWidth',3);
hold on;
plot(DeltaM,P2/max(P2),'--','LineWidth',3);
hold on;
plot(DeltaM,(1./(P1+P2))*2,'LineWidth',3);
hold on;

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
     -1:0.5:1,'XTickLabel',...
    {'-M','-0.5M','0','0.5M','M'});
legend('Rx1 Impedance','Rx2 Impedance','Reflected Impedance')

ylabel('Normalized Impedance','FontSize',12);
xlabel('Change in Mutual Inductance','FontSize',12);

%%

figure();
plot(DeltaM,(P1+P2)/max(P1+P2),'LineWidth',3);
hold on;

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
     -1:0.5:1,'XTickLabel',...
    {'-M','-0.5M','0','0.5M','M'});
% legend('Rx1 Impedance','Rx2 Impedance','Reflected Impedance')

ylabel('Normalized Impedance','FontSize',12);
xlabel('Change in Mutual Inductance','FontSize',12);

%%

%% Series 
M=1;
DeltaM=linspace(-0.5,0.5,10000);
Ip= 1./(2*M^2+2*M.*DeltaM+DeltaM.^2);
Ip(Ip>0.5)=0.5;
% plot(DeltaM,Ip);

P1=M^2*Ip.^2;
P2=(M+DeltaM).^2.*Ip.^2;
P1=2*P1;
P2=2*P2;
P=P1+P2;

figure1 = figure();
plot(DeltaM,P1,'LineWidth',3);
hold on;
plot(DeltaM,P2,'LineWidth',3);
hold on;
% plot(DeltaM,P,'LineWidth',3);
% hold on;
line([0 0], [0 1],'LineWidth',3,'LineStyle','--','color','k')


% Create ylabel
ylabel('Normalized Power $ \frac{P}{P_{rated}} $ ','FontName','Times New Roman' ...
    ,'FontSize',24,'Interpreter','latex');

% Create xlabel
% xlabel('Change in Mutual Inductance ( \DeltaM/M)',...
%     'FontName','Times New Roman');

xlabel(' Change in Mutual Inductance  $ \frac{\Delta M}{M} $ ','FontName','Times New Roman' ...
    ,'FontSize',24,'Interpreter','latex');


% Set the remaining axes properties
set(gca,'FontName','Times New Roman','FontSize',16);
% Create legend
legend1=legend({'Rx1 ','Rx2 '},'Interpreter','latex');
set(legend1,'FontSize',16,'Location','best');

% Create textbox
annotation(figure1,'textbox',...
    [0.2494375 0.766431924882629 0.193270833333333 0.0798122065727699],...
    'String','Constant Current Region',...
    'FontSize',16,...
    'Interpreter','latex', ...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.619229166666665 0.734741784037558 0.193270833333333 0.110328638497653],...
    'String','Constant Voltage Region',...
    'FontSize',16,... 
    'Interpreter','latex', ...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

%%
%% Parallel 
M=1;
DeltaM=linspace(-0.5,0.5,10000);
Ip= 1./(2*M^2+2*M.*DeltaM+DeltaM.^2);
Ip(Ip>0.5)=0.5;
% plot(DeltaM,Ip);

P1=M.^2.*Ip.^2;
P2=(M+DeltaM).^2.*Ip.^2;
P1=2*P1;
P2=2*P2;
P=P1+P2;

figure1 = figure();
plot(DeltaM,P1,'LineWidth',3);
hold on;
plot(DeltaM,P2,'LineWidth',3);
hold on;
% plot(DeltaM,P,'LineWidth',3);
% hold on;
line([0 0], [0 1],'LineWidth',3,'LineStyle','--','color','k')


% Create ylabel
ylabel('Normalized Power $ \frac{P}{P_{rated}} $ ','FontName','Times New Roman' ...
    ,'FontSize',24,'Interpreter','latex');

% Create xlabel
% xlabel('Change in Mutual Inductance ( \DeltaM/M)',...
%     'FontName','Times New Roman');

xlabel(' Change in Mutual Inductance  $ \frac{\Delta M}{M} $ ','FontName','Times New Roman' ...
    ,'FontSize',24,'Interpreter','latex');


% Set the remaining axes properties
set(gca,'FontName','Times New Roman','FontSize',16);
% Create legend
legend1=legend({'Rx1 ','Rx2 '},'Interpreter','latex');
set(legend1,'FontSize',16,'Location','best');

% Create textbox
annotation(figure1,'textbox',...
    [0.2494375 0.766431924882629 0.193270833333333 0.0798122065727699],...
    'String','Constant Current Region',...
    'FontSize',16,...
    'Interpreter','latex', ...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.619229166666665 0.734741784037558 0.193270833333333 0.110328638497653],...
    'String','Constant Voltage Region',...
    'FontSize',16,... 
    'Interpreter','latex', ...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
