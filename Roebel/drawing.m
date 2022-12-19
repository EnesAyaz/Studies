A = randn(23,2);


matvisual(imag(Z_final_top(1:46,1:46)),'Annotation')
matvisual(imag(Z_final_bottom(1:46,1:46)),'Annotation')
colorbar()
%%
% [Flux_top(1:23),flipud(Flux_top(24:46))]
matvisual(-imag([V_final_top(1:23),flipud(V_final_top(24:46))]),'Annotation')
matvisual(-imag([V_final_bottom(1:23),flipud(V_final_bottom(24:46))]),'Annotation')
% matvisual([Flux_bottom(1:23),flipud(Flux_bottom(24:46))],'Annotation')
colorbar()

%%

% Z=[imag(Z_final_top(1:46,1:46)) ; imag(Z_final_bottom(1:46,1:46))]
% 
% Zp= reshape(Z',46,46,2)

%%

% matvisual(Zp,'Annotation')