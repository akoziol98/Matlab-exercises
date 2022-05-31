%% Exercise 1
NAMES={'John ','Robert ','James ',' Michael', 'Mary', 'Jenny', 'David', 'William'};
% How many names start with the letter ‘J’?
j_name = sum(cellfun(@(x) x(1) == 'J', NAMES))
fprintf('There are %d names starting with "J":', j_name);

% Substitute the string ‘es’ with the string ‘iroquai’ in the third name.
NAMES{3} = strrep(NAMES{3},'es', 'iroquai')

% Is the first name equal to the third? Use a command to show it.
switch strcmp(NAMES{1}, NAMES{3})
    case 0 
        disp('Names are not equal');
    case 1
        disp('Names are equal');
end

% Convert the names in the odd columns to uppercase.
NAMES(1:2:end) = cellfun(@(x) upper(x), NAMES(1:2:end), 'UniformOutput', false);

% Display the formatted string ‘The best is’ followed by the name of the seventh name.
sprintf('The best is %s%s', NAMES{7}(1), lower(NAMES{7}(2:end)))

% Delete the names starting with J
NAMES(cellfun(@(x) x(1) == 'J', NAMES)) = [];

%% Exercise 2
WEEK={'Monday ','Tuesday ','Wednesday ','Thursday', 'Friday', 'Saturday', 'Sunday'};
week_char = threeLetters(WEEK);

%% Exercise 3
% Load the saved viewership data into the MATLAB workspace. 
load('viewdata.mat');
vid_length = viewdata(:, 1);
views = viewdata(:, 2);
min_watched = viewdata(:, 3);
% Create the column vector viewPct containing the percentage viewed for each variable
%according to the formula: Percentage viewed = (Minutes watched / Views) / (Video length).
viewPct = (min_watched ./ views) ./ vid_length;

% Create vectors containing the percentage viewed for short (Video length < 1.5), 
%medium (1.5<= Video length <= 2.25), and long (Video length > 2.25) videos).
short = viewPct(vid_length < 1.5);
medium = viewPct(vid_length >= 1.5 & vid_length <= 2.25);
long = viewPct(vid_length > 2.25);

% Calculate the average of the values contained in the vectors from the previous step, and store
% the results in the variables shortPct, medPct, and longPct respectively
shortPct = mean(short, 'all');
medPct = mean(medium, 'all');
longPct = mean(long, 'all');

%% Exercise 4
G = {'Adam', 'Brad', 'Charley', 'David', 'Emily';
    90, 92, 96, 95, 88;
    'A-', 'A-', 'A', 'A', 'B+'};
studentStruct = struct();
for i = 1:length(G)
    studentStruct(i).name = G{1,i};
    studentStruct(i).average = G{2,i};
end

for i = 1:length(G)
    if studentStruct(i).average < 90
        studentStruct(i).letter = 'B+';
    elseif studentStruct(i).average >= 90 & studentStruct(i).average < 95
        studentStruct(i).letter = 'A-';
    elseif studentStruct(i).average >= 95
        studentStruct(i).letter = 'A';
    end
end