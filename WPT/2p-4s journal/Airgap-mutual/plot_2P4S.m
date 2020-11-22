load('normal_airgap.mat')
load('bended_airgap.mat')
%%

bended_p1_total=bended_p1_total/max(bended_p1_total);
bended_p2_total=bended_p2_total/max(bended_p2_total);
figure()
plot(bended_angle,bended_p1_total,'-or','LineWidth',3);
hold on;
plot(bended_angle,bended_p2_total,'-pb','LineWidth',3);
hold on ;
plot(bended_angle,bended_p2_total+bended_p1_total,'k','LineWidth',4);
xlim([0 360])

ylabel({'Normalized Airgap Flux Density'},'FontName','Times New Roman');
xlabel({'Mechanical Angle(^\circ)'},'FontName','Times New Roman');
set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    [0 45 90 135 180 225 270 315 360]);
legend('Tx1','Tx2','Resultant');
set(legend,'Location','best');



%%

normal_p1_total=normal_p1_total/max(normal_p1_total);
normal_p2_total=normal_p2_total/max(normal_p2_total);
figure()
plot(normal_angle,normal_p1_total,'-or','LineWidth',3);
hold on;
plot(normal_angle,normal_p2_total,'-pb','LineWidth',3);
hold on ;
plot(normal_angle,normal_p2_total+normal_p1_total,'k','LineWidth',4);
hold on ;
xlim([0 360])


ylabel({'Normalized Airgap Flux Density'},'FontName','Times New Roman');
xlabel({'Mechanical Angle(^\circ)'},'FontName','Times New Roman');
set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    [0 45 90 135 180 225 270 315 360]);
legend('Tx1','Tx2','Resultant');
set(legend,'Location','best');
