filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\cross_coupled_simulation.txt';
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

%%

xs=[0 1.5e-2];
figure();

plot(crosscoupledsimulation(:,1)*1000,crosscoupledsimulation(:,2),'Color','r','LineWidth',2)
hold on;
plot(crosscoupledsimulation(:,1)*1000,crosscoupledsimulation(:,3),'Color','b','LineWidth',2)
set(gca,'FontSize',12)
xlabel('Time (ms)','Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
ylabel('Current (A)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
hold on;
title({'150kHz Cross-Coupled Receivers ','Missaligned Condition'},'Color','k','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Rx_1 Current ', ...
    'Rx_2 Current',},'FontSize',10,'Box','off');
set(lgnd,'color','none');
grid on;
xlim(xs)

difference=max(crosscoupledsimulation(:,2))-max(crosscoupledsimulation(:,3));
sum=max(crosscoupledsimulation(:,2))+max(crosscoupledsimulation(:,3));

difference/sum

% {(I_R_x_1-I_R_x_2)}/_{(I_R_x_1+I_R_x_2)} = 0.4307

rms(crosscoupledsimulation(:,2))

rms(crosscoupledsimulation(:,3))

%I_R_x_1 =4.5 A_r_m_s
%I_R_x_2 =1.7 A_r_m_s

