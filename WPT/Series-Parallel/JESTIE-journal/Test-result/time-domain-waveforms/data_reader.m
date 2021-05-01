function y= data_reader(folder_path,data_name)
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
data_path=strcat(folder_path,data_name);
y = readtable(data_path, opts);
clear opts data_path
end 

