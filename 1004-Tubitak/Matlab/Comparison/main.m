Vin=880;  % V
Vout= 1200; % V
Pout=20000;  % W
NumberOfSeries=1;
NumberOfParallel=1;
SwitchingFrequency=1e4; % Hz

Lsp=[];
Csp=[];
Vinsp=[];
Voutsp=[];
Iinsp=[];
Ioutsp=[];
for NumberOfSeries=1:1:6
    
    Lp=[];
    Cp=[];
    Vinp=[];
    Voutp=[];
    Iinp=[];
    Ioutp=[];
    for NumberOfParallel= 1:1:8

    [L,Cout,VinOneModule,IinOneModule,VoutOneModule,IoutOneModule]= ...
    calculations(Vin,Vout,Pout,NumberOfSeries, NumberOfParallel,SwitchingFrequency);
    Lp=[Lp, L];
    Cp=[Cp, Cout];
    
    Vinp=[Vinp,VinOneModule];
    Voutp=[Voutp,VoutOneModule];
    Iinp=[Iinp,IinOneModule];
    Ioutp=[Ioutp,IoutOneModule];

    end 
    Lsp=[Lsp; Lp];
    Csp=[Csp; Cp];
    
    Vinsp=[Vinsp;Vinp];
    Voutsp=[Voutsp;Voutp];
    Iinsp=[Iinsp;Iinp];
    Ioutsp=[Ioutsp;Ioutp];

    
    
    
end

%%
NumberOfSeries=1:1:6;
NumberOfParallel= 1:1:8;

figure();
mesh(NumberOfParallel,NumberOfSeries,Lsp*1e6)
title('L')

CoeffCsp=ones([6,8]);
for i = 1:6
    for j=1:8
    CoeffCsp(i,j)=j/i; 
    end
    
end

figure();
mesh(NumberOfParallel,NumberOfSeries,Csp.*CoeffCsp*1e6)
title('C')
% 
% figure();
% mesh(NumberOfSeries,NumberOfParallel,Vinsp)
% title('Vin')
% 
% figure();
% mesh(NumberOfSeries,NumberOfParallel,Voutsp)
% title('Vout')
% 
% figure();
% mesh(NumberOfSeries,NumberOfParallel,Iinsp)
% title('Iin')
% 
% figure();
% mesh(NumberOfSeries,NumberOfParallel,Ioutsp)
% title('ıout')



