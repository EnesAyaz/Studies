load('inductance_matrix');

load('coupling_coeff');

%% 
numberOfangles=length(inductance_matrix.angles);
i=3;
% angles=inductance_matrix.angles{i};
M=inductance_matrix.values{1,i};
k=coupling_coeff.values{1,i};

%% mutual indutance between S1 to P1 and P2
Mps=[];
kps= [ ];
x=3; %% for s1
angle=[];
for i=1:numberOfangles
angle=[ angle str2num(inductance_matrix.angles{i})];

M=inductance_matrix.values{1,i};
k=coupling_coeff.values{1,i};
a=[M(x,1);M(x,2)]; 
Mps=[ Mps a ];
a=[k(x,1);k(x,2)]; 
kps= [kps a];
end
Mps1=Mps;
kps1=kps;
%%
Mps=[];
kps= [ ];
x=4; %% for s2
angle=[];
for i=1:numberOfangles
angle=[ angle str2num(inductance_matrix.angles{i})];

M=inductance_matrix.values{1,i};
k=coupling_coeff.values{1,i};
a=[M(x,1);M(x,2)]; 
Mps=[ Mps a ];
a=[k(x,1);k(x,2)]; 
kps= [kps a];
end
Mps2=Mps;
kps2=kps;
%%
Mps=[];
kps= [ ];
x=5; %% for s3
angle=[];
for i=1:numberOfangles
angle=[ angle str2num(inductance_matrix.angles{i})];

M=inductance_matrix.values{1,i};
k=coupling_coeff.values{1,i};
a=[M(x,1);M(x,2)]; 
Mps=[ Mps a ];
a=[k(x,1);k(x,2)]; 
kps= [kps a];
end
Mps3=Mps;
kps3=kps;

%%
Mps=[];
kps= [ ];
x=6; %% for s4
angle=[];
for i=1:numberOfangles
angle=[ angle str2num(inductance_matrix.angles{i})];

M=inductance_matrix.values{1,i};
k=coupling_coeff.values{1,i};
a=[M(x,1);M(x,2)]; 
Mps=[ Mps a ];
a=[k(x,1);k(x,2)]; 
kps= [kps a];
end
Mps4=Mps;
kps4=kps;
%%

figure();
plot(angle,Mps1(1,:),'--','LineWidth',3)
hold on;
plot(angle,Mps1(2,:),'LineWidth',3)
hold on; 
plot(angle,Mps2(1,:),'--','LineWidth',3)
hold on;
plot(angle,Mps2(2,:),'LineWidth',3)
hold on; 
plot(angle,Mps3(1,:),'--','LineWidth',3)
hold on;
plot(angle,Mps3(2,:),'LineWidth',3)
hold on; 
plot(angle,Mps4(1,:),'--','LineWidth',3)
hold on;
plot(angle,Mps4(2,:),'LineWidth',3)
hold on; 
legend('Mp1s1','Mp2s1','Mp1s2','Mp2s2','Mp1s3','Mp2s3','Mp1s4','Mp2s4');
title('Mutual Inductance');

figure();
plot(angle,kps1(1,:),'--','LineWidth',3)
hold on;
plot(angle,kps1(2,:),'LineWidth',3)
hold on;
plot(angle,kps2(1,:),'--','LineWidth',3)
hold on;
plot(angle,kps2(2,:),'LineWidth',3)
hold on;
plot(angle,kps3(1,:),'--','LineWidth',3)
hold on;
plot(angle,kps3(2,:),'LineWidth',3)
hold on;
plot(angle,kps3(1,:),'--','LineWidth',3)
hold on;
plot(angle,kps3(2,:),'LineWidth',3)
hold on;
legend('Kp1s1','Kp2s1','Kp1s2','Kp2s2','Kp1s3','Kp2s3','Kp1s4','Kp2s4');
title('Mutual Couplings');

%%

figure();
plot(angle,Mps1(1,:)+Mps1(2,:),'--','LineWidth',3)
hold on; 
plot(angle,Mps2(1,:)+Mps2(2,:),'LineWidth',3)
hold on; 
plot(angle,Mps3(1,:)+Mps3(2,:),'--','LineWidth',3)
hold on;
plot(angle,Mps4(1,:)+Mps4(2,:),'LineWidth',3)
hold on; 
legend('Mps1','Mps2','Mps3','Mps4');
title('Mutual Inductance- overall')

figure();
plot(angle,kps1(1,:)+kps1(2,:),'--','LineWidth',3)
hold on; 
plot(angle,kps2(1,:)+kps2(2,:),'LineWidth',3)
hold on; 
plot(angle,kps3(1,:)+kps3(2,:),'--','LineWidth',3)
hold on;
plot(angle,kps4(1,:)+kps4(2,:),'LineWidth',3)
hold on; 
legend('Kps1','Kps2','Kps3','Kps4');
title('Mutual Couplings- overall');





