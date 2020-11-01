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



