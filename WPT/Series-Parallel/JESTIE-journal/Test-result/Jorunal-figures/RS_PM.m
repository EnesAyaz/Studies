figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gcf, 'Position',  [100, 100, 700, 300])

%%
frequency= [100 105 110 115 120 125 127 129 ...  
    131 133 135 140 145 150 155 160 162 164 166 168 ...
    170 172.5 175 177.5 180 185 190 195 199];
Is2=[192 212 222 233 245 248 221 185 127 85 47 ...
    30 30 30 50 102 122 137 143 160 206 270 310 350 390 432 440 445 460];
Is1=[260 295 335 390 465 600 635 712 777 850 912 ...
    1060 1245 1250 1235 1200 1200 1193 1170 1140 1080 1010 950 920 900 854 810 777 765];

plot1=stem(frequency,Is1./(Is1+Is2),'LineStyle','none');
set(plot1,'DisplayName','Experiment','Marker', ...
    'square','LineWidth',1,'Color',[1 0 0],'MarkerSize',8);
hold on;

kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Lrx=17.65e-6;
Ltx=23.75e-6;
Crx=65.7e-9;
Ctx=49.2;
frx=1/(sqrt(Lrx*Crx)*2*pi);
Rrx=5*8/pi/pi;
Qrx=(2*pi*frx*Lrx)/Rrx;
M1=3.86e-6; %  3.0711e-06
M2= 3.03e-6;
k1=M1/sqrt(Ltx*Lrx);
k2=M2/sqrt(Ltx*Lrx);
DeltaMk=(M1-M2)/M1;

for DeltaM=DeltaMk
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
 fx=[];
for f=100e3:1e3:200e3
    fx=[fx f/1000];
    w=f/frx;
    a=(Qrx*(w^2-wo^2))/(w*wo);
    b=(1-k^2);
    c=1/((b/a^2)+1);
    d=k^2- (((1-k^2)^2)/a^2);
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;

plot2=plot(fx,1./RL1k);
set(plot2,'DisplayName','Mathematical model' ...
    ,'LineWidth',1,'Color',[1 0 0],'MarkerSize',8);
kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Lrx=17.65e-6;
Ltx=23.75e-6;
Crx=65.7e-9;
Ctx=49.2;
frx=1/(sqrt(Lrx*Crx)*2*pi);
Rrx=5*8/pi/pi;
Qrx=(2*pi*frx*Lrx)/Rrx;
M1=3.86e-6; %  3.0711e-06
M2= 3.03e-6;
k1=M1/sqrt(Ltx*Lrx);
k2=M2/sqrt(Ltx*Lrx);
DeltaMk=(M1-M2)/M1;

for DeltaM=DeltaMk
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for i=1:length(frequency)
    w=1000*(frequency(i)/frx);
    a=(Qrx*(w^2-wo^2))/(w*wo);
    b=(1-k^2);
    c=1/((b/a^2)+1);
    d=k^2- (((1-k^2)^2)/a^2);
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;

k= Is1./(Is1+Is2);
k2 = 1./RL1k;
e=100*sum(abs(k-k2)./k)/length(k)
%%
frequency= [101 105 110 112 114 116 118 120 ...
    122 124 126 128 130 135 140 145 150 155 160 ...
    165 170 172 174 176 178 180 182 184 186 188 ...
    190 192.5 195 197.5 200];
Is2=[145 154 155 153 149 143 138 127 101 67 42 29 ...
    14 10 7 7 7 7 16 42 37 67 95 100 97 96 109 147 ...
    182 211 232 250 263 271 281];
Is1=[375 412 462 490 515 549 590 634 690 746 797 840 ...
    890 1005 1124 1245 1280 1265 1256 1210 1120,...,
   1072 1020 997 976 957 937 902 870 835 807 773 750 735 725 ];

plot3=stem(frequency,Is1./(Is1+Is2),'LineStyle','none');
set(plot3,'DisplayName','Experiment','Marker', ...
    'x','LineWidth',1,'Color',[0 0 1],'MarkerSize',8);
hold on;

kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Ltx=22.88e-6;
Lrx=17.1e-6;
Crx=65.7e-9;
Ctx=49.2;
frx=1/(sqrt(Lrx*Crx)*2*pi);
Rrx=5.1*8/pi/pi;
Qrx=(2*pi*frx*Lrx)/Rrx;
M1=4.1e-6; %  3.0711e-06
M2=2.445e-6;
k1=M1/sqrt(Ltx*Lrx);
k2=M2/sqrt(Ltx*Lrx);
DeltaMk=(M1-M2)/M1;

for DeltaM=DeltaMk
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
 fx=[];
for f=100e3:1e3:200e3
    fx=[fx f/1000];
    w=f/frx;
    a=(Qrx*(w^2-wo^2))/(w*wo);
    b=(1-k^2);
    c=1/((b/a^2)+1);
    d=k^2- (((1-k^2)^2)/a^2);
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;

plot2=plot(fx,1./RL1k);
set(plot2,'DisplayName','Mathematical model' ...
    ,'LineWidth',1,'Color',[0 0 1],'MarkerSize',8);

kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Ltx=22.88e-6;
Lrx=17.1e-6;
Crx=65.7e-9;
Ctx=49.2;
frx=1/(sqrt(Lrx*Crx)*2*pi);
Rrx=5.1*8/pi/pi;
Qrx=(2*pi*frx*Lrx)/Rrx;
M1=4.1e-6; %  3.0711e-06
M2=2.445e-6;
k1=M1/sqrt(Ltx*Lrx);
k2=M2/sqrt(Ltx*Lrx);
DeltaMk=(M1-M2)/M1;

for DeltaM=DeltaMk
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for i=1:length(frequency)
    w=1000*(frequency(i)/frx);
    a=(Qrx*(w^2-wo^2))/(w*wo);
    b=(1-k^2);
    c=1/((b/a^2)+1);
    d=k^2- (((1-k^2)^2)/a^2);
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;

k= Is1./(Is1+Is2);
k2 = 1./RL1k;
e=100*sum(abs(k-k2)./k)/length(k)

xlabel('Frequency($kHz$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');
ylabel('Power Distribution ($\frac{P_1}{P_1+P_2}$)','interpreter','Latex','FontSize',14,'FontName','Times New Roman');

hold(axes1,'off');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','southeast','FontSize',12,...
    'FontName','Times New Roman',...
    'EdgeColor','none',...
    'Color','none');
% Create textbox
annotation(figure1,'textbox',...
    [0.508428571428572 0.357333333333334 0.0538571428571428 0.0853333333333334],...
    'Color',[1 0 0],...
    'String','$\Delta M = 0.24$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.499857142857143 0.216000000000002 0.0538571428571429 0.0893333333333336],...
    'Color',[0 0 1],...
    'String','$\Delta M = 0.40$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.201000000000001 0.226666666666669 0.0475714285714285 0.0853333333333336],...
    'Color',[0 0 1],...
    'String','$ | \epsilon |= \%3.34$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.199285714285715 0.35066666666667 0.0475714285714285 0.0853333333333332],...
    'Color',[1 0 0],...
    'String','$ | \epsilon |= \%  4.31$',...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
