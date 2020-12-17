% Equal Inductance
L_equal =[84e-6, 183.3e-6,183e-6; ...
    183.3e-6, 67.3e-6, 67.3e-6+66.8e-6 ;... 
    183e-6,     67.3e-6+66.8e-6,66.8e-6];

M_equal= [L_equal(1,1), (L_equal(1,2)-L_equal(1,1)-L_equal(2,2))/2 ,(L_equal(1,3)-L_equal(1,1)-L_equal(3,3))/2 ;...
           NaN,     L_equal(2,2), NaN ; ...
           NaN,   NaN,   L_equal(3,3)] ;
%% Define 
f= [120,130,140,150,160,170,180];
Vin=[30,30,30,30,30,30,30];
       
%% Sepearate Load

Iin_seperate=[0.25,0.72,1.69,1.72,1.18,0.71,0.43 ];

module_1_current_seperate=[26,50,81.4,82.7,70.5,54.2,40.5];
module_1_voltage_seperate=[9,17.6,29,30.14,24.9,19.1,14.8];

module_2_current_seperate=[22,45.5,75.5,78.6,68.2,53.2,41];
module_2_voltage_seperate=[9.5,18.44,30.25,31.4,26,19.9,15.5];


module_1_power_seperate= (module_1_current_seperate.*module_1_voltage_seperate)/100;
module_2_power_seperate= (module_2_current_seperate.*module_2_voltage_seperate)/100;

figure();
plot(f,module_1_power_seperate)
hold on;
plot(f,module_2_power_seperate)

%% Series Module
 
Iin_series=[ 0.25 0.71 1.68 1.71 1.19 0.72 0.44 ];

module_t_voltage_series=[18.4 35.95 59 61.54 51.11 39.33 30.45];

module_1_current_series=[24.3 51.2 82.9 84.5 72.2 55.5 41];


module_2_current_series=[24 47.3 75.5 80 69.9 53.5 40.5];
module_2_voltage_series=[9.84 18.81 30.66 32 26.7 20.7 16.22];

module_1_voltage_series=module_t_voltage_series-module_2_voltage_series;


module_1_power_series= (module_1_current_series.*module_1_voltage_series)/100;
module_2_power_series= (module_2_current_series.*module_2_voltage_series)/100;

figure();
plot(f,module_1_power_series)
hold on;
plot(f,module_2_power_series)
%%

%% Parallel Module
 
Iin_parallel=[ 0.25 0.73 1.67 1.72 1.19 0.72 0.44 ];

module_1_current_parallel=[22.7 39 15 57 63.7 50.4 38.9];
module_1_voltage_parallel=[9.27 18.9 29.33 30.75 25.56 19.63 15.9];

module_2_current_parallel=[23 56 138 104.3 75.5 56.2 41.2];
module_2_voltage_parallel=[9.27 18.9 29.33 30.75 25.56 19.63 15.9];


module_1_power_parallel= (module_1_current_parallel.*module_1_voltage_parallel)/100;
module_2_power_parallel= (module_2_current_parallel.*module_2_voltage_parallel)/100;

figure();
plot(f,module_1_power_parallel)
hold on;
plot(f,module_2_power_parallel)


