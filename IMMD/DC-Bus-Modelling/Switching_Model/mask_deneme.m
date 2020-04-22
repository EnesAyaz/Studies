m=0.9;
f_f= 50;
f_s=1000;
the_f=0;
the_c=0;
i1=20;
i2=100;
%%

modulation_index=m;
fundamental_freq =f_f;
carrier_freq= f_s;
phase_fundamental = the_f;
phase_carrier = the_c;
iteration_number1 =i1;
iteration_number2 =i2;
simulation_time = 0.20;

S1=0;

fundamental_angFreq=2*pi*fundamental_freq;
carrier_angFreq= 2*pi*carrier_freq;
phase_fundamental=phase_fundamental+pi/2;


for m=1:iteration_number1
    for n= -iteration_number2:iteration_number2  
        S1=S1+ (2/(m*pi))*sin((m+n)*pi/2)*...
                besselj(n,m*modulation_index*pi/2)*...
                cos(m*(carrier_angFreq*simulation_time-phase_carrier)...
                +n*(fundamental_angFreq*simulation_time-phase_fundamental));
       
        
        
    end
end

S1= S1+(1/2)+ (modulation_index/2)*cos(fundamental_angFreq*simulation_time-phase_fundamental);




y = S1;