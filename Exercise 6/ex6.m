%% Exercise 1
Study = readtable('patients.dat'); 
% Create a subtable getting the information only from the first ten participants keeping
%information only from the Last Name, height and weight.
subtable = Study(1:10,{'LastName','Height', 'Weight'})

% Create a subtable getting the information only from participant number 8 to 28 keeping
%information only from the Last Name, systolic and diastolic data.
subtable_2 = Study(8:28,{'LastName','Systolic', 'Diastolic'})

% Get the patients that are in common in both tables
innerjoin(subtable, subtable_2)

% Get all the patients
outerjoin(subtable, subtable_2, 'Keys','LastName','MergeKeys',true);

%% Exercise 2
load patients
% Create a table and populate it with the Age, Gender, Height, Weight,
%and Smoker workspace variables. Use the unique identifiers in LastName as row names.
T = table(Age, Gender, Height, Weight, Smoker);
T.Properties.RowNames = LastName;

%Use parenthesis indexing to create a subtable containing the first five rows and all the variables from T
subtable_patients = T(1:5, :)

%Display all the data for the patients with the last names 'Williams' and ‘Brown’.
T({'Williams','Brown'},:)

% Table variable names do not have to be valid MATLAB identifiers. They can include spaces and 
%non-ASCII characters, and can start with any character. Use SelfAssessedHealthStatus and 
%add a variable name with spaces and a dash to T. Then index into T using variable names.
T = addvars(T, SelfAssessedHealthStatus, 'NewVariableNames',' Self-diagnosis  ');
T(:, {' Self-diagnosis  '})

% Calculate the average weight and height of all participants older than 40.
mean_height = mean(T.Height(T.Age > 40))
mean_weight = mean(T.Weight(T.Age > 40))

% Calcute the average age, weight and height of all males and females.
id_f = T.Gender == "Female";
id_m = T.Gender == "Male";

mean_age_f = mean(T.Age(id_f))
mean_age_m = mean(T.Age(id_m))

mean_w_f = mean(T.Weight(id_f))
mean_w_m = mean(T.Weight(id_m))

mean_h_f = mean(T.Height(id_f))
mean_h_m = mean(T.Height(id_m))

% Create a subtable with all patients that are female, height > 150, weight > 55 and age > 30.
subtable_3 = T(T.Gender == "Female" & T.Height > 150 & T.Weight > 55 & T.Age > 30,:)
subtable_4 = T(T.Gender == "Female" & T.Height > 67 & T.Weight > 130 & T.Age > 30,:) %just to show table that is not empty

%% Exercise 3
T = readtable('testScores.csv','ReadRowNames',true);
% Extract the data from the second, third, and fourth variables using curly braces, {}, find
%the average of each row, and store it in a new Table variable called TestAvg.
avg = mean(T{:, {'Test1', 'Test2', 'Test3'}}, 2);
T = addvars(T, avg, 'NewVariableNames','TestAvg');

% Use varfun to find the mean, max, min and median value of the TestAvg. In all cases
%group the information by Gender.
varfun(@mean,T,'InputVariables','TestAvg','GroupingVariables','Gender')
varfun(@max,T,'InputVariables','TestAvg','GroupingVariables','Gender')
varfun(@min,T,'InputVariables','TestAvg','GroupingVariables','Gender')
varfun(@median,T,'InputVariables','TestAvg','GroupingVariables','Gender')

% Use curly braces to extract the data from the table and convert the test scores to a 25
%point scale. Assume that the maximum value of the test is 100
T{:, {'Test1', 'Test2', 'Test3', 'TestAvg'}} = T{:, {'Test1', 'Test2', 'Test3', 'TestAvg'}}./4
