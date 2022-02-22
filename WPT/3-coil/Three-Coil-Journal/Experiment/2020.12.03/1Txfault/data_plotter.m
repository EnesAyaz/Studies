clear all;
clc;
load('G:\My Drive\WPT-Testler\2020.12.03\1Txfault\data.mat')


% rms_rx=rms(i_rx1(1:31780,1));
% rms_tx1=rms(i_tx1(1:31780,1));
% rms_tx2=rms(i_tx2(1:31780,1));
% rms_r=rms(i_rez(1:31780,1));

%%
figure1 = figure('Position', [0 0 400 200]);
axes1 = axes('Parent',figure1,'YTick',[-10 -7.5 -5 -2.5 0 2.5 5 7.5 10]);
% set(axes1,'FontName','Times New Roman','FontSize',10,'GridAlpha',0.5,...
%     'XTick',[0 1 2 3 4 5 6 7 8 9 10],'ZColor',[0 0 0]);
set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.5,...
     'XTick',[0 1 2 3 4 5 6 7 8 9 10],'ZColor',[0 0 0]);
hold(axes1,'on');
colororder([0 0.447 0.741]);
yyaxis(axes1,'left');

plot(t_tx1*1e6,i_tx1*10,'DisplayName','I_{Tx1}','Color',[1 0 0],'LineWidth',2,'LineStyle','-');
% plot(t_tx2*1e6,i_tx2*10,'DisplayName','I_{Tx2}','Color',[0 0 1],'LineWidth',2,'LineStyle','-');
plot(t_res*1e6,i_res,'DisplayName','I_{Res}','LineWidth',2,...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],'LineStyle','-');

ylabel('Current(A)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');

ylim(axes1,[-10 10]);

set(axes1,'YColor',[0 0 0],'YTick',[-10 -7.5 -5 -2.5 0 2.5 5 7.5 10]);

yyaxis(axes1,'right');
plot(t_vin*1e6,40*vin-100,'DisplayName','Vin','LineWidth',2,'Color',[0 0 0]);

ylabel('Voltage(V)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');
set(axes1,'YColor',[0 0 0],'YTick',...
    [-150 -112.5 -75 -37.5 0 37.5 75 112.5 150]);

ylim(axes1,[-150 150]);

xlim(axes1,[0 10]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');

legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.640069872290127 0.209204405734087 0.146800001068115 0.287666673088074],...
    'FontSize',14,...
    'EdgeColor','none');
xlabel('time($\mu s$)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');
%%

figure1 = figure('Position', [0 0 347 200]);
axes1 = axes('Parent',figure1,'YTick',[-10 -7.5 -5 -2.5 0 2.5 5 7.5 10]);
set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.5,...
    'XTick',[0 1 2 3 4 5 6 7 8 9 10],'ZColor',[0 0 0]);
hold(axes1,'on');
colororder([0 0.447 0.741]);

plot(t_rx1*1e6,i_rx1*10,'DisplayName','I_{Rx1}','Color',[1 0 0],'LineWidth',2,'LineStyle','-');
plot(t_rx2*1e6,i_rx2*10,'DisplayName','I_{Rx2}','Color',[0 0 1],'LineWidth',1,'LineStyle','-');
plot(t_rx3*1e6,i_rx3*10,'DisplayName','I_{Rx3}','LineWidth',2,...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],'LineStyle','-');
plot(t_rx4*1e6,i_rx4*10,'DisplayName','I_{Rx4}','LineWidth',1,'Color',[0.93,0.69,0.13]);


ylabel('Current(A)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');

ylim(axes1,[-10 10]);

xlim(axes1,[0 10]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');

% legend1 = legend(axes1,'show');
% set(legend1,...
%     'Position',[0.640069872290127 0.209204405734087 0.146800001068115 0.287666673088074],...
%     'FontSize',14,...
%     'EdgeColor','none');
xlabel('time($\mu s$)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');

