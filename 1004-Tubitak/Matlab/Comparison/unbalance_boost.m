sampleTime=5e-8;
Vout=1200; 
Vin=900;
D=(1-Vin/Vout);
DeltaD=0;
D1=D+DeltaD;
D2=D-DeltaD;
%%D2=D;
Rin=1e-3;
Lin=1e-9;
CinModule=10e-3;
CoutModule=136e-6;
%%CoutModuless=544e-6;
CoutModulesp=271e-6;
Vcap=Vin;
%%
Rcoil=1e-3;
Lcoil=2.058e-3;
Lcoilsp=0.517e-3*2;
%%Lcoilsp=0.517e-3;

%%
%%fsw=10e3;
ModuleAPhase=0; % degree
ModuleBPhase=180; % degree
%%

fsw=50e3;

