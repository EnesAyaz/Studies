function [f, Mag, Phase] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max)

f=[];
Mag=[];
Phase =[];
The_o=-The_o;
for m=1:m_max
    for n= -n_max:n_max  
        f =[f m*f_c+n*f_o ];
        Mag=[ Mag abs((2/(m*pi))*sin((m+n)*pi/2)*besselj(n,m*k*pi/2))];
        if (2/(m*pi))*sin((m+n)*pi/2)*besselj(n,m*k*pi/2)<0
            Phase= [Phase (-m*The_c-n*The_o-pi)];
        else 
            Phase= [Phase (-m*The_c-n*The_o)];
        end 
              
    end
end

f= [0 f_o f];
Mag=[1/2 k/2 Mag];
Phase=[0 -The_o Phase];
Phase=mod(Phase,2*pi);

end
