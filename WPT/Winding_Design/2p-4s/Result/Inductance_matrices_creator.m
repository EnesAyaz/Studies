for i=0:15:360
% Initialize variables.
a=string(i);
b=strcat(a,'.mat');
filename = strcat('Z:\Github\Studies\WPT\Winding_Design\2p-4s\Result\',a,'.txt');
delimiter = '\t';
startRow = 8;
endRow = 13;

% Format for each line of text:
formatSpec = '%*s%*s%f%f%f%f%f%f%[^\n\r]';

% Open the text file.
fileID = fopen(filename,'r');

% Read columns of data according to the format.
textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', delimiter, 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');

% Close the text file.
fclose(fileID);

% Post processing for unimportable data.

% Create output variable
L=[dataArray{1:end-1}]*1e-9;
save(b,'L');
% Clear temporary variables
clearvars filename delimiter startRow endRow formatSpec fileID dataArray ans L;

end