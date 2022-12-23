I=1860;
strand_number=46;
I_strand=I/strand_number;
MMF_bottom= mmf_creater(strand_number);


strand_height_46=2.46e-3;
strand_insulation=0.21e-3;

strand_height=(strand_height_46+strand_insulation/2)*24/(strand_number/2+1)-strand_insulation/2;
% strand_height
% strand_height_46*48/(strand_number+2)
main_insulation=3e-3;
strand_width=7.69e-3;
slot_height=152e-3;
slot_width=22e-3;
spacer=7.5e-3;
nu_0=4*pi*1e-7; % permeability of air


MMF_bottom=MMF_bottom*nu_0/slot_width;



L11=zeros([strand_number/2, strand_number/2]); %% an inductance matrix of  horizontal strands
for i=1:strand_number/2
    for j=1:strand_number/2
         k=max(i,j);
         y0=main_insulation+(k)*(strand_height+strand_insulation);
         L11(i,j)=nu_0*((slot_height-y0)/slot_width);    
    end  
end
L12= fliplr(L11);
L1=[L11, L12];
L2=flipud(L1);
Lbottom=[L1;L2];

L11=zeros([strand_number/2, strand_number/2]); %% an inductance matrix of  horizontal strands


for i=1:strand_number/2
    for j=1:strand_number/2
         k=max(i,j);
         y0=spacer+3*main_insulation+(strand_number/2+k)*(strand_height+strand_insulation);
         L11(i,j)=nu_0*((slot_height-y0)/slot_width);    
    end  
end


L12= fliplr(L11);

L1=[L11, L12];

L2=flipud(L1);

Ltop=[L1;L2]; % total inductance matrix; 

ro_copper=1.72e-8; % Ωm
R=ro_copper/(strand_height*strand_width);

f=50; 
w=2*pi*f;

Z_bottom=1i*w*Lbottom;
Z_top=1i*w*Ltop;

for i=1:strand_number
    Z_bottom(i,i)=Z_bottom(i,i)+R;
    Z_top(i,i)=Z_top(i,i)+R;
end

% constant=R*I_strand;

length=0.9; %m
dl= length/strand_number;

%%
% 
P=eye(strand_number);
P=[P(2:end,:);P(1,:)]
% 
Z_tot_bottom=zeros([strand_number,strand_number]);
Z_tot_top=zeros([strand_number,strand_number]);
Ptot=zeros([strand_number,strand_number]);

for i=0:strand_number
   
    if i==0     
    Ptot=Ptot+P^i*dl/2;
    elseif i==strand_number
    Ptot=Ptot+P^i*dl/2; 
    else
    Ptot=Ptot+P^i*dl;          
    end
    
end

Flux_bottom=Ptot*(MMF_bottom*strand_height_46);
V_bottom=-1i*w*Flux_bottom;


% 
for i=1:strand_number+1
    if i<=1
    Z_tot_bottom= Z_tot_bottom+Z_bottom*dl/2;
    Z_bottom=P*Z_bottom*P';
    
    Z_tot_top= Z_tot_top+Z_top*dl/2;
    Z_top=P*Z_top*P';
   
    elseif i<=strand_number
    Z_tot_bottom= Z_tot_bottom+Z_bottom*dl;
    Z_bottom=P*Z_bottom*P';
 
    Z_tot_top= Z_tot_top+Z_top*dl;
    Z_top=P*Z_top*P';

    else 
    Z_tot_bottom= Z_tot_bottom+Z_bottom*dl/2;
    end
end


A=Z_tot_bottom-V_bottom;

% rref(A)

A=[A; ones([1,strand_number])];
A=[A, zeros([strand_number+1,1])];
% A(end,end)=-1;
% null(rref(A))

B=zeros([strand_number+1,1]);
B(end)=I;

icirculate_bottom=pinv(A)*B;

%%
stem(abs(icirculate_bottom(1:end-1)))






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

