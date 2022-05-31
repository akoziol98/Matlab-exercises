%% Exercise 1
fid = tdfread('McGurk with Fixations_Pilot_66045.tsv');
T = struct2table(fid(1));
%% Fill missing values using a linear interpolation
T = fillmissing(T,'linear', 'DataVariables', @isnumeric);

%% Find outliers in the data and correct them.
T = filloutliers(T,'linear', 'median', 'DataVariables', @isnumeric);

%% Detrend your time series.
T.LocalTimeStamp = datetime(T.LocalTimeStamp, 'Format', 'HH:mm:ss');
detrended = [0]; %Here I manually create new array that will replace T.LocalTimeStamp
% In my solution I detrend data step by step by subtraction: 
% value - previous_value. So array's first element is already 0
for i = 2:length(T.LocalTimeStamp)
	value = T.LocalTimeStamp(i) - T.LocalTimeStamp(i - 1);
	detrended(i) = seconds(value);
end
T.LocalTimeStamp = detrended.'; 
%% Calculate the average pupil data by average the data from both eyes into a unique time series.
left_pupil = rmmissing(T.PupilLeft); 
right_pupil = rmmissing(T.PupilRight); 
left_clean = [];
right_clean = [];
for i=1:length(T.PupilLeft)
    if T.PupilLeft(i,:) ~= ' ' & T.PupilRight(i,:) ~= ' ' %Not all subjects have values for both eyes. I ignore such cases
        left_clean(i) = str2double(strrep(left_pupil(i,:),',','.')); % To perform calculations, I need to replace ',' in a number with '.'
        right_clean(i) = str2double(strrep(right_pupil(i,:),',','.'));
    end
end

PupilAverage = timeseries(mean([right_clean.' left_clean.'], 2),(1:length(right_clean)).','Name','PupilAverage');
%% Smooth the averaged data using a savitzki golay method.
smooth(PupilAverage.Data,'sgolay')
%% Normalise the averaged pupil data to have mean = 1 and std = 0.
PupilAverage.Data = normalize(PupilAverage.Data);

%% Exercise 2
load patients
G = findgroups(Gender);
%determine the mean and standard deviation of the weight, height and age of the following groups:
% Separate by Gender
splitapply(@mean,Height,G)
splitapply(@mean,Weight,G)
splitapply(@mean,Age,G)
splitapply(@std,Height,G)
splitapply(@std,Weight,G)
splitapply(@std,Age,G)
% Separate by Hospital Location
L = findgroups(Location);
splitapply(@mean,Height,L)
splitapply(@mean,Weight,L)
splitapply(@mean,Age,L)
splitapply(@std,Height,L)
splitapply(@std,Weight,L)
splitapply(@std,Age,L)
% Separate by Gender and Hospital Location.
GL = findgroups(Gender,Location);
splitapply(@mean,Height,GL)
splitapply(@mean,Weight,GL)
splitapply(@mean,Age,GL)
splitapply(@std,Height,GL)
splitapply(@std,Weight,GL)
splitapply(@std,Age,GL)

%% Exercise 3
T = readtable('messy.csv','TreatAsEmpty',{'.','NA'});
% Remove those lines with more than 2 missing values.
T = rmmissing(T,'MinNumMissing',2);
% Standardise the missing values. 99, -99 or similar should be consider NaN.
T = standardizeMissing(T,{-99, 99});
% Locate the missing values and substitute the missing value by the mean of the remaining ones.

%First I locate manually two missing data for which I choose a unique way
%to fill missing data
T(2,2) = array2table(fillmissing(table2array(T(2, 2)),'constant', mean(table2array(T(2,{'D', 'E'})))));
T(:,3) = array2table(fillmissing(table2array(T(:, 3)),'previous'));

for i = [2, 4, 5]
    a = table2array(T(:,i));
    T(:,i) = array2table(fillmissing(a,'constant', mean(a, 'omitnan')));
end 

% Do similar with the outliers. Detect any possible outlier and substitute by the median in this case
T = filloutliers(T,'linear', 'median', 'DataVariables', @isnumeric);
