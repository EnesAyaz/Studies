
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_135kHz_DC.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2S135kHzDC = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_165kHz_DC.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2S165kHzDC = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_165kHz_xC.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2S165kHzxC = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_135kHz_xC.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2S135kHzxC = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;


%%

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_150kHz_DC.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2S150kHzDC = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_150kHz_xC.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, ...
    'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));
for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2S150kHzxC = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%
figure();
plot(P2S150kHzDC(:,1)/1000,(P2S150kHzDC(:,2)),'Color','r','LineWidth',2)
hold on;
plot(P2S150kHzxC(:,1)/1000,(P2S150kHzxC(:,2)),'Color','g','LineWidth',2)
hold on;
plot(P2S135kHzDC(:,1)/1000,(P2S135kHzDC(:,2)),':','Color','b','LineWidth',2)
hold on;
plot(P2S135kHzxC(:,1)/1000,(P2S135kHzxC(:,2)),':','Color','k','LineWidth',2)
hold on;
plot(P2S165kHzDC(:,1)/1000,(P2S165kHzDC(:,2)),'--','Color','m','LineWidth',2);
hold on;
plot(P2S165kHzxC(:,1)/1000,(P2S165kHzxC(:,2)),'--','Color','c','LineWidth',2)

title({'Frequency Response','Full-Aligned Condition'} ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'150kHz Decoupled','150kHz Cross-Coupled','135kHz Decoupled', ...
    '135kHz Cross-Coupled','165 khZ Decoupled','165kHz Cross-Coupled'},'FontSize',10,'Box','off');
set(lgnd,'color','none');
ylabel('Gain (dB)' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Frequency(kHz)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlim([130 170])
grid on;
%%


%%
figure();
subplot(2,1,1);
plot(P2S150kHzDC(:,1)/1000,(P2S150kHzDC(:,2)),'Color','r','LineWidth',2)
hold on;
plot(P2S150kHzxC(:,1)/1000,(P2S150kHzxC(:,2)),'Color','g','LineWidth',2)
hold on;
plot(P2S135kHzDC(:,1)/1000,(P2S135kHzDC(:,2)),'Color','b','LineWidth',2)
hold on;
plot(P2S135kHzxC(:,1)/1000,(P2S135kHzxC(:,2)),'Color','k','LineWidth',2)

title({'Frequency Response','Full-Aligned Condition'} ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'150kHz Decoupled','150kHz Cross-Coupled','135kHz Decoupled', ...
    '135kHz Cross-Coupled'},'FontSize',10,'Box','off');
set(lgnd,'color','none');
ylabel('Gain (dB)' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xticklabels([])
xlim([130 170])

grid on;

subplot(2,1,2);
plot(P2S150kHzDC(:,1)/1000,(P2S150kHzDC(:,2)),'Color','r','LineWidth',2)
hold on;
plot(P2S150kHzxC(:,1)/1000,(P2S150kHzxC(:,2)),'Color','g','LineWidth',2)
hold on;
plot(P2S165kHzDC(:,1)/1000,(P2S165kHzDC(:,2)),'Color','b','LineWidth',2)
hold on;
plot(P2S165kHzxC(:,1)/1000,(P2S165kHzxC(:,2)),'Color','k','LineWidth',2)

lgnd=legend({'150kHz Decoupled','150kHz Cross-Coupled','165 khZ Decoupled', ...
    '165kHz Cross-Coupled'},'FontSize',10,'Box','off');
set(lgnd,'color','none');
ylabel('Gain (dB)' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Frequency(kHz)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)

xlim([130 170])
grid on;


%%'165 khZ Decoupled','165kHz Cross-Coupled'