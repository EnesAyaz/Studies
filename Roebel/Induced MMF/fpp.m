function [result] = fpp(x, y, z, t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% flux data is interpolated over 150 points
% flux is imported as 30 points
inte=linspace(1,30,150);
xx=interp1(x,inte);
yy=interp1(y,inte);
zz=interp1(z,inte);
tt=interp1(t,inte);
total = 2*sum((x+y+z+t)/4); % total is total flux per pole
total

average = 2*(xx+yy+zz+tt)/(4*5);
interpolated_total = sum(average);
full = [average, -average];
%plot(xx);
%hold on;
%plot(yy);
%plot(zz);
%plot(tt);
%plot(full);

% for calculating pitch factor
% 144 is coil span(1 pole 150 and coil pitch is 144/150)
figure;
integral=zeros(1,150);
for i=1:150
    for ii=1:144
    integral(i)=integral(i)+full(i+ii-1);
    end
end

full_cycle_integral = [integral, -integral];
plot(full_cycle_integral);

%derivate for induced voltage
induced = diff(full_cycle_integral);
induced=induced*15000;
figure;
plot(induced);
ind1=circshift(induced,0);
ind2=circshift(induced,16);
ind3=circshift(induced,32);
ind4=circshift(induced,48);
ind5=circshift(induced,10);
ind6=circshift(induced,26);
ind7=circshift(induced,42);
ind8=circshift(induced,4);
ind9=circshift(induced,20);
ind10=circshift(induced,36);
ind11=circshift(induced,14);
ind12=circshift(induced,30);
ind13=circshift(induced,46);
ind14=circshift(induced,8);
ind15=circshift(induced,24);
ind16=circshift(induced,40);
ind17=circshift(induced,2);
ind18=circshift(induced,18);
ind19=circshift(induced,34);
ind20=circshift(induced,12);
ind21=circshift(induced,28);
ind22=circshift(induced,44);
ind23=circshift(induced,6);
ind24=circshift(induced,22);
ind25=circshift(induced,38);
total_induced = (ind1+ind2+ind3+ind4+ind5+ind6+ind7+ind8+ind9+ind10+ind11+ind12+ind13+ind14+ind15+ind16+ind17+ind18+ind19+ind20+ind21+ind22+ind23+ind24+ind25)*4;
figure;
plot(total_induced);
pha=total_induced;
phb=circshift(pha,100);
phc=circshift(phb,100);
hold on;
plot(phb);
plot(phc);
plot((pha-phb)*total/interpolated_total);
plot((0.3852+0.4229)*0.5/0.4229*(pha-phb)*total/interpolated_total);
result=(0.3852+0.4229)*0.5/0.4229*(pha-phb)*total/interpolated_total;

end

