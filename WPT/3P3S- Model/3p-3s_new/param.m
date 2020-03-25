% clc;
% clear;
%% Voltage and frequency 
Vin_peak=(100)*sqrt(2); %V   peak of the sinus
fop=155; %kHz
P_cont=1;
I_cont=10;
stopTime= 0.1;
%% inductance  matrices
p1=49;
p2=49;
p3=49;
s1=40;
s2=40;
s3=40;
p1p2 =0;
p1p3=0;
p1s1=8.9;
p1s2=0;
p1s3=0;
p2p3=0;
p2s1=0;
p2s2=8.9;
p2s3=0;
p3s1=0;
p3s2=0;
p3s3=8.9;
s1s2=0;
s1s3=0;
s2s3=0;
M= [p1 p1p2 p1p3 p1s1 p1s2 p1s3 ; ...
    p1p2 p2 p2p3 p2s1 p2s2 p2s3 ; ...
    p1p3 p2p3 p3 p3s1 p3s2 p3s3 ; ...
    p1s1 p2s1 p3s1 s1 s1s2 s1s3 ; ...
    p1s2 p2s2 p3s2 s1s2 s2 s2s3 ; ...
    p1s3 p2s3 p3s3 s1s3 s2s3 s3];


R= [3 0 0 0 0 0 ;
    0 3 0 0 0 0 ;
    0 0 3 0 0 0 ;
    0 0 0 2 0 0;
    0 0 0 0 2 0;
    0 0 0 0 0 2];


