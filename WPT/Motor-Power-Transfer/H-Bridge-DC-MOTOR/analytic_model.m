D=0:0.005:1;
% D=0.8
Co=(2*D-1);

k=1;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,Co,'LineWidth',3)
hold on;
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=2;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=3;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=4;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;
xlabel('Duty Cycle');
ylabel('Output/Input')
legend('DC','1st','2nd','3rd','4th')
set(gca,'Fontsize',16)
%%

%d=linspace(0,1,100);



% a0=(2.*d-1); % DC compenent
% 
% b1=2*(1-cos(2*d*pi))/pi;
% 
% a1=2*(sin(2*d*pi)-1)/pi;


% 
% figure();
% plot(d,a0,'r','LineWidth',2)
% hold on;
% plot(d,b1,'--b','LineWidth',2);
% hold on;
% plot(d,a1,'--g','LineWidth',2);
% hold on;
% plot(d,sqrt(a1.^2+b1.^2),'k','LineWidth',2)