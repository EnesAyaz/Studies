function crossing_points =zero_crossing(ks)
    w_r=150e3*2*pi;
    Lp= 107.42e-6;
    rp=0;
    Cp=1/(Lp*w_r*w_r);
    Ls=68.8e-6;
    rs=0;
    Cs=1/(Ls*w_r*w_r);
    M1= 17.19e-6;
    M2 = M1;
    Ms= -ks*Ls;
    R1=40*8/(pi^2);
    R2=40*8/(pi^2);
    %%
    len=1e4;
    f=logspace(4.1,5.4,len);
    w=2*pi*f;
    %%
    Zp1=(rp+(1./(1i*w*Cp))+1i*w*Lp);
    Zs1=(R1+rs+(1./(1i*w*Cs))+1i*w*Ls);
    Zs2=(R2+rs+(1./(1i*w*Cs))+1i*w*Ls);

    %%
    deter_anal=(Zp1.*Zs1.*Zs2)+ (w.*w.*Ms*Ms.*Zp1)+(w.*w.*M1*M1.*Zs2)+(2*1i*w.*w.*w*M1*M2*Ms)+(w.*w.*M2*M2.*Zs1);
    m1_anal= ((Zs1.*Zs2)+(w.*w.*Ms.*Ms))./deter_anal;
    V_in=(ones(1,len));
    Z_in=V_in./m1_anal;
    %%
%     figure();
%     plot(f,180*phase(Z_in)/pi,'LineWidth',3);
%     hold on; 
%     grid on;
%     xlim([100000 200000]);
%     plot(f,zeros(1,len),'k','LineWidth',3);
%     legend('Phase','Zero-Line')
    %%
    y=180*phase(Z_in)/pi;
    z = and((y > 0), not(circshift((y > 0), 1)));  z(1) = 0;
%     subplot(2,1,2); plot(f, z); xlabel('freq');
    crossing_points = f(find(z));

end