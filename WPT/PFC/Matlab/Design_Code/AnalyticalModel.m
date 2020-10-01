theta=linspace(0,2*pi,1000);
f=sin(theta);
figure();
plot(theta,f);
hold on;
f=abs(f);
plot(theta,f,'--');
%%

[xData, yData] = prepareCurveData( theta, f );

% Set up fittype and options.
ft = fittype( 'sin4' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf];
opts.StartPoint = [0.998529199868313 0.5 2.02698916400765e-17 0.423748189297578 1 1.5707963267949 0.339694057368306 2 -1.5707963267949 0.06474087659972 4 -1.5707963267949];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'f vs. theta', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel theta
ylabel f
grid on