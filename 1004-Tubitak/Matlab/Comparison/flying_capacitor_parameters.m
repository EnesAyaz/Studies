sampleTime=5e-7;

%%
P=20e3; % W
Vin= 900; % V
Vout=1200; 
D=(1-Vin/Vout);
Rload=Vout^2/P;
Iin=P/Vin;
DeltaIL= Iin*0.20;
DeltaVCFLY= (Vout/2)*0.01;
%%
fsw=20e3;

Lboost= ((Vin-Vout/2)*D)/(DeltaIL*fsw);
Cfly=(Iin*D)/(fsw*DeltaVCFLY);
Cfly=Cfly/2;
Cout=Cfly;

%%

ModuleAPhase=90; % degree
ModuleBPhase=270; % degree
ModuleCPhase=0; % degree
ModuleDPhase=180; % degree
%%
