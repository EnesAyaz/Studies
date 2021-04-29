syms k
syms Zs;
syms RL;
syms RL1;

a= k;
b=-2*RL;
c=k*Zs^2+RL^2;

ans=solve(a*RL1^2+ b*RL1+ c,RL1)
%%
kx=[];
fo=150e3;
wo=2*pi*150e3;
Ls=22e-6;
Cs= 1/(wo^2*Ls);
RL= 64;
M=9.7e-6; 
DeltaMx=[];

RL1k=[];
for DeltaM=0:0.097e-6:M
 DeltaMx=[DeltaMx, DeltaM/M];
 k=(2*DeltaM/M-DeltaM^2/M^2);
 kx=[kx k];
 RL1=[];
 wRL=[];
for  f=1e5:1e3:2e5
    w=2*pi*f;
    wRL=[wRL w/wo];
%     Zs=abs(1i*w*Ls+1./(1i*w*Cs));
    Zs= abs(1i*w*Ls)/(1-(w/wo)^2);
    Rx= (RL - (- RL^2*k + RL^2 - Zs^2*k^2)^(1/2))/k;
%     Rx=(RL + (- RL^2*k + RL^2 - Zs^2*k^2)^(1/2))/k;
    RL1=[RL1 Rx];

   
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k>=64)=64;
%%
figure1=figure();
set(gcf, 'Position',  [100, 100, 600, 300])

axes1 = axes('Parent',figure1);
hold(axes1,'on');
[x,y] = meshgrid(wRL,DeltaMx);
s=mesh(x,y,100*abs(RL1k)/64);
hold on;
view([0 90])
xlim([0.67 1.3333])
s.FaceColor = 'flat';
% s.FaceAlpha='0.8';
s.EdgeColor='none';
xlabel('Normalized Frequency($f_r$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel({'$ \frac{\Delta M}{M_{(1)}}$'},'Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',18)
set(axes1,'XTick',[0.7 0.8 0.9 1 1.1 1.2 1.3],'YTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
colormap('jet');
% Create colorbar
colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
    'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
    'Limits',[50 100],...
    'FontSize',12,...
    'FontName','Times New Roman');

% Create textbox
annotation(figure1,'textbox',...
    [0.794659804983763 0.00162188485637581 0.210417881816656 0.136059148058712],...
    'Color',[1 0 0],...
    'String',{'$\%\frac{P_{(1)}}{P_{(1)}+P_{(2)}}100$'},...
    'Interpreter','latex',...
    'FontWeight','bold',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FontAngle','italic',...
    'FitBoxToText','off',...
    'EdgeColor','none');