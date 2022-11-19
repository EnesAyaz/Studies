%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);
% Specify range and delimiter
opts.DataLines = [2 Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Speed", "Torque"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("D:\Github\Studies\WindTurbine\Giris Torku vs Hiz.csv", opts);

%Convert to output type
Speed = tbl.Speed;
Torque = tbl.Torque;

%Clear temporary variables
clear opts tbl

%%

figure()
plot(Speed,Torque)