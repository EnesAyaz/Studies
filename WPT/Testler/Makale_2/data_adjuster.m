
clear all;

load('FA150_decoupled.mat');
timeFA150DC=timeTx;
FA_150_DC_Is1=Is1;
FA_150_DC_Is2=Is2;
FA_150_DC_Ip=Iin;
FA_150_DC_Vp=IinVin;

clear Iin IinVin Is1 Is1Vin Is2 Is2Vin timeRx1 timeRx2 timeTx
%%
load('MA150_decoupled.mat');
timeMA150DC=timeTx;
MA_150_DC_Is1=Is1;
MA_150_DC_Is2=Is2;
MA_150_DC_Ip=Iin;
MA_150_DC_Vp=IinVin;

clear Iin IinVin Is1 Is1Vin Is2 Is2Vin timeRx1 timeRx2 timeTx

%%

load('FA135_decoupled.mat');
timeFA135DC=timeTx;
FA_135_DC_Is1=Is1;
FA_135_DC_Is2=Is2;
FA_135_DC_Ip=Iin;
FA_135_DC_Vp=IinVin;

clear Iin IinVin Is1 Is1Vin Is2 Is2Vin timeRx1 timeRx2 timeTx

%%
load('MA135_decoupled.mat');
timeMA135DC=timeTx;
MA_135_DC_Is1=Is1;
MA_135_DC_Is2=Is2;
MA_135_DC_Ip=Iin;
MA_135_DC_Vp=IinVin;

clear Iin IinVin Is1 Is1Vin Is2 Is2Vin timeRx1 timeRx2 timeTx

%%

load('FA150.mat');
timeFA150=time;
FA_150_C_Is1=FA150Is1;
FA_150_C_Is2=FA150Is2;
FA_150_C_Ip=FA150Iin;
FA_150_C_Vp=FA150Vin;

clear FA150Is1 FA150Is2 FA150Iin FA150Vin time
%%
load('MA150.mat');
timeMA150=time;
MA_150_C_Is1=MA150Is1;
MA_150_C_Is2=MA150Is2;
MA_150_C_Ip=MA150Iin;
MA_150_C_Vp=MA150Vin;

clear MA150Is1 MA150Is2 MA150Iin MA150Vin time
%%

load('FA135.mat');
timeFA135=time;
FA_135_C_Is1=FA135Is1;
FA_135_C_Is2=FA135Is2;
FA_135_C_Ip=FA135Iin;
FA_135_C_Vp=FA135Vin;

clear FA135Is1 FA135Is2 FA135Iin FA135Vin time

%%
load('MA135.mat');
timeMA135=time;
MA_135_C_Is1=MA135Is1;
MA_135_C_Is2=MA135Is2;
MA_135_C_Ip=MA135Iin;
MA_135_C_Vp=MA135Vin;

clear MA135Is1 MA135Is2 MA135Iin MA135Vin time


