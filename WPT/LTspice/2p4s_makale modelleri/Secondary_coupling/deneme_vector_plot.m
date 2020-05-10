p0 = [0 0];     % Coordinate of the first point p0

load('param.mat');
w=2*pi*150e3;
i=2;
Lp= 88e-6;
Ls=68.8e-6;
M1= param.k1(i)*sqrt(Lp*Ls);
M2 = param.k2(i)*sqrt(Lp*Ls);
Ms= -param.ks(i)*Ls;
Vin= param.Vin(i)*sqrt(2);
Vout1= param.Vout1(i)*sqrt(2);
Vout2= param.Vout2(i)*sqrt(2);
Is1= param.Is1(i)*sqrt(2);
Is2= param.Is2(i)*sqrt(2);
Ip= param.Ip(i)*sqrt(2);
alpha= param.alpha(i);
beta= param.beta(i);
theta= -param.theta(i);

%%
Is1v=[Is1*cosd(alpha), Is1*sind(alpha)];
Is2v=[Is2*cosd(beta), Is2*sind(beta)];
Ipv=[Ip*cosd(theta), Is1*sind(theta)];
Vout1v=[Vout1*cosd(alpha), Vout1*sind(alpha)];
Vout2v=[Vout2*cosd(beta), Vout2*sind(beta)];
Vinv= [ Vin 0];

%%

figure('name','Input-Output Current and Voltages');
vector_script(p0,Is1v,'r',0.15);
hold on; 
% vector_script(p0,Vout1,'m');
% grid on;
% vector_script(p0,Vout2,'c');
% grid on;
vector_script(p0,Vinv/10,'b',0.1);
% vector_script(p0,Vout1v/10,'c',0.1);
% vector_script(p0,Vout2v/10,'y',0.1);
vector_script(p0,Is2v,'g',0.2);
vector_script(p0,Ipv,'m',0.1);
plot([0,0], [-100 100],'--k')
plot([-100,100], [0 0],'--k')
axis equal;
xlim([-5 15]);
set(gca,'xtick',[])
set(gca,'ytick',[])
% ylim([-20 5]);
% axh = gca; % use current axe
% linestyle = '-'; % dotted
% line(get(axh,'XLim'), [0 0], 'Color', color, 'LineStyle', linestyle,'LineWidth',1);
% line([0 0], get(axh,'YLim'), 'Color', color, 'LineStyle', linestyle,'LineWidth',1);




%%