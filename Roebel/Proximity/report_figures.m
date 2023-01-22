length=0.9;
total_height=61.4e-3; % slot copper height for single copper
insulation=0.21e-3;
total_width=16e-3;
ro=2.0968e-8;
numberOfhorizontalStrand=2;

numberOfverticalStrand_X=[];
height_strand_X=[];
DC_resistance_X=[];

for numberOfverticalStrand=1:2:50
    
width_strand=7.69e-3;
height_strand=(total_height/numberOfverticalStrand)-insulation;

numberOfverticalStrand_X=[numberOfverticalStrand_X numberOfverticalStrand];
height_strand_X=[height_strand_X height_strand];

DC_resistance=ro*length*2/((width_strand*height_strand));
DC_resistance=DC_resistance/(numberOfverticalStrand*numberOfhorizontalStrand);

DC_resistance_X=[DC_resistance_X DC_resistance];






end
%%
figure();
plot(numberOfverticalStrand_X,DC_resistance_X/DC_resistance_X(1),'LineStyle',"-",'Color','r','Marker','x','MarkerSize',10,'MarkerFaceColor','r');

xlabel('Vertical Strands')
ylabel('DC Resistance (p.u) ')
ax = gca; % current axes
ax.FontSize = 15;
ax.FontName= 'Times New Roman';
%yticks(0:0.2:1)
xlim([1 numberOfverticalStrand])
xticks(1:5:numberOfverticalStrand)
% ylim([0 1])
grid on;
% grid minor;
