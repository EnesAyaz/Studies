% M-file create a plot of the torque-speed curve of the 
%   induction motor of Example 7-5. 
% First, initialize the values needed in this program.
r1 = 7.898e-3;                 % Stator resistance
x1 = 12.698e-3;               % Stator reactance
r2 = 5.272e-3;                % Rotor resistance
x2 = 11.283e-3;                 % Rotor reactance
xm = 0.3597;  % Magnetization branch reactance
rc=22.2;  % Core loss  resistance
v_phase = 380 / sqrt(3);    % Phase voltage
n_sync = 1200;              % Synchronous speed (r/min)
w_sync = 125.6637;             % Synchronous speed (rad/s)
% Calculate the Thevenin voltage and impedance from Equations
% 7-41a and 7-43.
v_th = v_phase * ( sqrt(xm^2+rc^2) / sqrt((r1+rc)^2 + (x1 + xm)^2) );
z_th = ((j*xm+rc) * (r1 + j*x1)) / (r1+rc + j*(x1 + xm));
r_th = real(z_th);
x_th = imag(z_th);
% Now calculate the torque-speed characteristic for many
% slips between 0 and 1.  Note that the first slip value 
% is set to 0.001 instead of exactly 0 to avoid divide-
% by-zero problems.
s = (0:1:50) / 50;           % Slip
s(1) = 0.001;
nm = (1 - s) * n_sync;       % Mechanical speed
% Calculate torque for original rotor resistance
for ii = 1:51
   t_ind1(ii) = (3 * v_th^2 * r2 / s(ii)) / ...
            (w_sync * ((r_th + r2/s(ii))^2 + (x_th + x2)^2) );
end
% Calculate torque for doubled rotor resistance

% Plot the torque-speed curve
plot(nm,t_ind1,'Color','k','LineWidth',2.0);
hold on;
xlabel('\itn_{m}','Fontweight','Bold');
ylabel('\tau_{ind}','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
legend ('Original R_{2}');
grid on;
hold off;