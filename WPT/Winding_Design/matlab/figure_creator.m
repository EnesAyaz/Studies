load('bended_result.mat');
%%  seconder
angle= 45:10:135;
i=1;
j=3;
s1p1=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j) ];

i=2;
j=3;
s1p2=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j)];


figure();
stairs(angle,-s1p1,'-or','LineWidth',2);
hold on;
stairs(angle,-s1p2,'-pb','LineWidth',2);
hold on ;
stairs(angle,-s1p2-s1p1,'m','LineWidth',3);
legend('with primary 1', ' with primary 2','between both')
grid on;
grid minor;
title('Coupling Coefficient of 1 secondary')
%%

angle= 45:10:135;
angle=angle+90;
i=1;
j=4;
s2p1=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j) ];

i=2;
j=4;
s2p2=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j)];


% figure();
stairs(angle,-s2p1,'-or','LineWidth',2);
hold on;
stairs(angle,-s2p2,'-pb','LineWidth',2);
hold on ;
stairs(angle,-s2p2-s2p1,'m','LineWidth',3);
legend('with primary 1', ' with primary 2','between both')
title('Coupling Coefficient of 1 secondary')
%%
angle= 45:10:135;
angle=angle+180;
i=1;
j=5;
s3p1=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j) ];

i=2;
j=5;
s3p2=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j)];


% figure();
stairs(angle,-s3p1,'-or','LineWidth',2);
hold on;
stairs(angle,-s3p2,'-pb','LineWidth',2);
hold on ;
stairs(angle,-s3p2-s3p1,'m','LineWidth',3);
legend('with primary 1', ' with primary 2','between both')
title('Coupling Coefficient of 1 secondary')
%%

angle= 45:10:135;
angle=angle+270;
i=1;
j=6;
s4p1=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j) ];

i=2;
j=6;
s4p2=[Bended_0(i,j), Bended_10(i,j),Bended_20(i,j) ...
    Bended_30(i,j), Bended_40(i,j), Bended_50(i,j) ...
    Bended_60(i,j), Bended_70(i,j), Bended_80(i,j) ...
    Bended_90(i,j)];


% figure();
stairs(angle,-s4p1,'-or','LineWidth',2);
hold on;
stairs(angle,-s4p2,'-pb','LineWidth',2);
hold on ;
stairs(angle,-s4p2-s4p1,'m','LineWidth',3);
legend('With a primary windings', ' With another primary windings','Resultant(Sum of primary windings)')
title('Coupling Coefficient between a Secondary Winding and Primary Windings')
xlabel('Mechanical Angle (Degree)');
ylabel('Coupling Coefficient')
