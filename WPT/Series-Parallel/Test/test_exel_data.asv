%% Inductance Matrix
%  Lp   Mp1s1  Mp1s2
%  ---  Ls1    Ms1s2
%  ---  ---    Ls2
% Equal Inductance
L_equal =[84e-6, 183.3e-6,183e-6; ...
    183.3e-6, 67.3e-6, 67.3e-6+66.8e-6 ;... 
    183e-6,     67.3e-6+66.8e-6,66.8e-6];

M_equal= [L_equal(1,1), (L_equal(1,2)-L_equal(1,1)-L_equal(2,2))/2 ,(L_equal(1,3)-L_equal(1,1)-L_equal(3,3))/2 ;...
           NaN,     L_equal(2,2), NaN ; ...
           NaN,   NaN,   L_equal(3,3)] 
       
% Unbalance Inductance
L_unequal =[84e-6, 180.2e-6,186.8e-6; ...
    180.2e-6, 67.4e-6, 67.3e-6+67.4e-6 ;... 
    186.8e-6,     67.3e-6+67.4e-6,67.4e-6];

M_unequal= [L_unequal(1,1), (L_unequal(1,2)-L_unequal(1,1)-L_unequal(2,2))/2 ,(L_unequal(1,3)-L_unequal(1,1)-L_unequal(3,3))/2 ;...
           NaN,     L_equal(2,2), NaN ; ...
           NaN,   NaN,   L_equal(3,3)] 

%% Seperate Loads
f= [120,130,140,150,160,170,180];
Vin=[30,30,30,30,30,30,30];
Iin=[0.25,0.72,1.69,1.72,1.18,0.71,0.43 ];

module_1_current=[26,50,81.4,82.7,70.5,54.2,40.5];
module_1_voltage=[9,17.6,29,30.14,24.9,19.1,14.8];

module_2_current=[22,45.5,75.5,78.6,68.2,53.2,41];
module_2_voltage=[9.5,18.44,30.25,31.4,26,19.9,15.5];
%%
figure();
plot(f,Vin,f,Iin*10,f,Vin.*Iin);

module_1_power= (module_1_current.*module_1_voltage)/100;
module_2_power= (module_2_current.*module_2_voltage)/100;

figure()
plot(f,module_1_power);
hold on;
plot(f,module_2_power);

%%  Unequal 
f= [120,130,140,150,160,170,180];
Vin=[30,30,30,30,30,30,30];
Iin=[0.25,0.71,1.66,1.72,1.2,0.72,0.44 ];

module_1_current=[22,46.3,74.3,76.2,64.5,48.5,36.5];
module_2_current=[28,56,89.5,91.5,77.3,59.2,44.5];

module_1_voltage=[8.14,15.88,26.13,27.5,22.83,17.55,13.6];
module_2_voltage=[10.2,19.72,32.2,33.6,27.95,21.46,16.6];

figure();
plot(f,Vin,f,Iin*10,f,Vin.*Iin);

module_1_power= (module_1_current.*module_1_voltage)/100;
module_2_power= (module_2_current.*module_2_voltage)/100;

figure()
plot(f,module_1_power);
hold on;
plot(f,module_2_power);
hold on;
plot(f,100*module_1_power./module_2_power);

      