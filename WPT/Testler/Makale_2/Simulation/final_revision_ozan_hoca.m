%% 1p2s-without cross coupling , aligned

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1p2S_sine_aligned_without_cross_coupling.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter',  ...
    delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ...
    ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
FA_OUTX_TUNED = [dataArray{1:end-1}];
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

time_FA_OUTX_TUNED= FA_OUTX_TUNED(:,1)*1000;
Is1_FA_OUTX_TUNED= FA_OUTX_TUNED(:,2);
Is2_FA_OUTX_TUNED= FA_OUTX_TUNED(:,3);

% 1p2s- without cross coupling , misaligned

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1p2S_sine_missaligned_without_cross_coupling.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, ...
    'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
MA_OUTX_TUNED = [dataArray{1:end-1}];
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

time_MA_OUTX_TUNED= MA_OUTX_TUNED(:,1)*1000;
Is1_MA_OUTX_TUNED= MA_OUTX_TUNED(:,2);
Is2_MA_OUTX_TUNED= MA_OUTX_TUNED(:,3);

%
xs=[0 1.5e-2];
figure();

plot(time_FA_OUTX_TUNED,Is1_FA_OUTX_TUNED,'Color','r','LineWidth',2)
hold on;
plot(time_FA_OUTX_TUNED,Is2_FA_OUTX_TUNED,'--','Color','b','LineWidth',2)
set(gca,'FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
% xticklabels([])
ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
% title({'150kHz Decoupled Receivers ','Full-Aligned Condition'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
xlim(xs)

figure();

plot(time_MA_OUTX_TUNED,Is1_MA_OUTX_TUNED,'Color','r','LineWidth',2)
hold on;
plot(time_MA_OUTX_TUNED,Is2_MA_OUTX_TUNED,'--','Color','b','LineWidth',2)

set(gca,'FontSize',12)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
% title({'Misaligned Condition'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
xlim(xs)

%% 1p2s-with cross coupling , aligned
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1p2S_sine_aligned_with_cross_coupling.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'EmptyValue', NaN, ...
    'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
FA_WITHX_TUNED = [dataArray{1:end-1}];
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

time_FA_WITHX_TUNED= FA_WITHX_TUNED(:,1)*1000;
Is1_FA_WITHX_TUNED= FA_WITHX_TUNED(:,2);
Is2_FA_WITHX_TUNED= FA_WITHX_TUNED(:,3);

% 1p2s-with cross coupling , aligned
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1p2S_sine_misaligned_with_cross_coupling.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'EmptyValue', NaN, ...
    'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
MA_WITHX_TUNED = [dataArray{1:end-1}];
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

time_MA_WITHX_TUNED= MA_WITHX_TUNED(:,1)*1000;
Is1_MA_WITHX_TUNED= MA_WITHX_TUNED(:,2);
Is2_MA_WITHX_TUNED= MA_WITHX_TUNED(:,3);
%

xs=[0 1.5e-2];
figure();
% subplot(2,1,1);

plot(time_FA_WITHX_TUNED,Is1_FA_WITHX_TUNED,'Color','r','LineWidth',2)
hold on;
plot(time_FA_WITHX_TUNED,Is2_FA_WITHX_TUNED,'--','Color','b','LineWidth',2)
set(gca,'FontSize',12)

% xticklabels([])
ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
% title({'150kHz Cross-Coupled Receivers ','Full-Aligned Condition'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
grid on;
xlim(xs)

figure();

plot(time_MA_WITHX_TUNED,Is1_MA_WITHX_TUNED,'Color','r','LineWidth',2)
hold on;
plot(time_MA_WITHX_TUNED,Is2_MA_WITHX_TUNED,'--','Color','b','LineWidth',2)

set(gca,'FontSize',12)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
% title({'Misaligned Condition'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
xlim(xs)

%% 1p2s-with  decoupled 135kHz , aligned
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1p2S_sine_aligned_without_cross_coupling_detuned.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'EmptyValue', NaN, ...
    'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
FA_OUTX_DETUNED = [dataArray{1:end-1}];
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

time_FA_OUTX_DETUNED= FA_OUTX_DETUNED(:,1)*1000;
Is1_FA_OUTX_DETUNED= FA_OUTX_DETUNED(:,2);
Is2_FA_OUTX_DETUNED= FA_OUTX_DETUNED(:,3);

% 1p2s-with  decoupled 135kHz , misaligned

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1p2S_sine_misaligned_without_cross_coupling_detuned.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'EmptyValue', NaN, ...
    'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
MA_OUTX_DETUNED = [dataArray{1:end-1}];
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

time_MA_OUTX_DETUNED= MA_OUTX_DETUNED(:,1)*1000;
Is1_MA_OUTX_DETUNED= MA_OUTX_DETUNED(:,2);
Is2_MA_OUTX_DETUNED= MA_OUTX_DETUNED(:,3);

%
xs=[0 1.5e-2];
figure();
% subplot(2,1,1);

plot(time_FA_OUTX_DETUNED,Is1_FA_OUTX_DETUNED,'Color','r','LineWidth',2)
hold on;
plot(time_FA_OUTX_DETUNED,Is2_FA_OUTX_DETUNED,'--','Color','b','LineWidth',2)
set(gca,'FontSize',12)

% xticklabels([])
ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
% title({'135kHz Decoupled Receivers ','Full-Aligned Condition'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
grid on;
xlim(xs)
ylim([-7 7])
% subplot(2,1,2);
figure();

plot(time_MA_OUTX_DETUNED,Is1_MA_OUTX_DETUNED,'Color','r','LineWidth',2)
hold on;
plot(time_MA_OUTX_DETUNED,Is2_MA_OUTX_DETUNED,'--','Color','b','LineWidth',2)

set(gca,'FontSize',12)


ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
% title({'Misaligned Condition'},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
ylim([-7 7])
xlim(xs)

%% 150kHz Decoupled vs cross coupled full-align
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\cross_coupled_simulation_19.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, ...
    'Delimiter', delimiter, 'TextType', 'string', ...
    'EmptyValue', NaN, 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
crosscoupledsimulation = [dataArray{1:end-1}];
clearvars filename delimiter startRow  ...
    formatSpec fileID dataArray ans;


filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\de_coupled_simulation_19.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, ...
    'Delimiter', delimiter, 'TextType', 'string', ...
    'EmptyValue', NaN, 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
decoupledsimulation = [dataArray{1:end-1}];
clearvars filename delimiter startRow  ...
    formatSpec fileID dataArray ans;

xs=[0 1.5e-2];

figure();
% subplot(2,1,1)
plot(decoupledsimulation(:,1)*1000,decoupledsimulation(:,2),'Color','r','LineWidth',2)
hold on;
plot(decoupledsimulation(:,1)*1000,decoupledsimulation(:,3),'--','Color','b','LineWidth',2)
% xticklabels([])

set(gca,'FontSize',12)
ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
% title({'150kHz Decoupled Receivers '},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)

lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');

set(lgnd,'color','none');
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
grid on;
xlim(xs)


% subplot(2,1,2)
figure();
plot(crosscoupledsimulation(:,1)*1000,crosscoupledsimulation(:,2),'Color','r','LineWidth',2)
hold on;
plot(crosscoupledsimulation(:,1)*1000,crosscoupledsimulation(:,3),'--','Color','b','LineWidth',2)
set(gca,'FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
% title({'150kHz Cross-Coupled Receivers '},'Color','k','FontWeight','bold' ...
%     ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
xlim(xs)
ylim([-7 7])




difference=max(crosscoupledsimulation(:,2))-max(crosscoupledsimulation(:,3));
sum=max(crosscoupledsimulation(:,2))+max(crosscoupledsimulation(:,3));


difference/sum

% {(I_R_x_1-I_R_x_2)}/_{(I_R_x_1+I_R_x_2)} = 0.4307

max(crosscoupledsimulation(:,2))/sqrt(2)

max(crosscoupledsimulation(:,3))/sqrt(2)

max(decoupledsimulation(:,2))/sqrt(2)

max(decoupledsimulation(:,3))/sqrt(2)

%I_R_x_1 =4.5 A_r_m_s
%I_R_x_2 =1.7 A_r_m_s


