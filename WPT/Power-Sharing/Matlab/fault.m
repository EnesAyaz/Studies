LRX=8.8e-6;
CRX= 109e-9;
RRX= 8;
M1=4.1e-6; 
LTX= 43.6e-6;
CTX=22e-9;

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
k=0;
    
M2=(1-k)*M1;


f=145e3:0.2e3:185e3;
w=2*pi*f;

ZRX2= (1./(1i*w*CRX)+RRX)/2;
% plot(abs(ZRX2))

Z=1i*LRX*w+1./(1./(1i*LRX*w)+ 1./ZRX2);

% plot(abs(Z1))


ZTx_Ref=(w.^2.*(M1^2))./Z ;

% plot(abs(ZTx_Ref))

ZTx=1i*w*LTX+(1./(1i*w*CTX))+ZTx_Ref;


% yyaxis left
% plot(f/1e3,1./abs(ZTx)/0.437,'LineWidth',1.5,'Parent',axes1);
plot(f/1e3,angle(ZTx)*180/pi,'LineWidth',1.5,'Parent',axes1)

% yyaxis right

% figure(2);
% plot(f/1e3,angle(ZTx)*180/pi,'LineWidth',1.5,'Parent',axes1)
% hold on;


end

% set(plot1,'DisplayName','data1');

% yline(1,'Parent',axes1,'Alpha',1,'Color',[0 0 0],'LineWidth',1.5);
yline(0,'Parent',axes1,'Alpha',1,'Color',[0 0 0],'LineWidth',1.5);


% Create ylabel
ylabel({'Normalized Gain'});

% Create xlabel
xlabel({'Frequency (kHz)'});

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',14,'GridAlpha',0.25,...
    'GridColor',[0 0 0],'MinorGridColor',[0 0 0],'XGrid','on','XMinorGrid','on',...
    'YGrid','on','YMinorGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.455222286195272 0.146937014103787 0.157142855173774 0.349999990065893],...
    'Color','white');





