
%% Initialize variables.
pos='Full';
% pos='Miss'
freq='150';
% freq='135'
%%
meas = string( {'C1Vin','C2Iin','C2Is1', 'C2Is2'} );
%%
if pos =='Full'
    p2='FA';
elseif pos =='Miss'
    p2='MA';  
else 
end
     
%%

file=strcat(pos,'AlignResCap',freq,'\C1VinFA135_300w00000.dat');
director = 'Y:\Github\WPT-DATA\1e2 Test\Osciloskop\2020.07.14\';

% filename
delimiter = ' ';

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
e005 = dataArray{:, 1};
VarName2 = dataArray{:, 2};


%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;