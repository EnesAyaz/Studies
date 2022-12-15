%% 6 phase 
% Parallel
R1=0.000789831;
X1=0.0126978;
R2=0.00052717;
X2=0.0112829;
Rc=22.2001;
Xm=0.359696;

% Series 
% R1=0.00315932;
% X1=0.0510511;
% R2=0.00210868
% % R2=0.008
% X2=0.0451316
% % X2=0.02
% Rc=88.8006;
% Xm=1.43878;

Jm= 2;
fs=60;

L1=X1/2/pi/fs
L2=X2/2/pi/fs
Lm=Xm/2/pi/fs
s=-1:0.001:0;

Z1= R1+1i*X1;
Z2= 1/(1/Rc + 1/(1i*Xm));
Z3=R2+1i*X2;
Z4=R2.*(1-s)./s;

Zth=1/(1/Z1+1/Z2);
Rth=real(Zth);
Xth=imag(Zth);
Zin6= (Zth+Z3)*ones(size(Z4))+Z4;

Vin=700/sqrt(3);
Vth= abs(Z2/(Z2+Z1)*Vin);
ws=2*pi*fs;
Te6= 3*(3*Vth^2./((Rth+(R2./s)).^2+(Xth+X2).^2)).*(R2./(s*ws));
w=1-s;


figure();
plot(fs*20*w,abs(Te6/1000))
hold on
plot(H_z,abs(Torque))

%%
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["H_z", "Torque"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
tbl = readtable("D:\Github\Studies\WindTurbine\Giris Torku vs Hiz2.csv", opts);
H_z = tbl.H_z;
Torque = tbl.Torque;
clear opts tbl

% Create figure
figure1 = figure;
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.111618122977346 0.775 0.815]);
hold(axes1,'on');
plot(fs*20*w,abs(Te6/1000),'DisplayName','Equivalent circuit model','LineWidth',1,...
    'Color',[1 0 0]);

% Create plot
plot(H_z,abs(Torque),'SeriesIndex',3,'DisplayName','3-phase rmxprt model',...
    'LineWidth',1,...
    'Color',[0 0 1]);

% Create ylabel
ylabel({'Torque (kN.m)'});

% Create xlabel
xlabel({'Speed (RPM)'});

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',15,'GridAlpha',0.5,...
    'GridColor',[0 0 0],'LineWidth',1,'MinorGridAlpha',0.5,'MinorGridColor',...
    [0 0 0],'XMinorGrid','on','YMinorGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.472049498551226 0.6084142394822 0.397973941134993 0.117179070998229],...
    'FontSize',15);

