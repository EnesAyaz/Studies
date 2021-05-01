frequency= [101 105 110 112 114 116 118 120 122 124 126 128 130 135 140 145 150 155 160 ...
    165 170 172 174 176 178 170 182 184 186 188 190 192.5 195 197.5 200];
Is2=[145 154 155 153 149 143 138 127 101 67 42 29 14 10 7 7 7 7 16 42 37 67 95 100 97 96 109 147 ...
    182 211 232 250 263 271 281];
Is1=[375 412 462 490 515 549 590 634 690 746 797 840 890 1005 1124 1245 1280 1265 1256 1210 1120,...,
   1072 1020 997 976 957 937 902 870 835 807 773 750 735 725 ];

figure();
stem(frequency, Is1./(Is1+Is2),'LineStyle','none')
hold on;
%%
kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Ltx=22.88e-6;
Lrx=17.1e-6;
Crx=65.7e-9;
Ctx=49.2;
frx=1/(sqrt(Lrx*Crx)*2*pi)
Rrx=5.1*8/pi/pi;
Qrx=(2*pi*frx*Lrx)/Rrx
M1=4.1e-6; %  3.0711e-06
M2=2.445e-6;
k1=M1/sqrt(Ltx*Lrx);
k2=M2/sqrt(Ltx*Lrx);
DeltaMk=(M1-M2)/M1;

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

%%
error=(Is1./(Is1+Is2))- (1./RL1k);
n_error=error./(Is1./(Is1+Is2));
hold on;
%%
figure();
stem(frequency,100*n_error,'LineStyle','none')
ylim([-20 20])
