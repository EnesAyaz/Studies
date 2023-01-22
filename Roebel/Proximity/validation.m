Iph=1860; %% phase current
%%
length=375;
total_height=48.3e-3; % slot copper height for single copper
insulation=0.3e-3;
total_width=11.7e-3;
%%
k=1.5; % endwinding ratio
TopBottom=[];
Pdc_tot=[];
P_eddy_tot=[];
strand=[];

for numberOfverticalStrand=[6 10 20]
% numberOfverticalStrand=6;
numberOfhorizontalStrand=2;

total_width=10.8e-3;
mu0=4*pi*1e-7;
Bmax=(2*mu0*Iph)/(total_width); % We have two coils top and bottom, top is airgap 

B=linspace(0,Bmax,numberOfverticalStrand*2);

f=50;
ro=2.0968e-8;
Ke= pi^2/(6*ro);

width_strand=5.4e-3;

height_strand=(total_height/numberOfverticalStrand)-insulation;



DC_resistance=ro*length*2/((width_strand*height_strand));
DC_resistance=DC_resistance/(numberOfverticalStrand*numberOfhorizontalStrand);

Pdc=Iph^2*DC_resistance;

volume=2*width_strand*height_strand*length;

Peddy= Ke*B.^2*f^2*height_strand^2*volume;

% plot(Peddy)
% Pdc=Pdc/(numberOfverticalStrand*2)
% hold on;
sum(Peddy)/(2*Pdc);

Pdc_tot=[Pdc_tot k*Pdc];
P_eddy_tot=[P_eddy_tot sum(Peddy)];

TopBottom=[TopBottom sum(Peddy(1:numberOfverticalStrand/2))/sum(Peddy(numberOfverticalStrand/2+1:end))];

strand=[strand numberOfverticalStrand];
end

%%
figure();
bar(strand,[Pdc_tot/1000; P_eddy_tot/2000])
hold on;
legend
% bar(strand,P_eddy_tot/2000)
%%
figure();
plot(strand,[0.8592 0.2784 0.0528],'LineStyle',"-",'Color','r','Marker','x','MarkerSize',10,'MarkerFaceColor','r');
hold on;
plot(strand,(P_eddy_tot/2)./Pdc_tot,'LineStyle',"--",'Color','b','Marker','o','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(strand,[0.8592 0.2784 0.0528]-(P_eddy_tot/2)./Pdc_tot,'LineStyle',"--",'Color','k','Marker','^' ...
    ,'MarkerSize',5,'MarkerFaceColor','k');
legend('Znidarich (p.u)','Us (p.u)','Error (p.u)')
xlabel('Vertical Strands')
ax = gca; % current axes
ax.FontSize = 15;
xticks([6 12 20])
yticks(0:0.2:1)
xlim([6 20])
ylim([0 1])
grid on;
grid minor;
title('')




