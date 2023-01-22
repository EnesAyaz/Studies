total_height=61.4e-3; % slot copper height for single copper
insulation=0.21e-3;
total_width=16e-3;


RDC=[];
RAC=[];
strand=[];
skin_depth=9.22e-3;
for numberOfverticalStrand=1:40

width_strand=7.69e-3;
length=0.9*2;
% numberOfverticalStrand=23;
numberOfhorizontalStrand=2;

height_strand=(total_height/numberOfverticalStrand)-insulation;

ro=1.72e-8;
DC_resistance=ro*length/((width_strand*height_strand));

DC_resistance=DC_resistance/(numberOfverticalStrand*numberOfhorizontalStrand);
RDC=[RDC DC_resistance];

if height_strand<skin_depth
    RAC=[RAC 0];
else 
  RAC=[RAC, DC_resistance*((height_strand/skin_depth)-1)]  ; 
end

strand=[strand numberOfverticalStrand*numberOfhorizontalStrand];
end

%%
figure();
plot(strand,RDC)
hold on;
plot(strand,RAC)
hold on;
plot(strand,RAC+RDC)



%%
I=1860; 
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
% plot1 = plot(X1,YMatrix1,'Parent',axes1);
plot1 =plot(strand,RDC,'Parent',axes1);
plot2=plot(strand,RAC,'Parent',axes1);
plot3=plot(strand,(RAC+RDC),'Parent',axes1);


set(plot1,'DisplayName','DC resistance','Marker','|','Color',[0 0 0],'LineWidth',1);
set(plot2,'DisplayName','AC resistance','Marker','x','Color',[1 0 0]),'LineWidth',1;
set(plot3,'DisplayName','Total resistance','Marker','v','Color',[1 0 1],'LineWidth',1);


grid on;
grid minor;

set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.7,...
    'GridColor',[0.0745098039215686 0.623529411764706 1],'MinorGridAlpha',0.7,...
    'MinorGridColor',[0.0745098039215686 0.623529411764706 1],'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on');

% Create ylabel
ylabel({'Resistance (\Omega)'},'FontSize',16,'FontName','Times New Roman');

% Create xlabel
xlabel({'Number of Strands'},'FontSize',16);

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties


% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.563095243470299 0.624206340913283 0.27142856605351 0.147619043574447],...
    'FontSize',14);


%%

I=1860; 
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
% plot1 = plot(X1,YMatrix1,'Parent',axes1);
plot1 =plot(strand,RDC*I*I,'Parent',axes1);
plot2=plot(strand,RAC*I*I,'Parent',axes1);
plot3=plot(strand,(RAC+RDC)*I*I,'Parent',axes1);


set(plot1,'DisplayName','DC Loss','Marker','|','Color',[0 0 0],'LineWidth',1);
set(plot2,'DisplayName','AC Loss','Marker','x','Color',[1 0 0],'LineWidth',1);
set(plot3,'DisplayName','Total Loss','Marker','v','Color',[1 0 1],'LineWidth',1);


grid on;
grid minor;

set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.7,...
    'GridColor',[0.0745098039215686 0.623529411764706 1],'MinorGridAlpha',0.7,...
    'MinorGridColor',[0.0745098039215686 0.623529411764706 1],'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on');

% Create ylabel
ylabel({'Loss (Watt)'},'FontSize',16,'FontName','Times New Roman');

% Create xlabel
xlabel({'Number of Strands'},'FontSize',16);

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties


% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.563095243470299 0.624206340913283 0.27142856605351 0.147619043574447],...
    'FontSize',14);

%%

RDC=3.5584e-5;
RDC_passive=RDC/2;
RDC_active=RDC/2;

RDC_active_st=RDC_active*4;

I=1860;

P=(-3*I/2)^2*RDC_active_st+(-I/2)^2*RDC_active_st+(I/4)^2*RDC_active_st+(3*I/4)^2*RDC_active_st+61.5

P=(-3*I/4)^2*RDC_active_st+(-I/4)^2*RDC_active_st+61.5






