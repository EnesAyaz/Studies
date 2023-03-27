Vin=[40.3 40.3 40.3 40.3 40.3 40.3];

Iin= [4.59 4.65 4.67 3.86 4.81 3.47];

Vout=[25.69 25.8 25.78 22.77 25.54 21.68];

Iout=[5.30 5.22 5.19 5.028 5.101 4.759];


eff=((Vout.*Iout)./(Vin.*Iin))*100
P=Vout.*Iout

% a-aligned
% b-alinged 
% b1-aligned
% b1-misaligned
% a-misaligned
% b-misaligned
%%
Vin=[20.1 40.3 40.3 40.3];

Iin= [1.42 4.87 5.24 1.98];

Vout=[8.37 25.57 26.46 13.07];

Iout=[1.947 5.515 5.687 2.868];


eff=((Vout.*Iout)./(Vin.*Iin))*100
P=Vout.*Iout

% strong misaligned-con
% strong misaligned- bizim
% short- bizim
% short- con



