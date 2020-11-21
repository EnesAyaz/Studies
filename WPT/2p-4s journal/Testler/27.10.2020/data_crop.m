% before code start, unzip to raw_data
%% Load data
clear all;
clc;
load('raw_data.mat');
%% envelope creation 
len1=length(is1); % is1 and is4 same length and time vector
x1=1:len1/1000:len1; %  it determines the how much data points are used for envelope

len2=length(is2); % is2 and is3 same length and time vector
x2=1:len2/1000:len2; %  it determines the how much data points are used for envelope

ix1_max=[];
ix2_max=[];
ix3_max=[];
ix4_max=[];

ix1_min=[];
ix2_min=[];
ix3_min=[];
ix4_min=[];

for i=1:length(x1)-1
    ix1_max=[ix1_max max(is1(x1(i):x1(i+1)))];
    ix4_max=[ix4_max max(is4(x1(i):x1(i+1)))];
    
    ix1_min=[ix1_min min(is1(x1(i):x1(i+1)))];
    ix4_min=[ix4_min min(is4(x1(i):x1(i+1)))];
end

for i=1:length(x2)-1
    ix2_max=[ix2_max max(is2(x2(i):x2(i+1)))];
    ix3_max=[ix3_max max(is3(x2(i):x2(i+1)))];
    
    ix2_min=[ix2_min min(is2(x2(i):x2(i+1)))];
    ix3_min=[ix3_min min(is3(x2(i):x2(i+1)))];
    
end


%% time vector is for envelopes
xa=linspace(time1(1),time1(end),length(x1)-1);  % for s1 s4
xb=linspace(time2(1),time2(end),length(x2)-1); % for s2 s3

%% An example of envelope plot (without any data crop)
% figure();
% plot(time1,is1);
% hold on;
% plot(xa,ix1_max,'-.','LineWidth',3)
% hold on;
% plot(xa,ix1_min,'-.','LineWidth',3)

%% Time span determination
ending1= int32((7.826+0.2)*1e6);  % starting a rotation secondary
starting1= int32((2.075+0.2)*1e6); % stop


ending2= int32((8.658+0.2)*1e6); % starting a rotation secondary
starting2= int32((2.275+0.2)*1e6); % stop

%% Time span also created for envelopes time vectors
xa1=int32((double(starting1)/len1)*(length(x1)-1)) ;
xa2=int32((double(ending1)/len1)*(length(x1)-1)) ;

xb1=int32((double(starting2)/len2)*(length(x2)-1)) ;
xb2=int32((double(ending2)/len2)*(length(x2)-1)) ;

xa=linspace(time1(starting1),time1(ending1),((xa2-xa1)+1));
xb=linspace(time2(starting2),time2(ending2),((xb2-xb1)+1));

%% Seconder 1
figure();
plot(time1(starting1:ending1),is1(starting1:ending1));
hold on;
plot(xa,ix1_max(xa1:xa2),'-.','LineWidth',3)
hold on;
plot(xa,ix1_min(xa1:xa2),'-.','LineWidth',3)
ylim([-0.4 0.4])
xlim([time1(starting1) time1(ending1)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(time1(starting1),time1(ending1),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.4 -0.2 0 0.2 0.4],'YTickLabel',{'-2','-1','0','1','2'});

ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);


% [2.08 2.795 3.51 4.225 4.94 5.655 6.37 7.085 7.82]
%% Seconder 4
figure();
plot(time1(starting1:ending1),is4(starting1:ending1));
hold on;
plot(xa,ix4_max(xa1:xa2),'-.','LineWidth',3)
hold on;
plot(xa,ix4_min(xa1:xa2),'-.','LineWidth',3)
ylim([-0.4 0.4])
xlim([time4(starting1) time4(ending1)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(time4(starting1),time4(ending1),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.4 -0.2 0 0.2 0.4],'YTickLabel',{'-2','-1','0','1','2'});

ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);

%% Seconder 2
figure();
plot(time2(starting2:ending2),is2(starting2:ending2));
hold on;
plot(xb,ix2_max(xb1:xb2),'-.','LineWidth',3)
hold on;
plot(xb,ix2_min(xb1:xb2),'-.','LineWidth',3)
ylim([-0.4 0.4])
xlim([time2(starting2) time2(ending2)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(time2(starting2),time2(ending2),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.4 -0.2 0 0.2 0.4],'YTickLabel',{'-2','-1','0','1','2'});

ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);
%% Seconder 3
figure();
plot(time3(starting2:ending2),is3(starting2:ending2));
hold on;
plot(xb,ix3_max(xb1:xb2),'-.','LineWidth',3)
hold on;
plot(xb,ix3_min(xb1:xb2),'-.','LineWidth',3)
ylim([-0.4 0.4])
xlim([time3(starting2) time3(ending2)])

set(gca,'FontName','Times New Roman','FontSize',12,'XTick',...
    linspace(time3(starting2),time3(ending2),9),'XTickLabel',...
    {'0','45','90','135','180','225','270','315','360'},'YTick',...
    [-0.4 -0.2 0 0.2 0.4],'YTickLabel',{'-2','-1','0','1','2'});

ylabel('Current (A)','FontSize',12);
xlabel('Mechanical Angle (\circ)','FontSize',12);



