clear all;
clc;
load('G:\My Drive\WPT-Testler\2020.12.03\No_fault\data.mat')


rms_rx=rms(i_rx1(1:31780,1));
rms_tx1=rms(Itx1(1:31780,1));
rms_tx2=rms(i_tx2(1:31780,1));
rms_r=rms(i_rez(1:31780,1));

%%
figure1 = figure('Position', [0 0 400 200]);
axes1 = axes('Parent',figure1,'YTick',[-10 -7.5 -5 -2.5 0 2.5 5 7.5 10]);
% set(axes1,'FontName','Times New Roman','FontSize',10,'GridAlpha',0.5,...
%     'XTick',[0 1 2 3 4 5 6 7 8 9 10],'ZColor',[0 0 0]);
set(axes1,'FontName','Times New Roman','FontSize',10,'GridAlpha',0.5,...
     'XTick',[0 1 2 3 4 5 6 7 8 9 10],'ZColor',[0 0 0]);
hold(axes1,'on');
colororder([0 0.447 0.741]);
yyaxis(axes1,'left');

plot(t_itx1*1e6,Itx1*10,'DisplayName','I_{Tx1}','Color',[1 0 0],'LineWidth',2,'LineStyle','-');
plot(t_tx2*1e6,i_tx2*10,'DisplayName','I_{Tx2}','Color',[0 0 1],'LineWidth',2,'LineStyle','-');
plot(t_rez*1e6,i_rez,'DisplayName','I_{Res}','LineWidth',2,...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],'LineStyle','-');

ylabel('Current(A)','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex');

ylim(axes1,[-10 10]);

set(axes1,'YColor',[0 0 0],'YTick',[-10 -7.5 -5 -2.5 0 2.5 5 7.5 10]);

yyaxis(axes1,'right');
plot(t_vin*1e6,20*vin-100,'DisplayName','Vin','LineWidth',2,'Color',[0 0 0]);

ylabel('Voltage(V)','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex');
set(axes1,'YColor',[0 0 0],'YTick',...
    [-150 -112.5 -75 -37.5 0 37.5 75 112.5 150]);

ylim(axes1,[-150 150]);

xlim(axes1,[0 10]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');

% legend1 = legend(axes1,'show');
% set(legend1,...
%     'Position',[0.640069872290127 0.209204405734087 0.146800001068115 0.287666673088074],...
%     'FontSize',8,...
%     'EdgeColor','none');
xlabel('time($\mu s$)','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex');
%%

figure1 = figure('Position', [0 0 370 200]);
axes1 = axes('Parent',figure1,'YTick',[-10 -7.5 -5 -2.5 0 2.5 5 7.5 10]);
set(axes1,'FontName','Times New Roman','FontSize',10,'GridAlpha',0.5,...
    'XTick',[0 1 2 3 4 5 6 7 8 9 10],'ZColor',[0 0 0]);
hold(axes1,'on');
colororder([0 0.447 0.741]);

plot(t*1e6,i_rx1,'DisplayName','I_{Rx1}','Color',[1 0 0],'LineWidth',2,'LineStyle','-');
plot(t_rx2*1e6,i_rx2*10,'DisplayName','I_{Rx2}','Color',[0 0 1],'LineWidth',2,'LineStyle','-');
plot(t_rx3*1e6,Irx3,'DisplayName','I_{Rx3}','LineWidth',2,...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],'LineStyle','-');
plot(t_rx4*1e6,i_rx4*10,'DisplayName','I_{Rx4}','LineWidth',1,'Color',[0.93,0.69,0.13]);


ylabel('Current(A)','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex');

ylim(axes1,[-10 10]);

xlim(axes1,[0 10]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');

% legend1 = legend(axes1,'show');
% set(legend1,...
%     'Position',[0.640069872290127 0.209204405734087 0.146800001068115 0.287666673088074],...
%     'FontSize',8,...
%     'EdgeColor','none');
xlabel('time($\mu s$)','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex');

%% Vin-Iin
figure=figure('Position', [0 0 500 300]);
yyaxis right
plot(t_vin*1e6,20*vin-100,'LineWidth',0.5);
ylabel('Voltage(V)','fontsize',14,'interpreter','latex')
hold on;
yyaxis left
plot(t_itx1*1e6,Itx1*10,'b','LineWidth',2);
hold on;
plot(t_tx2*1e6,i_tx2*10,'k','LineWidth',2);
hold on;
plot(t_rez*1e6,i_rez,'LineWidth',3);
xlim([0 10])
grid on;
xlabel('time($\mu s$)','fontsize',14,'interpreter','latex')
ylabel('Current(A)','fontsize',14,'interpreter','latex')
lgd1=legend("I_{Tx1}","I_{Tx2}","I_{Res}","Vin") 
lgd1.FontSize = 14;

%%
figure;
plot(t*1e6,i_rx1,'LineWidth',2);
hold on;
plot(t_rx2*1e6,i_rx2*10,'LineWidth',2);
hold on;
plot(t_rx3*1e6,Irx3,'LineWidth',2);
hold on;
plot(t_rx4*1e6,i_rx4*10,'LineWidth',2);
xlim([0 10])
grid on;
xlabel('time($\mu s$)','fontsize',16,'interpreter','latex')
ylabel('Current(A)','fontsize',16,'interpreter','latex')
lgd=legend("I_{Rx1}","I_{Rx2}","I_{Rx3}","I_{Rx4}") 
lgd.FontSize = 14;