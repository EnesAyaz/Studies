clear all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                       *              
%   |Vp1|   |Lp1   Mp12  Mp1s1 Mp1s2 Mp1s3 Mp1s4 |    |Ýp1|     
%   |Vp2|   |Mp12  Lp2   Mp2s1 Mp2s2 Mp2s3 Mp2s4 |    |Ýp2|        
%   |Vs1|   |Mp1s1 Mp2s1 Ls1   Ms1s2 Ms1s3 Ms1s4 |    |Ýs1|
%   |Vs2| = |Mp1s2 Mp2s2 Ms1s2 Ls2   Ms2s3 Ms2s4 | X  |Ýs2| +  R * I
%   |Vs3|   |Mp1s3 Mp2s3 Ms1s3 Ms2s3 Ls3   Ms3s4 |    |Ýs3|
%   |Vs4|   |Mp1s4 Mp2s4 Ms1s4 Ms2s4 Ms3s4 Ls4   |    |Ýs4|
%   V=L* (dI)/(dt) + R*I
%   L ve R simetrik matrix olmak zorunda.
%   M<L
%
%     |M11 M12|
%  M= |M21 M22|
clc;


%% FILL INFORMATION BELOW
num_of_primary=3;       %number of primary coils
num_of_secondary=3;     %number of secondary coils    
primary_self=82.2;               %in uH
secondary_self=63.6;              %in uH
pp_mutual= 0 ;                  %in uH
ss_mutual=15;                  %in uH
Vin_peak=100*sqrt(2); %V   peak of the sinus
fop=202; %kHz
R_primary=2; %in miliohms
R_secondary=3; %in miliohms
P_cont=1;
I_cont=10;
M12=[ 15 5 2; 2 15 5; 5 2 15];
                                %mutual couplings of the primary and secondary coils
       
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
 