vertical_strand_number=23;
horizontal_strand_number=2;

main_insulation=3e-3;
strand_height=2.46e-3;
strand_width=7.69e-3;
slot_height=152e-3;
slot_width=22e-3;
strand_insulation=0.21e-3;
spacer=7.5e-3;

h_Cu= 2.46e-3;  %%strand_height % in meter
h_N= 152e-3;  %%slot_height % in meter
b_N= 21.8e-3;   %% strand_width % in meter
y_0= 3e-3;     %% strand starting point
h_is=0.21e-3; %% strand starting point

nu_0=4*pi*1e-7; % permeability of air

strand_number=vertical_strand_number*horizontal_strand_number;

%%

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

Lbottom=[L1;L2]; % total inductance matrix; 


L11=zeros([strand_number/2, strand_number/2]); %% an inductance matrix of  horizontal strands


for i=1:strand_number/2
    for j=1:strand_number/2
         k=max(i,j);
         y0=spacer+3*main_insulation+(strand_number/2+k)*(strand_height+strand_insulation)
         L11(i,j)=nu_0*((slot_height-y0)/slot_width);    
    end  
end


L12= fliplr(L11)

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

%%

I=1860; 
I_strand=I/strand_number;
constant=R*I_strand;

length=0.9; %m
dl= length/strand_number;
dl=dl*2;


MMF_bottom=(1:23)*I_strand*2;

MMF_top=(24:46)*I_strand*2;


H_bottom= MMF_bottom/(slot_width);
H_top= MMF_top/(slot_width);

 
B_bottom=nu_0*H_bottom;
B_top=nu_0*H_top;


Flux_top= zeros([strand_number/2,1]);
Flux_bottom= zeros([strand_number/2,1]);
% 

for i=1:strand_number/2
    Flux_top(i,1)= B_top(1,i)*strand_height;
   Flux_bottom(i,1)= B_bottom(1,i)*strand_height;
end

Flux_top = [Flux_top; flipud(Flux_top)];
Flux_bottom = [Flux_bottom; flipud(Flux_bottom)];
%%
plot(Flux_top)
hold on;
plot(Flux_bottom)
%%

Flux_top_radial= zeros([strand_number/2,1]);

for i=1:strand_number/2
   
    
end




%%
V0_bottom= zeros([strand_number,1]);
V0_top= zeros([strand_number,1]);

for i=1:strand_number
    V0_bottom(i,1)= -1i*w*Flux_bottom(i,1)-constant;
    V0_top(i,1)= -1i*w*Flux_top(i,1)-constant;
end
%%
plot(V0_top)
hold on;
plot(V0_bottom)
%%
% 
P=eye(strand_number);
P=[P(2:end,:);P(1,:)]
% 
Z_tot_bottom=zeros([strand_number,strand_number]);
Z_tot_top=zeros([strand_number,strand_number]);
V_tot_bottom=zeros([strand_number,1]);
V_tot_top=zeros([strand_number,1]);
% 
for i=1:strand_number/2+1
    if i<=1
    Z_tot_bottom= Z_tot_bottom+Z_bottom*dl/2;
    Z_bottom=P*Z_bottom*P';
    V_tot_bottom=V_tot_bottom+V0_bottom*dl/2;
    V0_bottom=P*V0_bottom;
    
    Z_tot_top= Z_tot_top+Z_top*dl/2;
    Z_top=P*Z_top*P';
    V_tot_top=V_tot_top+V0_top*dl/2;
    V0_top=P*V0_top;
   
    elseif i<=strand_number/2
    Z_tot_bottom= Z_tot_bottom+Z_bottom*dl;
    Z_bottom=P*Z_bottom*P';
    V_tot_bottom=V_tot_bottom+V0_bottom*dl;
    V0_bottom=P*V0_bottom;
    
    Z_tot_top= Z_tot_top+Z_top*dl;
    Z_top=P*Z_top*P';
    V_tot_top=V_tot_top+V0_top*dl;
    V0_top=P*V0_top;
   
    else 
    Z_tot_bottom= Z_tot_bottom+Z_bottom*dl/2;
    V_tot_bottom=V_tot_bottom+V0_bottom*dl/2;
 
    Z_tot_top= Z_tot_top+Z_top*dl/2;
    V_tot_top=V_tot_top+V0_top*dl/2;
    i
    end
end

Zy=-1*ones([strand_number,1]);

Z_final_bottom=[Z_tot_bottom,Zy];
Z_final_top=[Z_tot_top,Zy];

Zx=ones([1,strand_number]);
Zx=[Zx,0];
Z_final_bottom=[Z_final_bottom; Zx];
Z_final_top=[Z_final_top; Zx];


V_final_bottom=[V_tot_bottom;0];
V_final_top=[V_tot_top;0];


icirculate_bottom=inv(Z_final_bottom)*V_final_bottom;

current_strand_bottom=icirculate_bottom+I_strand;

icirculate_top=inv(Z_final_top)*V_final_top;

current_strand_top=icirculate_top+I_strand;

% 
figure();
stem(icirculate_bottom)
hold on;
stem(icirculate_top)
% 
% 
%%






