Iph=1860; %% phase current
%%
length=0.9;
total_height=61.4e-3; % slot copper height for single copper
insulation=0.21e-3;
total_width=16e-3;
%%
TopBottom=[];
Pdc_tot=[];
P_eddy_tot=[];
strand=[];

for numberOfverticalStrand=10:2:60
% numberOfverticalStrand=6;
numberOfhorizontalStrand=2;

mu0=4*pi*1e-7;
Bmax=(2*mu0*Iph)/(total_width); % We have two coils top and bottom, top is airgap 

B=linspace(0,Bmax,numberOfverticalStrand*2);

f=50;
ro=2.0968e-8;
Ke= pi^2/(6*ro);

width_strand=7.69e-3;

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

Pdc_tot=[Pdc_tot 2*Pdc];
P_eddy_tot=[P_eddy_tot sum(Peddy)];

TopBottom=[TopBottom sum(Peddy(1:numberOfverticalStrand/2))/sum(Peddy(numberOfverticalStrand/2+1:end))];

strand=[strand numberOfverticalStrand];
end

%%
plot(strand,Pdc_tot)
hold on;
plot(strand,P_eddy_tot/2)
%%
figure();
plot(strand,P_eddy_tot./Pdc_tot)


