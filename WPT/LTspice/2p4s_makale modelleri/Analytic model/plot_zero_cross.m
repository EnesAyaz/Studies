crossing_points=[];

for ks=-1:0.0001:1
crossing_points = [crossing_points zero_crossing(ks)];
end

ks=-1:0.0001:1;
len=length(ks);
%%
figure();
plot(ks,crossing_points/1000,'LineWidth',3);
hold on; 
grid on;
plot(ks,150*ones(1,len),'LineWidth',3)
title('\textbf{The Effect of Coupling Coefficient of Secondary Coils on Resonance Frequency}','Interpreter','Latex','FontSize', 30);
xlabel('\textbf{Coupling Coefficient}','Interpreter','Latex','FontSize', 30);
ylabel('\textbf{Resonance Frequency(kHz)}','Interpreter','Latex','FontSize', 30);
legend('Resonance Frequency','The Frequency of Decoupled Secondary Coils','Location','Best')
set(gca,'FontSize',20)

%%
