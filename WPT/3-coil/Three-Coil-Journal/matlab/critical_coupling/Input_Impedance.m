wx=[];
Qx=[];
j=0;

for Qrx= 0.02: 0.01: 1.12
Ima=[];
wr=[];
j=0;
% Qrx=1.128;
k1=0.2;
j=j+1;
for f=100:0.1:400
w=2*pi*f*1e3;
A=[];
w0=150*2*pi*1e3;
w0=150*2*pi*1e3;
M2=17e-6;
M1=15.4e-6;
RL=8;
Ls=Qrx*RL/w0;
k2=0.4;
Lr= M2^2/(k2^2*Ls);
Cs=1/(w0^2*Ls);
Cr=1/(w0^2*Lr);
Lp=M1^2/(k1^2*Lr);
Cp=1/(w0^2*Lp);
Zs=1i*w*Ls+1/(1i*w*Cs)+RL;
Zr=1i*w*Lr+1/(1i*w*Cr);
Zp=1i*w*Lp+1/(1i*w*Cp);
Z=Zp+w^2*M1^2/(Zr+w^2*M2^2/Zs);
Ima = [Ima,imag(Z)];
wr=[wr w];
end

% plot(wr/2/pi/1000,Ima)
Qr=RL*Lr/w0/M2/M2;
kc=(1/Qr)*sqrt(1-(1/4/Qr/Qr));

wz=[];
for i=2:length(Ima)
   if  Ima(i-1)>0  &&  Ima(i) <0
       wz=[wz wr(i)];
   end
   if Ima(i-1)<0  &&  Ima(i) >0
       wz=[wz wr(i)];
   end
   if Ima(i)==0
       wz=[wz wr(i)];
   end
end
% Qr
wz/1e3/2/pi;
wz=sort(wz);
wx=[wx; wz/2/pi/1e3];
Qx= [Qx,Qrx];


end


figure(8);
plot(Qx,wx(:,1),'x','color','r')
hold on;

plot(Qx,round(wx(:,2)),'x','color','k')
hold on;


plot(Qx,wx(:,3),'x','color','b')
hold on;


wx=[];
Qx=[];
j=0;
for Qrx= 1.12: 0.00001: 1.12760
Ima=[];
wr=[];
j=0;
% Qrx=1.128;
k1=0.2;
j=j+1;
for f=100:0.1:400
w=2*pi*f*1e3;
A=[];
w0=150*2*pi*1e3;
w0=150*2*pi*1e3;
M2=17e-6;
M1=15.4e-6;
RL=8;
Ls=Qrx*RL/w0;
k2=0.4;
Lr= M2^2/(k2^2*Ls);
Cs=1/(w0^2*Ls);
Cr=1/(w0^2*Lr);
Lp=M1^2/(k1^2*Lr);
Cp=1/(w0^2*Lp);
Zs=1i*w*Ls+1/(1i*w*Cs)+RL;
Zr=1i*w*Lr+1/(1i*w*Cr);
Zp=1i*w*Lp+1/(1i*w*Cp);
Z=Zp+w^2*M1^2/(Zr+w^2*M2^2/Zs);
Ima = [Ima,imag(Z)];
wr=[wr w];
end

% plot(wr/2/pi/1000,Ima)
Qr=RL*Lr/w0/M2/M2;
kc=(1/Qr)*sqrt(1-(1/4/Qr/Qr));

wz=[];
for i=2:length(Ima)
   if  Ima(i-1)>0  &&  Ima(i) <0
       wz=[wz wr(i)];
   end
   if Ima(i-1)<0  &&  Ima(i) >0
       wz=[wz wr(i)];
   end
   if Ima(i)==0
       wz=[wz wr(i)];
   end
end
% Qr
wz/1e3/2/pi;
wz=sort(wz);
wx=[wx; wz/2/pi/1e3];
Qx= [Qx,Qrx];


end


figure(8);
plot(Qx,round(wx(:,1)),'x','color','r')
hold on;

plot(Qx,round(wx(:,2)),'x','color','b')
hold on;


plot(Qx,round(wx(:,3)),'x','color','k')
hold on;

%%

wx=[];
Qx=[];
j=0;

for Qrx= 1.128: 0.01: 2
Ima=[];
wr=[];
j=0;
% Qrx=1.128;
k1=0.2;
j=j+1;
for f=100:0.1:400
w=2*pi*f*1e3;
A=[];
w0=150*2*pi*1e3;
w0=150*2*pi*1e3;
M2=17e-6;
M1=15.4e-6;
RL=8;
Ls=Qrx*RL/w0;
k2=0.4;
Lr= M2^2/(k2^2*Ls);
Cs=1/(w0^2*Ls);
Cr=1/(w0^2*Lr);
Lp=M1^2/(k1^2*Lr);
Cp=1/(w0^2*Lp);
Zs=1i*w*Ls+1/(1i*w*Cs)+RL;
Zr=1i*w*Lr+1/(1i*w*Cr);
Zp=1i*w*Lp+1/(1i*w*Cp);
Z=Zp+w^2*M1^2/(Zr+w^2*M2^2/Zs);
Ima = [Ima,imag(Z)];
wr=[wr w];
end

% plot(wr/2/pi/1000,Ima)
Qr=RL*Lr/w0/M2/M2;
kc=(1/Qr)*sqrt(1-(1/4/Qr/Qr));

wz=[];
for i=2:length(Ima)
   if  Ima(i-1)>0  &&  Ima(i) <0
       wz=[wz wr(i)];
   end
   if Ima(i-1)<0  &&  Ima(i) >0
       wz=[wz wr(i)];
   end
   if Ima(i)==0
       wz=[wz wr(i)];
   end
end
% Qr
wz/1e3/2/pi;

wx=[wx; wz/2/pi/1e3];
Qx= [Qx,Qrx];


end


figure(8);
plot(Qx,round(wx),'x','color','k')
hold on;



