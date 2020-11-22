load('normal_result.mat');
%%  seconder
angle= 45:10:135;
i=1;
j=3;
s1p1=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j) ];

i=2;
j=3;
s1p2=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j)];


figure();
plot(angle,-s1p1,'-or','LineWidth',2);
hold on;
plot(angle,-s1p2,'-pb','LineWidth',2);
hold on ;
plot(angle,-s1p2-s1p1,'m','LineWidth',3);
legend('with primary 1', ' with primary 2','between both')
grid on;
grid minor;
title('Coupling Coefficient of 1 secondary')
%%

angle= 45:10:135;
angle=angle+90;
i=1;
j=4;
s2p1=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j) ];

i=2;
j=4;
s2p2=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j)];


% figure();
plot(angle,-s2p1,'-or','LineWidth',2);
hold on;
plot(angle,-s2p2,'-pb','LineWidth',2);
hold on ;
plot(angle,-s2p2-s2p1,'m','LineWidth',3);
legend('with primary 1', ' with primary 2','between both')
title('Coupling Coefficient of 1 secondary')
%%
angle= 45:10:135;
angle=angle+180;
i=1;
j=5;
s3p1=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j) ];

i=2;
j=5;
s3p2=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j)];


% figure();
plot(angle,-s3p1,'-or','LineWidth',2);
hold on;
plot(angle,-s3p2,'-pb','LineWidth',2);
hold on ;
plot(angle,-s3p2-s3p1,'m','LineWidth',3);
legend('with primary 1', ' with primary 2','between both')
title('Coupling Coefficient of 1 secondary')
%%

angle= 45:10:135;
angle=angle+270;
i=1;
j=6;
s4p1=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j) ];

i=2;
j=6;
s4p2=[normal_0(i,j), normal_10(i,j),normal_20(i,j) ...
    normal_30(i,j), normal_40(i,j), normal_50(i,j) ...
    normal_60(i,j), normal_70(i,j), normal_80(i,j) ...
    normal_90(i,j)];

%%
% figure();
plot(angle,-s4p1,'-or','LineWidth',2);
hold on;
plot(angle,-s4p2,'-pb','LineWidth',2);
hold on ;
plot(angle,-s4p2-s4p1,'m','LineWidth',3);
legend('With a primary windings', ' With another primary windings','Resultant(Sum of primary windings)')
title('Coupling Coefficient between a Secondary Winding and Primary Windings')
xlabel('Mechanical Angle (Degree)');
ylabel('Coupling Coefficient')

%%

normal_p1_total= [-s1p1 -s2p1(2:end) -s3p1(2:end) -s4p1(2:end)];
normal_p2_total= [-s1p2 -s2p2(2:end) -s3p2(2:end) -s4p2(2:end)];
angle1= 0:10:90;
normal_angle=[angle1 angle1(2:end)+90, angle1(2:end)+180, angle1(2:end)+270];

plot(normal_angle,normal_p1_total,'-or','LineWidth',2);
hold on;
plot(normal_angle,normal_p2_total,'-pb','LineWidth',2);
hold on ;

