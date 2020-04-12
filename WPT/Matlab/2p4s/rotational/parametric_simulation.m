
Vin_peak=127; %V   peak of the sinus
fop=156; %kHz
f=150e3; %Hz
R_Load=10; 
Ls=69e-6;    % secondary coil inductance
Lp=79e-6;    %primary inductance
Cp=1/(4*pi^2*f^2*Lp);  %primary compansation
Cs=1/(4*pi^2*f^2*Ls);  %secondary compansation
load('45.mat');

R=[0.3 0 0 0 0 0 ; ...
    0 0.3 0 0 0 0; ...
    0 0 0.2 0 0 0; ... 
    0 0 0 0.2 0 0; ...
    0 0 0 0 0.2 0 ; ...
    0 0 0 0 0 0.2 
    ];

sim('model');
figure(2);
hold off;
i=1;
 plot(AllData{i}.Values.Time,AllData{i}.Values.Data);
 
 hold on;
 i=2;
  plot(AllData{i}.Values.Time,AllData{i}.Values.Data);
   hold on;
%  i=9;
%   plot(AllData{i}.Values.Time,AllData{i}.Values.Data);
%    hold on;
%  i=10;
%   plot(AllData{i}.Values.Time,AllData{i}.Values.Data);