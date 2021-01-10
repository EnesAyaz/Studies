load('normal_airgap.mat')
load('bended_airgap.mat')
%%

% bended_p1_total=bended_p1_total/max(bended_p1_total);
% bended_p2_total=bended_p2_total/max(bended_p2_total);
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
seconder1=bended_p2_total(1:end-1)+bended_p1_total(1:end-1);
seconder2=[seconder1(10:end),seconder1(1:9)];
seconder3=[seconder2(10:end),seconder2(1:9)];
seconder4=[seconder3(10:end),seconder3(1:9)];

figure()
plot(bended_angle(1:end-1),seconder1,'-pb','LineWidth',2);
hold on;
plot(bended_angle(1:end-1),seconder2,'-or','LineWidth',2);
hold on;
plot(bended_angle(1:end-1),seconder3,'-c*','LineWidth',1);
hold on;
plot(bended_angle(1:end-1),seconder4,'-gs','LineWidth',1);
xlim([0 360])

ylabel({''},'FontName','Times New Roman');
xlabel({'Mechanical Angle(^\circ)'},'FontName','Times New Roman');
set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    [0 45 90 135 180 225 270 315 360]);
ylim([0 0.25])
% grid on;
%% Delta M 

figure()
plot(bended_angle(1:end-1),seconder1-seconder2,'-pb','LineWidth',2);
hold on;
plot(bended_angle(1:end-1),seconder1-seconder3,'-or','LineWidth',2);
hold on;
plot(bended_angle(1:end-1),seconder1-seconder4,'-c*','LineWidth',1);
xlim([0 360])

ylabel({''},'FontName','Times New Roman');
xlabel({'Mechanical Angle(^\circ)'},'FontName','Times New Roman');
set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    [0 45 90 135 180 225 270 315 360]);
ylim([0 0.25])

%%
bended_p1_total1=bended_p1_total(1:end-1)+[bended_p1_total(10:end-1),bended_p1_total(1:9)]+...
    [bended_p1_total(19:end-1),bended_p1_total(1:18)]+...
    [bended_p1_total(28:end-1),bended_p1_total(1:27)];
%%
figure()
% plot(bended_angle(1:end-1),bended_p1_total(1:end-1),'-or','LineWidth',3);
% hold on;
% plot(bended_angle(1:end-1),[bended_p1_total(9:end-1),bended_p1_total(1:8)],'-ob','LineWidth',3);
% hold on;
% plot(bended_angle(1:end-1),[bended_p1_total(18:end-1),bended_p1_total(1:17)],'-og','LineWidth',3);
% hold on;
% plot(bended_angle(1:end-1),  [bended_p1_total(27:end-1),bended_p1_total(1:26)],'-ok','LineWidth',3);
plot(bended_angle(1:end-1),bended_p1_total1,'-pb','LineWidth',3);
hold on;
plot(bended_angle(1:end-1),[bended_p1_total1(19:end),bended_p1_total1(1:18)],'-or','LineWidth',2);
xlim([0 360])

ylabel({'Normalized Airgap Flux Density'},'FontName','Times New Roman');
xlabel({'Mechanical Angle(^\circ)'},'FontName','Times New Roman');
set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    [0 45 90 135 180 225 270 315 360]);
ylim([0 1])



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
