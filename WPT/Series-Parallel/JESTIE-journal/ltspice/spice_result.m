figure();
yyaxis left;
plot(time,ILs1,'r-','LineWidth',3);
hold on;
plot(time,ILs2,'LineWidth',3);
hold on; 
ylim([-5 5])
yyaxis right;
plot(time,Vout,'LineWidth',3)
ylim([0 220])
xlim([0.00998 0.01])
%%
