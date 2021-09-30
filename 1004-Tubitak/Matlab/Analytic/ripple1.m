V_alpha=[];

for alpha=1:1:90
D=0.25;
time=[0, (alpha/360), D, (alpha/360)+D, 0.5, 0.5+ (alpha/360), 0.5+D ...
    0.5+(alpha/360)+D, 1] ;

time2=(time(2:9)-time(1:8));

S1=[1 1 0 0 0 0 0 0 ];
S2=[0 0 0 0 1 1 0 0 ];
S3=[0 1 1 0 0 0 0 0 ];
S4=[0 0 0 0 0 1 1 0 ];

Vo=1;
Vin=Vo*ones(1,9)*(1-D);
Vgo=(Vo/2*(S1+S2+S3+S4))/4;
Vcm=(Vo/2)*(S1+S3)/2;
Vdm=(Vo/2)*(S1-S3)/2;
Vcmp=Vcm-Vgo;

V=sum(abs(Vdm.*time2));
V=sum(abs(Vcm.*time2));

V_alpha=[ V_alpha , V];

end

figure();
plot(V_alpha)