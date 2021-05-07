load('deltaM.mat');
load('f_fr.mat');
%%
load('PP_1.mat');
Pratio2=Pratio;
Pratio2(:,50)=Pratio(:,49);
Pratio2(:,51)=(Pratio(:,49)+Pratio(:,53))/2;
Pratio2(:,52)=Pratio(:,53);
plot_figure(y_fig,x_fig,Pratio2);
%%

load('PS_1.mat');
Pratio2=Pratio;
Pratio2(:,51)=(Pratio(:,50)+Pratio(:,52))/2;

plot_figure(y_fig,x_fig,Pratio2);

%%

load('SS_1.mat');
Pratio2=Pratio;
Pratio2(:,49)=Pratio(:,48);
Pratio2(:,50)=(Pratio(:,48)+Pratio(:,54))/2;
Pratio2(:,51)=(Pratio(:,48)+Pratio(:,54))/2;
Pratio2(:,52)=(Pratio(:,48)+Pratio(:,54))/2;
Pratio2(:,53)=Pratio(:,54);

plot_figure(y_fig,x_fig,Pratio2);

%%

load('SP_1.mat');
Pratio2=Pratio;
plot_figure(y_fig,x_fig,Pratio2);

