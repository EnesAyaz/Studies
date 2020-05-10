

figure();
hold all;
plot([0,0], [-200 200],'--k')
plot([-200,200], [0 0],'--k')

plot([0 100], [0 0],'b','LineWidth',5);
hold on;
plot([0 40], [0 0],'--m','LineWidth',5);

hold on;
plot([0 0], [0 100]);
hold on;
plot([0 0], [0 100]);

axis equal;
set(gca,'xtick',[])
set(gca,'ytick',[])

