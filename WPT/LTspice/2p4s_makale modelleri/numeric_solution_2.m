% [alpha,beta,theta,Ms]=numeric_solution_2(90,4,1.5,110,150,17.9,16.35)
% vin,Is1,Is2,Vout in rms value
% f in kHz
% M1 and M2 microHenry
function [alpha,beta,theta,Ms]=numeric_solution_2(Vin,Is1,Is2,Vout,f,M1,M2)
    w=2*pi*f*1e3;
    M1=M1*1e-6;
    M2=M2*1e-6;
    Vin=Vin*sqrt(2);
    Is1=Is1*sqrt(2);
    Is2=Is2*sqrt(2);
    Vout=Vout*sqrt(2);
    Ip_f= Vout*(Is1+Is2)/Vin;

    K1=w*M1*Is1;
    K2=w*M2*Is2;
    if K1+K2>Vin
        x1= acosd((Vin^2-K1^2-K2^2)/(-2*K1*K2));
        x=180-x1;
        a=(1+K2*cosd(x)/K1)/ (K2*sind(x)/K1);
        alpha= atand((1+K2*cosd(x)/K1)/ (K2*sind(x)/K1));
        beta=alpha+x;  
    end

    
    K3=w*M1*Ip_f;
    K4=w*Is2*sind(270-alpha-beta);
    

    
end 

