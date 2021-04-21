%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 6);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["time", "Vout", "Vs1", "Vs2", "Vin", "ILp"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("D:\Github\Studies\WPT\Series-Parallel\Tx-Rx\journal_gain_plot\Third_Section\ltspice\results\series-compensation-series_Tx-Rx_misaligned", opts);

%% Convert to output type
time = tbl.time;
Vout = tbl.Vout;
Vs1 = tbl.Vs1;
Vs2 = tbl.Vs2;
Vin = tbl.Vin;
ILp = tbl.ILp;

%% Clear temporary variables
clear opts tbl