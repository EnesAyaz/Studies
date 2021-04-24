%%
fig = openfig('series_parallel_simulation_detailed.fig');
axObjs = fig.Children;
dataObjs = axObjs.Children;
x_fig = dataObjs(1).XData;
y_fig = dataObjs(1).YData;
z_fig = dataObjs(1).ZData;
Mx=y_fig(:,1);
fx=x_fig(1,:)*150e3;
Pratio=z_fig;
kx=[];
RLaak=[];
DeltaMx=[];
fo=150e3;
wo=2*pi*fo;
Qrx=4;
size_Mx=size(Mx);
size_fx=size(fx);

for i=1:1:size_Mx(1)
 DeltaM=Mx(i);
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for w_i=1:1:size_fx(2)
    w=2*pi*fx(w_i);
    wi(w_i)=w;
    a=(Qrx*(w^2-wo^2))/(w*wo);
    ai(w_i)=a;
    b=(1-k^2);
    bi(w_i)=b;
    c=1/((b/a^2)+1);
    ci(w_i)=c;
    d=k^2- (((1-k^2)^2)/a^2);
    di(w_i)=d;
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
    RL1=[RL1 Rx];
    wRL=[wRL w];
end
RLaak=[RLaak ; RL1];
end 
RLaak(RLaak<=1)=1;


Pratio2=100./abs(RLaak);
% Pratio2(1,11)=50;
Pcorrect=(Pratio2-Pratio)./(Pratio);


figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

[x,y] = meshgrid(wRL/(2*pi*fo),DeltaMx);
contourf(x,y,100*(Pcorrect));

colorbar
xlabel('Normalized Frequency','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)

ylabel('Normalized Mutual Difference ($ \frac{\Delta M}{M_1}$)','Interpreter','Latex','Fontname','Times new roman'...
    , 'FontSize',14)
colormap('jet');
% Create colorbar
% colorbar(axes1,'Ticks',[50 55 60 65 70 75 80 85 90 95 100],...
%     'TickLabels',{'50','55','60','65','70','75','80','85','90','95','100'},...
%     'Limits',[50 100],...
%     'FontSize',12,...
%     'FontName','Times New Roman');
% colorbar.Title.String='Percentage(%)'

%%
%  
%     DeltaM=0.6;
%     Qrx=4;
%     k=(1-DeltaM);
%     wo=2*pi*150e3;
%     w=2*pi*105e3;
%  
% 
%     a=(Qrx*(w^2-wo^2))/(w*wo);
% 
%     b=(1-k^2);
% 
%     c=1/((b/a^2)+1);
% 
%     d=k^2- (((1-k^2)^2)/a^2);
% 
%     Rx=c+ ((sqrt(d))/((b/a^2)+1));
%     100./abs(Rx)