% before code start, unzip to raw_data
%% Load data
clear all;
clc;
load('raw_data.mat');
%% envelope creation 
len2=length(ip1); % it is valid for both p1 and p2
x2=1:len2/1000:len2; %  it determines the how much data points are used for envelope

ixp1_max=[];
ixp2_max=[];

ixp1_min=[];
ixp2_min=[];

for i=1:length(x2)-1
    ixp1_max=[ixp1_max max(ip1(x2(i):x2(i+1)))];
    ixp2_max=[ixp2_max max(ip2(x2(i):x2(i+1)))];
    
    ixp1_min=[ixp1_min min(ip1(x2(i):x2(i+1)))];
    ixp2_min=[ixp2_min min(ip2(x2(i):x2(i+1)))];
    
end
%% time vector is for envelopes
xb=linspace(timep1(1),timep1(end),length(x2)-1);
%% An example of envelope plot (without any data crop)
% figure();
% plot(timep1,ip1);
% hold on;
% plot(xb,ixp1_max,'-.','LineWidth',3)
% hold on;
% plot(xb,ixp1_min,'-.','LineWidth',3)

%% Time span determination
starting2= int32((2.52021+0.2)*1e6); % starting a rotation secondary
ending2= int32((7.16116+0.2)*1e6); % stop


%% Time span also created for envelopes time vectors
xb1=int32((double(starting2)/len2)*(length(x2)-1)) ;
xb2=int32((double(ending2)/len2)*(length(x2)-1)) ;

xb=linspace(timep1(starting2),timep1(ending2),((xb2-xb1)+1));


%%

figure();
plot(timep1(starting2:ending2),ip1(starting2:ending2));
hold on;
plot(xb,ixp1_max(xb1:xb2),'-.','LineWidth',3)
hold on;
plot(xb,ixp1_min(xb1:xb2),'-.','LineWidth',3)
ylim([-0.6 0.6])
xlim([timep1(starting2) timep1(ending2)])
% 
% set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
%     linspace(timep1(starting2),timep1(ending2),9),'XTickLabel',...
%     {'0','45','90','135','180','225','270','315','360'},'YTick',...
%     [-0.6 -0.5 -0.4 -0.3 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5 0.6],'YTickLabel', ...
%     {'-6','-5','-4','-3','-2','-1','0','1','2','3','4','5','6'});
set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(timep1(starting2),timep1(ending2),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.6 -0.4 -0.2 0  0.2  0.4 0.6],'YTickLabel', ...
    {'-6','-4','-2','0','2','4','6'});

ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);

%%
figure();
plot(timep2(starting2:ending2),ip2(starting2:ending2));
hold on;
plot(xb,ixp2_max(xb1:xb2),'-.','LineWidth',3)
hold on;
plot(xb,ixp2_min(xb1:xb2),'-.','LineWidth',3)
ylim([-0.6 0.6])
xlim([timep1(starting2) timep1(ending2)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(timep1(starting2),timep1(ending2),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.6 -0.4 -0.2 0  0.2  0.4 0.6],'YTickLabel', ...
    {'-6','-4','-2','0','2','4','6'});
ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);

