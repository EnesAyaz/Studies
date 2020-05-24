function [f_resultant, Mag_resultant, Phase_resultant] = LegFunction(I_mag,I_phase,k,f_o,f_c,The_o,The_c,m_max,n_max)

[f, Mag, Phase] = SwitchingFunction(k,f_o,f_c,The_o,The_c,m_max,n_max);

f_new= 0:f_o:max(f);
y=(f/f_o)+1;
Mag_new=zeros(1,length(f_new));
Phase_new=zeros(1,length(f_new));

for i=1:length(y)
Mag_new((y(i))) =Mag(i);
Phase_new((y(i)))=Phase(i);
end

f_new_left=f_new-f_o;
f_new_left = [f_new_left f_new(end) f_new(end)+f_o];

Mag_new_left= [(Mag_new*I_mag)/2 0 0 ];
Phase_new_left=[(Phase_new-I_phase) 0 0 ];

Mag_new_right= [0 0 (Mag_new*I_mag)/2  ];
Phase_new_right=[0 0 (Phase_new+I_phase) ];

% Mag_resultant=abs(Mag_new_right.*cos(Phase_new_right)+Mag_new_left.*cos(Phase_new_left));
% Phase_resultant=angle(Mag_new_right.*cos(Phase_new_right)+Mag_new_left.*cos(Phase_new_left));

Mag_resultant=sqrt(Mag_new_right.*Mag_new_right+Mag_new_left.*Mag_new_left-2*Mag_new_right.*Mag_new_left.*cos(Phase_new_right-Phase_new_left));
Phase_resultant=atan((Mag_new_right.*sin(Phase_new_right)+Mag_new_left.*sin(Phase_new_left))./ ...
                    (Mag_new_right.*cos(Phase_new_right)+Mag_new_left.*cos(Phase_new_left)));

f_resultant=f_new_left(2:end);
Mag_resultant(3)=Mag_resultant(3)+Mag_resultant(1);
Mag_resultant=Mag_resultant(2:end);
Phase_resultant=Phase_resultant(2:end);

end

