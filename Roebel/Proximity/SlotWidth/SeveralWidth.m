Iph=1860; %% phase current
%%
length=0.925*600;
total_height=64.08e-3; % slot copper height for single copper
insulation=0.21e-3;
% total_width=16e-3;
total_width=21.8e-3;
main_insulation=6e-3;
copper_width=total_width-main_insulation;
ro=2.0968e-8;

height_strand_X=[];
%%
k=2.4; % endwinding ratio
TopBottom=[];
Pdc_tot=[];
P_eddy_tot=[];
strand=[];
height_strand_X=[];
width_strand_X=[];

for total_width=20e-3:0.5e-3:24e-3

% total_width=21.8e-3;
main_insulation=6e-3;
copper_width=total_width-main_insulation;
    
numberOfverticalStrand=30;
numberOfhorizontalStrand=2;

mu0=4*pi*1e-7;
Bmax=(2*mu0*Iph)/(total_width); % We have two coils top and bottom, top is airgap 
B=linspace(0,Bmax,numberOfverticalStrand*2);

f=50;
ro=2.0968e-8;
Ke= pi^2/(6*ro);

width_strand=copper_width/2;

height_strand=(total_height/numberOfverticalStrand)-insulation;

DC_resistance=ro*length/((width_strand*height_strand));
DC_resistance=DC_resistance/(numberOfverticalStrand*numberOfhorizontalStrand);

Pdc=Iph^2*DC_resistance;

volume=2*width_strand*height_strand*length;

Peddy1= Ke*B.^2*f^2*height_strand^2*volume;

Peddy=[Peddy1(1),2*Peddy1(2:end-1),Peddy1(end)];

% plot(Peddy)
% Pdc=Pdc/(numberOfverticalStrand*2)
% hold on;
sum(Peddy)/(2*Pdc);

Pdc_tot=[Pdc_tot k*Pdc];
P_eddy_tot=[P_eddy_tot sum(Peddy)];

TopBottom=[TopBottom sum(Peddy(1:numberOfverticalStrand/2))/sum(Peddy(numberOfverticalStrand/2+1:end))];

strand=[strand numberOfverticalStrand];
height_strand_X=[height_strand_X height_strand];

width_strand_X=[width_strand_X total_width];
end
%%

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% yyaxis(axes1,'left');
plot(width_strand_X,(P_eddy_tot)/1e3,'LineStyle',"-",'Color','r' ...
    ,'Marker','x','MarkerSize',10,'MarkerFaceColor','r');
hold on;
plot(width_strand_X,(Pdc_tot)/1e3,'LineStyle',"-",'Color','b' ...
     ,'Marker','o','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(width_strand_X,(P_eddy_tot+Pdc_tot)/1e3,'LineStyle',"-",'Color','k' ...
     ,'Marker','None','MarkerSize',5,'MarkerFaceColor','k');
ylabel('Losses (kW)')
hold on;
set(axes1,'YColor',[0 0 0]);
legend('Eddy Losses','DC Losses','Total Losses')

% yyaxis(axes1,'right');
% plot(width_strand_X,1000*height_strand_X,'LineStyle',"-",'Color','b' ...
%     ,'Marker','x','MarkerSize',10,'MarkerFaceColor','b');
% ylabel('Strand Height (mm)')
% hold on;
% set(axes1,'YColor',[0 0 1]);

title(strcat("Strand Number ",string(2*numberOfverticalStrand)))

xlabel('Slot Width')
ax = gca; % current axes
ax.FontSize = 15;
ax.FontName= 'Times New Roman';
xlim([20e-3 24e-3])
%yticks(0:0.2:1)
% xlim([6 numberOfverticalStrand])
% xticks(6:3:numberOfverticalStrand)
% ylim([0 1])
grid on;
grid minor;


