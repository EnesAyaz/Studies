clear ;
clc;
tic;
%% Time array
Tstep = 1e-7; % s
fsw = 40e3; % Hz
numberofcarrier=10;
Tfinal =numberofcarrier/fsw ; % s

%% Generate switching signals
Vcarrier=[];
for k = 1:(numberofcarrier)
   Triang_temp = triang(1/(Tstep*fsw));
   Triang_temp=[0;Triang_temp];
   Vcarrier=[Vcarrier;Triang_temp];
end
Vcarrier=[Vcarrier;0];
time=linspace(0,Tfinal,length(Vcarrier));
%%
VrefA=0.5*ones(length(Vcarrier),1);
VrefB=0.2*ones(length(Vcarrier),1);

SA = double(VrefA > Vcarrier);
SB = double(VrefB > Vcarrier);

figure();
plot(time,SA);
hold on;
plot(time,SB);
%%
fs=1/(time(2)-time(1));
Vout=SA-SB;


y = lowpass(Vout,fsw*3.5,fs);
figure();
plot(time,SB);
hold on;
plot(time,y);
hold on;

%%

v1 = -cos(2*pi*fsw*time);
v3 = -cos(2*pi*3*fsw*time);
v13=v1+v3;

y = lowpass(Vout,fsw*0.5,fs);
figure();
plot(time,Vout);
hold on;
plot(time,v13);
hold on;
% plot(time,SB);
% hold on;



