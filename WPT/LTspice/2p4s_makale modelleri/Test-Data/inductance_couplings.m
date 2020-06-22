load('inductance_matrix');

load('coupling_coeff');

%%
clc;
i=4;
angles=inductance_matrix.angles{i}
self_inductance=eye(6,6).*inductance_matrix.values{1, i}
couplings=(triu(ones(6,6))-eye(6,6)).*coupling_coeff.values{1,i}