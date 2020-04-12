
%% FILL INFORMATION BELOW
num_of_primary=2;       %number of primary coils
num_of_secondary=4;     %number of secondary coils    
primary_self=81;               %in uH
secondary_self=68;              %in uH
pp_mutual= -4.86 ;                  %in uH
ss_mutual=-4.08;                  %in uH
Vin_peak=127; %V   peak of the sinus
fop=156; %kHz
R_primary=200; %in miliohms
R_secondary=300; %in miliohms
P_cont=0.3;
I_cont=100;
Cp=13.85e-9;
Cs=16.36e-9;
M12=[ 17 17 0 0;             %mutual couplings of the primary and secondary coils
       0 0 17 17 ];
%         | Mp1s1 Mp1s2 Mp1s3 Mp1s4 |        
%  M12=  | Mp2s1 Mp2s2 Mp2s3 Mp2s4 |

%% Calculations
i=1:num_of_primary;
j=(num_of_primary+1):(num_of_primary+num_of_secondary);

R11=R_primary*eye(num_of_primary);
R22=R_secondary*eye(num_of_secondary);
R12=zeros(num_of_primary,num_of_secondary);
R=[R11 R12;R12' R22];

a=pp_mutual*ones(num_of_primary);
b=eye(num_of_primary)*primary_self;
M11=a-diag(diag(a))+b;
a=ss_mutual*ones(num_of_secondary);
b=eye(num_of_secondary)*secondary_self;
M22=a-diag(diag(a))+b;

M=[M11 M12; M12' M22];

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                   
 