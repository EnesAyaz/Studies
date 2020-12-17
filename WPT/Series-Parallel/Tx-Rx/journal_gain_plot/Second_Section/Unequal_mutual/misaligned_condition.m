clc;
clear all;
length=100;
M=ones(1,length);
DeltaM=linspace(-1,1,length);

Ip_factor= 2./(2*M.^2-2*M.*DeltaM+DeltaM.*DeltaM);
Vin=ones(1,length);
figure()
plot(DeltaM,Ip_factor);
hold on; 
plot(DeltaM,Vin);

for i=1:length 
   if Ip_factor(i)>1
       Vin(i)=Vin(i)/Ip_factor(i);
       Ip_factor(i)=1;
   end
    
end

figure()
plot(DeltaM,Ip_factor);
hold on; 
plot(DeltaM,Vin);
hold on;
% plot(DeltaM,Ip_factor.*Vin);

Is1=Ip_factor.*M;
Is2=Ip_factor.*(M-DeltaM);

%%
figure()
plot(-DeltaM,Is1.^2/2);
hold on; 
plot(-DeltaM,Is2.^2/2);
hold on;
plot(-DeltaM,(Is1.^2+Is2.^2)/2);
hold on;

%%
figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
plot(DeltaM,Is1.^2/2,'LineWidth',3);
hold on; 
plot(DeltaM,Is2.^2/2,'LineWidth',3);
hold on;
plot(DeltaM,(Is1.^2+Is2.^2)/2,'LineWidth',3);
hold on;
legend('Rx-1','Rx-2 ','Tx','Interpreter','latex')
hold(axes1,'on');
ylabel({'Power ($\frac{P}{P_{rated}}$)'},'Interpreter','latex');
xlabel({'Misalignment Factor ($\frac{\Delta M}{M}$)'},'Interpreter','latex');
box(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15);

%%
Power1= (Is1.^2/2)./ (M.^2);
Power2= (Is2.^2/2)./ ((M-DeltaM).^2);

k= (M)./((M-DeltaM));
k2=(Is1.^2/2)./  (Is2.^2/2);

figure1 = figure('WindowState','maximized');
axes1 = axes('Parent',figure1);
plot(k,k2,'LineWidth',3);
hold on; 
hold(axes1,'on');
xlabel({'Mutual Ratio($\frac{M}{M-\Delta M}$)'},'Interpreter','latex');
ylabel({'Power Ratio ($\frac{P1}{P2}$)'},'Interpreter','latex');
box(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15);




