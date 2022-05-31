load('Exercise4.mat')

% Find the average reaction time and standard deviation per image difficulty. For that you need to
% check the beginning of the file name in the imageFile column and group those names in 3 groups.
% Those that start with f8d, f18d and f28d (hint: help startsWith).
mean_f8d = mean2(T.RT(startsWith(T.imageFile,'f8d')))
std_f8d = std2(T.RT(startsWith(T.imageFile,'f8d')))

mean_f18d = mean2(T.RT(startsWith(T.imageFile,'f18d')))
std_f18d = std2(T.RT(startsWith(T.imageFile,'f18d')))

mean_f28d = mean2(T.RT(startsWith(T.imageFile,'f28d')))
std_f28d = std2(T.RT(startsWith(T.imageFile,'f28d')))

%  What is the % of valid trials? A trial is valid if the name of the file contains present and the participant
% pressed ‘z’ or if the file contains absent and the participant pressed ‘m’.
valid = contains(T.imageFile,'present') == 1 & strcmp(T.PressedKEy, 'z') | contains(T.imageFile,'absent') == 1 & strcmp(T.PressedKEy, 'm');
fprintf('There is %.2f %% of valid trials',(sum(valid)/height(T)) *100) 

%Recalculate the reaction times only for valid conditions.
mean_f8d = mean2(T.RT(startsWith(T.imageFile,'f8d') & valid))
std_f8d = std2(T.RT(startsWith(T.imageFile,'f8d') &valid))

mean_f18d = mean2(T.RT(startsWith(T.imageFile,'f18d') &valid))
std_f18d = std2(T.RT(startsWith(T.imageFile,'f18d')& valid))

mean_f28d = mean2(T.RT(startsWith(T.imageFile,'f28d') & valid))
std_f28d = std2(T.RT(startsWith(T.imageFile,'f28d') &valid))
