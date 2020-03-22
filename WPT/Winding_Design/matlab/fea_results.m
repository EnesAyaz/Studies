% seconder mutual inductance changes with respect to mechanical angle
% starting angle is taken as primer and seconder are aligned with one edge.
% and seconder move to inside of the primer 1. 
%slope is 2

angle=0:10:360;
a= [ 0.34 0.33 0.32 0.31 0.31 0.31 ... 
                    0.31 0.32 0.33 0.34 0.32 0.27 ...
                     0.22 0.16 0.11 0 0 0 0];
                 
                 
b= [0 0 0 0 0 0 ... 
                 0 0 0 0 0 0 ...
              0 0.11 0.16 0.22 0.27 0.32 0.34 ];

mutual_primer_1= [a b(2:end)];  

mutual_primer_2= [b a(2:end)];
          
          
figure();
stairs(angle,mutual_primer_1,'LineWidth',3)
hold on;
stairs(angle,mutual_primer_2,'LineWidth',3)
hold on;
title('Coupling Coefficient for a seconder between primaries');
legend('Seconder with primer 1','Seconder with  primer 2')


figure();
stairs(angle,mutual_primer_1+mutual_primer_2,'LineWidth',3);
title('Resultant Coupling Coefficient ');
ylim([0 0.35])

%% slope 5 


angle=0:10:360;
a= [ 31 30 29 27 27 27 28 28 30 31 31 26 21 16 11 6 0 -3 -4];
a=a/100;                 
                 
b= [-4 -3 -3 -3 -3 -3 -3 -3 -3 -4 -3 1 5 11 16 21 26 30 31];
b=b/100;

mutual_primer_1= [a b(2:end)];  

mutual_primer_2= [b a(2:end)];
          
          
figure();
stairs(angle,mutual_primer_1,'LineWidth',3)
hold on;
stairs(angle,mutual_primer_2,'LineWidth',3)
hold on;
title('Coupling Coefficient for a seconder between primaries');
legend('Seconder with primer 1','Seconder with  primer 2')


figure();
stairs(angle,mutual_primer_1+mutual_primer_2,'LineWidth',3);
title('Resultant Coupling Coefficient ');
ylim([0 0.35])


