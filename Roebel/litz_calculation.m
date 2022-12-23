I=1860;
strand_number=46;
I_strand=I/strand_number;
MMF_bottom= mmf_creater(strand_number);


strand_height_46=2.46e-3;
strand_insulation=0.21e-3;

strand_height=(strand_height_46+strand_insulation/2)*24/(strand_number/2+1)-strand_insulation;
% strand_height
% strand_height_46*48/(strand_number+2)
main_insulation=3e-3;
strand_width=7.69e-3;
slot_height=152e-3;
slot_width=22e-3;
spacer=7.5e-3;
nu_0=4*pi*1e-7; % permeability of air

MMF_bottom=MMF_bottom*nu_0/slot_width;

function MMF = mmf_creater(strand_number)
MMF=zeros([strand_number/2,strand_number/2]);
for i=1:strand_number/2
    for j=1:strand_number/2
        if j<=i
           MMF(i,j)=1;
        end
    end  
end
MMF=[MMF,fliplr(MMF)];
MMF=[MMF; flipud(MMF)];
end