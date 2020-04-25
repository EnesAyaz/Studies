clc;
clear all;
%% No coupling between secondary
Vin=127;
Ip=7.1475*sqrt(2);
Is1=4.0409*sqrt(2);
Is2=1.4371*sqrt(2);
% theta=16.16;
% alfa=-87.1726;
% beta=-101.316;
Vout=110.6*sqrt(2);
w=2*pi*150*1e3;
M1=17.89e-6;
M2=16.34e-6;
% Ms=13.76e-6;

%% No coupling between secondary
% Vin=127;
% Is1=4.041*sqrt(2);
% Is2=1.4371*sqrt(2);
% % Is2=2*sqrt(2);
% % Ms1=y(2);
% Vout=112.1*sqrt(2);
% Ip=7.1475*sqrt(2);
% % Ip=8*sqrt(2);
% w=2*pi*150*1e3;
% M1=17.89e-6;
% M2=16.34e-6;

% theta=20.45;
% alfa=-86.6;
% beta=-100.86
% Ms=13.76e-6;


%%
% Vin=127;
% Ip=8.3743*sqrt(2);
% Is1=3.6703*sqrt(2);
% Is2=2.0747*sqrt(2);
% 
% Vout=112*sqrt(2);
% w=2*pi*150*1e3;
% 
% M1=17.89e-6;
% M2=14.78e-6;

% theta=27.97;
% alfa=-83.93;
% beta=-102.58;
% Ms=20.64e-6;


%% Alfa and Beta Finding
K1=w*M1*Is1;
K2=w*M2*Is2;
if K1+K2>Vin
        x1= acosd((Vin^2-K1^2-K2^2)/(-2*K1*K2));
        x=180-x1;
        a=(1+K2*cosd(x)/K1)/ (K2*sind(x)/K1);
        alpha= atand((1+K2*cosd(x)/K1)/ (K2*sind(x)/K1));
        betta=alpha+x;  
end

alpha=-alpha;
betta=-betta;

%%
Ip=Vout*(Is1+Is2)/Vin;
K3=w*M1*Ip;
K4=w*M2*Ip;
K5=w*Is2*cosd(betta);
K6=w*Is2*sind(betta);
K7=w*Is1*cosd(alpha);
K8=w*Is1*sind(alpha);
K9=Vout*sind(alpha);
K10=Vout*cosd(alpha);
K11=Vout*sind(betta);
K12=Vout*cosd(betta);
%%
    error=inf;
    Ms=0;
    theta=0;
    for t=0:0.01:30
      for  m=0:0.01e-6:68.8e-6
        
       e1=K3+K5*m+K9;
       e2= K3*tand(t)+K6*m-K10;
       e3=K4+K7*m+K11;
       e4= K4*tand(t)+K8*m-K12;
       e=abs(e1+e2+e3+e4);
       
       if e<error
           error=e;
           Ms=m;
           theta=t;
       else
           
           error=error;
           Ms=Ms;
           theta=theta;
           
       end
       
 
      
          
      end
        
    end







% 
% A=[K3,0, K5;0, K3,K6; K4,0,K7; 0,K4,K8];
% rref(A)
% A=[K3,0, K5;0, K3,K6; K4,0,K7];
% rref(A)
% 
% y= inv(A)*[-K9;K10;-K11];
% 
% theta=acosd(y(1));
% theta2=asind(y(2));
% Ms=y(3);
% error=1-(y(1)^2+y(2)^2);
% %%
% % A=[K3 K5; K4, K8];
% % inverse_A=inv(A);
% % B=[-K9; -K11];
% % 
% % y= inverse_A*B;
% % 
% % theta1=acosd(y(1));
% % 
% % Ms1=y(2);
% 
% %%
% % A=[K3 K6; K4, K9];
% % inverse_A=inv(A);
% % B=[K10; K12];
% % 
% % y= inverse_A*B;
% % 
% % theta2=asind(y(1));
% % Ms2=y(2);
% 
% 
% %%
% 
% 
% % K6*K3*cosd(24.97)-K3*K5*sind(24.97) 
% % K6*K9+K5*K10
