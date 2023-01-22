total_height=61.4e-3; % slot copper height for single copper
insulation=0.21e-3;
total_width=16e-3;

vStr=46;

ro=2.0968e-8;
PDC=[];
Pac2dct=[];
Pac2dcb=[];
for numberOfverticalStrand=10:vStr 
width_strand=7.69e-3;
MLT=0.9;
numberOfhorizontalStrand=2;

height_strand=(total_height/numberOfverticalStrand)-insulation;

DC_resistance=ro*MLT*2/((width_strand*height_strand));
DC_resistance=DC_resistance/(numberOfverticalStrand*numberOfhorizontalStrand);

I=1860;
PDC=[PDC DC_resistance*I^2];

Ke= pi^2/(6*ro);
f=50;
I_strand_ver=I/numberOfverticalStrand;

Peddyt=[];
mu_0=4*pi*1e-7;
for j=1:numberOfverticalStrand
Bmax=sqrt(2)*mu_0*(((j-1)+j)/2)*I_strand_ver/(width_strand*2);
volume=width_strand*height_strand*MLT;
Peddyt=[Peddyt Ke*Bmax^2*f^2*height_strand^2*volume];
end

Peddyb=[];
for j=1:numberOfverticalStrand
Bmax=sqrt(2)*mu_0*((((j-1)+j)/2)*I_strand_ver+I)/(width_strand*2);
volume=width_strand*height_strand*MLT;
Peddyb=[Peddyb Ke*Bmax^2*f^2*height_strand^2*volume];
end

Pac2dcb=[ Pac2dcb 2*sum(Peddyb) ];
Pac2dct=[ Pac2dct 2*sum(Peddyt)];

end

%%
strand=2*(10:vStr);
plot(strand,PDC)
hold on;
plot(strand,(Pac2dcb+Pac2dct)/2)
hold on;
plot(strand,(Pac2dcb+Pac2dct)/2+PDC)


%%
figure();
plot(B)
hold on;
% plot(Peddy)

%%
strand=1:numberOfverticalStrand;
figure();
plot(strand,Peddyt,'LineStyle',"-",'Color','b','Marker','o','MarkerSize',5,'MarkerFaceColor','b');
hold on; 
plot(strand,Peddyb,'LineStyle',"-",'Color','r','Marker','o','MarkerSize',5,'MarkerFaceColor','r');
hold on; 
plot(strand,Pdct/numberOfverticalStrand/numberOfhorizontalStrand,'LineStyle',"-",'Marker', ...
    'o','MarkerSize',5,'MarkerFaceColor','k','Color','k')
legend('Eddy Loss of Top','Eddy Loss of Bottom','DC Loss')
xlabel('Vertical Strands')


%%
Rac2dcb=2*sum(Peddyb)/ (MLT*DC_resistance*I^2 /1000);
Rac2dct=2*sum(Peddyt)/ (MLT*DC_resistance*I^2 /1000);
Rac2dcb/Rac2dct;

[2*sum(Peddyb) 2*sum(Peddyt) 2*sum(Peddyb)+2*sum(Peddyt) (MLT*DC_resistance*I^2/1000) ...
    (2*sum(Peddyb)+2*sum(Peddyt))/(2*(MLT*DC_resistance*I^2 /1000))]

2*sum(Peddyb)/(MLT*DC_resistance*I^2/1000) 

