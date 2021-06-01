function [L,Cout,VinOneModule,IinOneModule,VoutOneModule,IoutOneModule]= ...
    calculations(Vin,Vout,Pout,NumberOfSeries, NumberOfParallel,SwitchingFrequency)

VinOneModule= Vin/NumberOfSeries;
VoutOneModule= Vout/NumberOfSeries;

PoutOneModule= Pout/(NumberOfSeries*NumberOfParallel);
IoutOneModule=PoutOneModule/VoutOneModule;

PinOneModule= PoutOneModule/0.9;

DeltaIin=(PinOneModule/VinOneModule)*0.2*NumberOfParallel;

IinOneModule=PinOneModule/VinOneModule;

D=(1-VinOneModule/VoutOneModule);

DeltaVout=VoutOneModule*0.02*NumberOfSeries;

Cout= (IoutOneModule*D)/(SwitchingFrequency*DeltaVout);

L= (VinOneModule*(D-1))/(-DeltaIin*SwitchingFrequency);

end