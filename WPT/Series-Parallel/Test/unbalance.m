% Unbalance Inductance
L_unequal =[84e-6, 180.2e-6,186.8e-6; ...
    180.2e-6, 67.4e-6, 67.3e-6+67.4e-6 ;... 
    186.8e-6,     67.3e-6+67.4e-6,67.4e-6];

M_unequal= [L_unequal(1,1), (L_unequal(1,2)-L_unequal(1,1)-L_unequal(2,2))/2 ,(L_unequal(1,3)-L_unequal(1,1)-L_unequal(3,3))/2 ;...
           NaN,     L_equal(2,2), NaN ; ...
           NaN,   NaN,   L_equal(3,3)];
%% Define 
f= [120,130,140,150,160,170,180];
Vin=[30,30,30,30,30,30,30];
       
%% Sepearate Load

Iin_seperate=[0.25 0.71 1.66 1.72 1.2 0.72 0.44 ];

module_1_current_seperate=[22 46.3 74.3 76.2 64.5 48.5 36.5];
module_1_voltage_seperate=[8.14 15.88 26.13 27.5 22.82 17.55 13.6];

module_2_current_seperate=[28 56 89.5 91.5 77.3 59.2 44.5];
module_2_voltage_seperate=[10.25 19.72 32.2 33.6 27.95 21.46 16.6];


module_1_power_seperate= (module_1_current_seperate.*module_1_voltage_seperate)/100;
module_2_power_seperate= (module_2_current_seperate.*module_2_voltage_seperate)/100;

figure();
plot(f,module_1_power_seperate)
hold on;
plot(f,module_2_power_seperate)

%% Series Module
 
Iin_series=[ 0.26 0.72 1.67 1.72 1.2 0.72 0.44 ];

module_t_voltage_series=[18.67 35.9 58.91 61.8 51.21 39.37 30.40];

module_1_current_series=[25.4 51.2 82.5 81.4 71.5 54.5 40.5];


module_2_current_series=[25.9 51 81.2 85 70.5 54 42];
module_2_voltage_series=[10.96 20.25 32.78 34.3 28.83 22.6 17.96];

module_1_voltage_series=module_t_voltage_series-module_2_voltage_series;


module_1_power_series= (module_1_current_series.*module_1_voltage_series)/100;
module_2_power_series= (module_2_current_series.*module_2_voltage_series)/100;

figure();
plot(f,module_1_power_series)
hold on;
plot(f,module_2_power_series)
hold on;
plot(f,100*module_2_power_series./(module_1_power_series+module_2_power_series))
%%

%% Parallel Module
 
Iin_parallel=[ 0.26 0.84 1.57 1.59 1.33 0.76 0.45];

module_1_current_parallel=[15.3 7 2 9 35.4 37.9 32.4];
module_1_voltage_parallel=[9.26 19.51 28.5 29.2 26.92 20.22 15.44];

module_2_current_parallel=[35.5 105.4 160.5 156 116.5 74.5 50.2];
module_2_voltage_parallel=[9.26 19.51 28.5 29.2 26.92 20.22 15.44];


module_1_power_parallel= (module_1_current_parallel.*module_1_voltage_parallel)/100;
module_2_power_parallel= (module_2_current_parallel.*module_2_voltage_parallel)/100;

figure();
plot(f,module_1_power_parallel)
hold on;
plot(f,module_2_power_parallel)
hold on;
plot(f,100*module_2_power_parallel./(module_2_power_parallel+module_1_power_parallel))

