%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["time", "Vout", "ILp", "ILs1", "ILs2"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("D:\Github\Studies\WPT\Series-Parallel\Tx-Rx\journal_gain_plot\Third_Section\ltspice\series-compensation-series_Tx-Rx_misaligned", opts);
tbl = readtable("D:\Github\Studies\WPT\Series-Parallel\Tx-Rx\journal_gain_plot\Third_Section\ltspice\series-compensation-series_Tx-Rx_aligned", opts);
%% Convert to output type
time = tbl.time;
Vout = tbl.Vout;
ILp = tbl.ILp;
ILs1 = tbl.ILs1;
ILs2 = tbl.ILs2;

%% Clear temporary variables
clear opts tbl