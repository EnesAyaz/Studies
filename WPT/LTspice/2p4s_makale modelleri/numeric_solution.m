
% Vin=127;
% Ip=7.1475*sqrt(2);
% Is1=4.0409*sqrt(2);
% Is2=1.4371*sqrt(2);
% % theta=16.16;
% % alfa=-87.1726;
% % beta=-101.316;
% Vout=110.6*sqrt(2);
% w=2*pi*150*1e3;
% M1=17.89e-6;
% M2=16.34e-6;
% % Ms=13.76e-6;


% vin,Is1,Is2,Vout in rms value
% f in kHz
% M1 and M2 microHenry
function [alpha,beta,theta,Ms]=numeric_solution(Vin,Is1,Is2,Vout,f,M1,M2,Ls,Lp)
    w=2*pi*f*1e3;
    M1=M1*1e-6;
    M2=M2*1e-6;
    Vin=Vin*sqrt(2);
    Is1=Is1*sqrt(2);
    Is2=Is2*sqrt(2);
    Vout=Vout*sqrt(2);
    Ip_f= Vout*(Is1+Is2)/Vin;
    e10=[];
    e20=[];


    K1=w*M1*Is1;
    K2=w*M2*Is2;
    if K1+K2>Vin
        x1= acosd((Vin^2-K1^2-K2^2)/(-2*K1*K2));
        x=180-x1;
        a=(1+K2*cosd(x)/K1)/ (K2*sind(x)/K1);
        alpha= atand((1+K2*cosd(x)/K1)/ (K2*sind(x)/K1));
        beta=alpha+x;  
    end

    alpha=-alpha;
    beta=-beta;
    error=inf;
    Ms=0;
    theta=0;
    
    K3=w*M1*Ip_f;
    K4=w*M2*Ip_f;
    K5=w*Is2*cosd(beta);
    K6=w*Is2*sind(beta);
    K7=w*Is1*cosd(alpha);
    K8=w*Is1*sind(alpha);
    K9=Vout*sind(alpha);
    K10=Vout*cosd(alpha);
    K11=Vout*sind(beta);
    K12=Vout*cosd(beta);
    for t=0:1e-2:90
      for  m=0:1e-8:Ls*1e-6
        
       e1=(K3+K5*m+K9);
       e2= (K3*tand(t)+K6*m-K10);
       e3=(K4+K7*m+K11);
       e4= (K4*tand(t)+K8*m-K12);
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
         
      e20=[e20,error];
          
      end   
      e10=[e10 error];
      
       
    end
    t=0:1e-2:90;
    plot(t,e10);
    figure;
    plot(e20);
end 

% [alpha,beta,theta,Ms]=numeric_solution(90,4,1.5,110,150,17.9,16.35,68.8,81)
