kx=[];
RL1k=[];
DeltaMx=[];
wo=1;
Qrx=4;
for DeltaM=0.5
 DeltaMx=[DeltaMx, DeltaM];
 k=(1-DeltaM);
 kx=[kx k];
 RL1=[];
 wRL=[];
for w=0.667*wo:0.05:1.33*wo
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


figure();
plot(wRL*150,RL1k)