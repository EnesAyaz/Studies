frequency= [100 105 110 115 120 125 127 129 131 133 135 140 145 150 155 160 162 164 166 168 ...
    170 172.5 175 177.5 180 185 190 195 199];
Is2=[192 212 222 233 245 248 221 185 127 85 47 30 30 30 50 102 122 137 143 160 206 270 310 350 390 432 440 445 460];
Is1=[260 295 335 390 465 600 635 712 777 850 912 1060 1245 1250 1235 1200 1200 1193 1170 1140 1080 1010 950 920 900 854 810 777 765];

figure();
stem(frequency, Is1./(Is1+Is2),'LineStyle','none')
hold on;
%%
kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Lrx=17.65e-6;
Ltx=23.75e-6;
Crx=65.7e-9;
Ctx=49.2;
frx=1/(sqrt(Lrx*Crx)*2*pi)
Rrx=5*8/pi/pi;
Qrx=(2*pi*frx*Lrx)/Rrx
M1=3.86e-6; %  3.0711e-06
M2= 3.03e-6;
k1=M1/sqrt(Ltx*Lrx);
k2=M2/sqrt(Ltx*Lrx);
DeltaMk=(M1-M2)/M1

for DeltaM=DeltaMk;
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for i=1:length(frequency)
    w=1000*(frequency(i)/frx);
    a=(Qrx*(w^2-wo^2))/(w*wo);
    b=(1-k^2);
    c=1/((b/a^2)+1);
    d=k^2- (((1-k^2)^2)/a^2);
    Rx=c+ ((sqrt(d))/((b/a^2)+1));
   RL1=[RL1 Rx];
   wRL=[wRL w];
end
RL1k=[RL1k ; RL1];
end 
RL1k(RL1k<=1)=1;
%%
stem(frequency,1./RL1k,'LineStyle','none')


error=(Is1./(Is1+Is2))- (1./RL1k);
n_error=error./(Is1./(Is1+Is2));
hold on;
%%
figure();
stem(frequency,100*n_error,'LineStyle','none')
