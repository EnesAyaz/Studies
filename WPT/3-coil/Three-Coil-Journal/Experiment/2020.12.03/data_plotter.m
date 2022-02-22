figure;
plot(t_rez,i_rez,'LineWidth',3);
title('Resonator Current','interpreter','latex')
xlabel("Time(s)",'interpreter','latex')
ylabel("Current",'interpreter','latex')
xlim([0 15e-6]);
grid on;

figure;
subplot(2,1,1)
plot(t_itx1,Itx1,'LineWidth',3);
xlim([0 15e-6])
xlabel("time(s)","interpreter","latex")
ylabel("Current(A)","interpreter","latex")
legend("Tx1","interpreter","latex")
title(" Fault Rx Currents Best","interpreter","latex","interpreter","latex")
grid on;

subplot(2,1,2)
plot(t_tx2,i_tx2,'LineWidth',3);
xlim([0 15e-6])
xlabel("time(s)","interpreter","latex")
ylabel("Current(A)","interpreter","latex")
legend("Tx2","interpreter","latex")
title(" Fault Rx Currents Best","interpreter","latex")
grid on;

figure;
subplot(4,1,1)
plot(t,i_rx1,'LineWidth',3);
xlim([0 15e-6])
xlabel("time(s)","interpreter","latex")
ylabel("Current(A)","interpreter","latex")
legend("is2","interpreter","latex")
title(" Fault Rx Currents Best","interpreter","latex","interpreter","latex")
grid on;

subplot(4,1,2)
plot(t_rx2,i_rx2*10,'LineWidth',3);
xlim([0 15e-6])
xlabel("time(s)","interpreter","latex")
ylabel("Current(A)","interpreter","latex")
legend("Is3","interpreter","latex")
title(" Fault Rx Currents Best","interpreter","latex")
grid on;

subplot(4,1,3)
plot(t_rx3,Irx3,'LineWidth',3);
xlim([0 15e-6])
xlabel("time(s)","interpreter","latex")
ylabel("Current(A)","interpreter","latex")
legend("is3","interpreter","latex")
title(" Fault Rx Currents Best","interpreter","latex")
grid on;

subplot(4,1,4)
plot(t_rx4,i_rx4*10,'LineWidth',3);
xlim([0 15e-6])
xlabel("time(s)","interpreter","latex")
ylabel("Current(A)","interpreter","latex")
legend("is4","interpreter","latex")
title(" Fault Rx Currents Best","interpreter","latex")
grid on;