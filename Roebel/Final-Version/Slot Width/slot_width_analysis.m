%% Parameters
Iph=1860;% in A % phase current rms
length=0.925*600; % in m % Total copper length in active region
total_height=64.08e-3; % in m % slot copper height for single copper without main insulation
insulation=0.21e-3;   % in m % strand-to-strand insulation length
total_width=22e-3;    % in m % total slot width 
main_insulation=6e-3;   % in m  % total insulation between copper and slots
copper_width=total_width-main_insulation; % in m % total copper width 
width_strand=7.69e-3; % in m % strand width 
ro=2.0968e-8;         % in Ohm*m  % resistivity at 125 degree
k=2.4;                % unitless % (endwinding+active)/active region ratio 
mu0=4*pi*1e-7;        % permeability
f=50;                 % in 1/s % frequency of the current
%% Arrays
height_strand_X=[];  % in m  % array recording different strand heights 
                     % according to number of vertical...
                     % strands and slot copper height for single copper
Pdc_tot=[];          % in kW % Total DC loss consisting both top and 
                     % bottom windings
P_eddy_tot=[];       % in kW % Total Eddy loss consisting both top and
                     % bottom windings.  Not include circulation current 
                     % which is eliminated by roebel transposition
strand=[];           % array recording the number of vertical strands 
                     % numberOfverticalStrand
TopBottom=[];        % Eddy losses ratio of top to bottom coils


numberOfverticalStrand=20;  % number of  vertical strands 
numberOfhorizontalStrand=2; % number of  horizontal strands 

range_of_slot_width=20e-3:0.5e-3:24e-3; % determine the slot width range for
                                        % for this analysis


for total_width=range_of_slot_width
    
copper_width=total_width-main_insulation; % in m % total copper width
                                          % respecting total_width
    
Bmax=(2*mu0*Iph)/(total_width); % Maximum tangential B, generated by coils
                                % We have two coils, called top and bottom
                                % Top coil is the coil close to airgap
                                % Bottom coil is the coil far away from 
                                % to airgap

B=linspace(0,Bmax,numberOfverticalStrand*2); % B for each strand 
                             % First half of the array belongs to top   
                             % Latter half of the array belongs to bottom 


Ke= pi^2/(6*ro);              % The constant for eddy losses

width_strand=copper_width/2;
                              % The width for strand according to 
                              % slot width

height_strand=(total_height/numberOfverticalStrand)-insulation;
                             % the height for strand

DC_resistance=ro*length*k/((width_strand*height_strand)); 
                                % DC resistance for unit area included both
                                % active and endwinding region
                                % for both top and bottom coil
DC_resistance=DC_resistance/(numberOfverticalStrand*numberOfhorizontalStrand);
                                % DC resistance for unit area included both
                                % active and endwinding region
                                % for both top and bottom coil
                                                              
Pdc=Iph^2*DC_resistance;        % DC losses for the indexed strand


volume=numberOfhorizontalStrand*width_strand*height_strand*length; 
                                % strand volume for each vertical level
                                % included 2 horizontal strand

Peddy= Ke*B.^2*f^2*height_strand^2*volume;
                                % Eddy losses for each vertical level

Pdc_tot=[Pdc_tot Pdc];               % Total DC losses for the
                                     % indexed strand number

P_eddy_tot=[P_eddy_tot sum(Peddy)];  % Total Eddy losses for the
                                     % indexed strand number

                                     
TopBottom=[TopBottom ...
    sum(Peddy(1:numberOfverticalStrand/2))/...
    sum(Peddy(numberOfverticalStrand/2+1:end))];
                                     % Eddy losses ratio of top 
                                     % to bottom coils
                

                   
                             
end
%%

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% yyaxis(axes1,'left');
plot(range_of_slot_width,(P_eddy_tot)/1e3,'LineStyle',"-",'Color','r' ...
    ,'Marker','x','MarkerSize',10,'MarkerFaceColor','r');
hold on;
plot(range_of_slot_width,(Pdc_tot)/1e3,'LineStyle',"-",'Color','b' ...
     ,'Marker','o','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(range_of_slot_width,(P_eddy_tot+Pdc_tot)/1e3,'LineStyle',"-",'Color','k' ...
     ,'Marker','None','MarkerSize',5,'MarkerFaceColor','k');
ylabel('Losses (kW)')
hold on;
set(axes1,'YColor',[0 0 0]);
legend('Eddy Losses','DC Losses','Total Losses')

title(strcat("Total Strand Number ",string(2*numberOfverticalStrand)))

xlabel('Slot Width')
ax = gca; % current axes
ax.FontSize = 15;
ax.FontName= 'Times New Roman';
xlim([min(range_of_slot_width) max(range_of_slot_width)])

grid on;
grid minor;


