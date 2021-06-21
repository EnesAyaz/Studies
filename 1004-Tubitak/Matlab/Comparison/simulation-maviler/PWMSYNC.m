function [Vg_up, Vg_down, testport]  = PWMSYNC(Vref , car12, phase)
% pwmSwitchingTimeThreeLevel Three-level PWM switching time calculation.
% SPWM function derived by MathWorks. SVM function based on: J. H. Seo,
% C. H. Choi, and D. S. Hyun, "A new simplified space-vector PWM method for
% three-level inverters," IEEE Trans. Power Electron., vol. 16, no. 4,
% pp. 545-550, Jul. 2001.

% Copyright 2015-2016 The MathWorks, Inc.

%#codegen

testport=zeros(3,1);    % This is to inform matlab on output size.
Vref_PWM1=0;
Vref_PWM2=0;
% Also read for input argument assertions. (Declare and Validate Arguments)
% https://www.mathworks.com/help/matlab/input-and-output-arguments.html
SolverSamplingFreq=1e6;
converterSwitchingFrequency=20e3;
CarrierGain=SolverSamplingFreq/converterSwitchingFrequency;
% output ON and OFF gating times
timer1=car12;

timer2Delay=phase/360*CarrierGain;
timer2=mod((timer1+timer2Delay), CarrierGain+1);

Vref_PWM=Vref*CarrierGain;;


if Vref_PWM1>timer1
    Vg_up=1;
else 
    Vg_up=0;
end

if Vref_PWM2>timer2
    Vg_down=1;
else 
    Vg_down=0;
end

testport(1)=Vref_PWM; 

end

