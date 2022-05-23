% before code start, unzip to raw_data
%% Load data
clear all;
clc;
load('raw_data.mat');
%% envelope creation 
len1=length(is2); % is2,is3,is4 same length and time vector
x1=1:len1/1000:len1; %  it determines the how much data points are used for envelope

len2=length(ip1); % ip1,ip2 same length and time vector
x2=1:len2/1000:len2; % it determines the how much data points are used for envelope

ixs4_max=[];
ixs2_max=[];
ixs3_max=[];
ixp1_max=[];
ixp2_max=[];

ixs4_min=[];
ixs2_min=[];
ixs3_min=[];
ixp1_min=[];
ixp2_min=[];

for i=1:length(x1)-1
    ixs4_max=[ixs4_max max(is4(x1(i):x1(i+1)))];
    ixs2_max=[ixs2_max max(is2(x1(i):x1(i+1)))];
    ixs3_max=[ixs3_max max(is3(x1(i):x1(i+1)))];

    
    ixs4_min=[ixs4_min min(is4(x1(i):x1(i+1)))];
    ixs2_min=[ixs2_min min(is2(x1(i):x1(i+1)))];
    ixs3_min=[ixs3_min min(is3(x1(i):x1(i+1)))];
   
end

for i=1:length(x2)-1
    ixp1_max=[ixp1_max max(ip1(x2(i):x2(i+1)))];
    ixp2_max=[ixp2_max max(ip2(x2(i):x2(i+1)))];
    
    ixp1_min=[ixp1_min min(ip1(x2(i):x2(i+1)))];
    ixp2_min=[ixp2_min min(ip2(x2(i):x2(i+1)))];
    
end

%% time vector is for envelopes
xa=linspace(time2(1),time2(end),length(x1)-1); % for secondary currents
xb=linspace(timep1(1),timep1(end),length(x2)-1); % for primary currents
%% An example of envelope plot (without any data crop)
% figure();
% plot(time2,is2);
% hold on;
% plot(xa,ixs2_max,'-.','LineWidth',3)
% hold on;
% plot(xa,ixs2_min,'-.','LineWidth',3)

%% Time span determination
starting1= int32((1.54656+0.38)*1e6); % starting a rotation secondary
ending1= int32((6.50158+0.38)*1e6);  % stop
 
starting2= int32((1.93505+0.37)*1e6); % starting a rotaion for primary
ending2= int32((7.84254+0.2)*1e6); % stop


%% Time span also created for envelopes time vectors
xa1=int32((double(starting1)/len1)*(length(x1)-1)) ;
xa2=int32((double(ending1)/len1)*(length(x1)-1)) ;

xb1=int32((double(starting2)/len2)*(length(x2)-1)) ;
xb2=int32((double(ending2)/len2)*(length(x2)-1)) ;

xa=linspace(time2(starting1),time2(ending1),((xa2-xa1)+1));
xb=linspace(timep1(starting2),timep1(ending2),((xb2-xb1)+1));

%% Secondar 2
figure();
plot(time2(starting1:ending1),is2(starting1:ending1));
hold on;
plot(xa,ixs2_max(xa1:xa2),'-.','LineWidth',3)
hold on;
plot(xa,ixs2_min(xa1:xa2),'-.','LineWidth',3)
ylim([-0.2 0.2])
xlim([time2(starting1) time2(ending1)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(time2(starting1),time2(ending1),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.2 -0.15 -0.1 -0.05 0 0.05 0.1 0.15 0.2 ],'YTickLabel', ...
    {'-2','-1.5','-1','-0.5','0','0.5','1','1.5','2'});
%
ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);


% [2.08 2.795 3.51 4.225 4.94 5.655 6.37 7.085 7.82]
%%  Secondar 3
figure();
plot(time3(starting1:ending1),is3(starting1:ending1));
hold on;
plot(xa,ixs3_max(xa1:xa2),'-.','LineWidth',3)
hold on;
plot(xa,ixs3_min(xa1:xa2),'-.','LineWidth',3)
ylim([-0.2 0.2])
xlim([time4(starting1) time4(ending1)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(time2(starting1),time2(ending1),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.2 -0.15 -0.1 -0.05 0 0.05 0.1 0.15 0.2 ],'YTickLabel', ...
    {'-2','-1.5','-1','-0.5','0','0.5','1','1.5','2'});
% 
ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);

%%  Secondar 4
figure();
plot(time4(starting1:ending1),is4(starting1:ending1));
hold on;
plot(xa,ixs4_max(xa1:xa2),'-.','LineWidth',3)
hold on;
plot(xa,ixs4_min(xa1:xa2),'-.','LineWidth',3)
ylim([-20 20])
xlim([time2(starting1) time2(ending1)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(time2(starting1),time2(ending1),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-20 -15 -10 -5 0 5 10 15 20 ],'YTickLabel', ...
    {'-2','-1.5','-1','-0.5','0','0.5','1','1.5','2'});
% 
ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);
%% Primary 1

figure();
plot(timep1(starting2:ending2),ip1(starting2:ending2));
hold on;
plot(xb,ixp1_max(xb1:xb2),'-.','LineWidth',3)
hold on;
plot(xb,ixp1_min(xb1:xb2),'-.','LineWidth',3)
ylim([-0.25 0.25])
xlim([timep1(starting2) timep1(ending2)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(timep1(starting2),timep1(ending2),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.25 -0.2 -0.15 -0.1 -0.05 0 0.05 0.1 0.15 0.2 0.25 ],'YTickLabel', ...
    {'-2.5','-2','-1.5','-1','-0.5','0','0.5','1','1.5','2','2.5'});
ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);

%% Primary 2
figure();
plot(timep2(starting2:ending2),ip2(starting2:ending2));
hold on;
plot(xb,ixp2_max(xb1:xb2),'-.','LineWidth',3)
hold on;
plot(xb,ixp2_min(xb1:xb2),'-.','LineWidth',3)
ylim([-0.25 0.25])
xlim([timep1(starting2) timep1(ending2)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(timep1(starting2),timep1(ending2),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.25 -0.2 -0.15 -0.1 -0.05 0 0.05 0.1 0.15 0.2 0.25 ],'YTickLabel', ...
    {'-2.5','-2','-1.5','-1','-0.5','0','0.5','1','1.5','2','2.5'});
ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);
