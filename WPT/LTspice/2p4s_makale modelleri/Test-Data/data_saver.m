a=0:45:315;
a=string(a1);

a = ["0","22.5","45" ,"90" ,"135" ,"180", "225", "270" ,"315"];

for i= 1:length(a)
    
% Import the data
[~, ~, raw] = xlsread("Y:\Github\Studies\WPT\LTspice\2p4s_makale modelleri\Test-Data\test datalar.xlsx",a(i),"B12:G17");

% Create output variable
testdata = reshape([raw{:}],size(raw));

% Clear temporary variables
clearvars raw;

% k = array2table(testdata,'VariableName',{'P1','P2','S1','S2','S3','S4'});
% name=char(strcat('angle_',a(i)));


inductance_matrix.values{i}=testdata;
inductance_matrix.angles{i}=a(i);

% coupling_coeff.values{i}=testdata;
% coupling_coeff.angles{i}=a(i);


% 
save('inductance_matrix1.mat','inductance_matrix')
% save('coupling_coeff1.mat','inductance_matrix')

end 


for i= 1:length(a)
    
% Import the data
% [~, ~, raw] = xlsread("Y:\Github\Studies\WPT\LTspice\2p4s_makale modelleri\Test-Data\test datalar.xlsx",a(i),"B12:G17");
[~, ~, raw] = xlsread("Y:\Github\Studies\WPT\LTspice\2p4s_makale modelleri\Test-Data\test datalar.xlsx",a(i),"B22:G27");

% Create output variable
testdata = reshape([raw{:}],size(raw));

% Clear temporary variables
clearvars raw;

% k = array2table(testdata,'VariableName',{'P1','P2','S1','S2','S3','S4'});
% name=char(strcat('angle_',a(i)));


% inductance_matrix.values{i}=testdata;
% inductance_matrix.angles{i}=a(i);

coupling_coeff.values{i}=testdata;
coupling_coeff.angles{i}=a(i);


% 
% save('inductance_matrix1.mat','inductance_matrix')
save('coupling_coeff1.mat','inductance_matrix')

end 



