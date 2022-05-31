%% Reading files into one table
files = dir('*.txt'); 
j = 1;
while j <= length(files)
    for i = 1:4:height(readtable(files(2).name))*length(files)
        T(i:i+3,:) = readtable(files(j).name);
        j = j+1;
    end
end
%% Removing invalid trials
% 1)
T1 = T(~(T.RT == 0), :);
% 2)
condition1 = ~(strcmp(T1.imageFile, 'Easy1.jpg') ...
& ~(T1.CoordinateX <= 208 & T1.CoordinateX >= 168 ...
& T1.CoordinateY <= 865 & T1.CoordinateY >= 825));

condition2 = ~(strcmp(T1.imageFile, 'Easy2.jpg') ...
& ~(T1.CoordinateX <= 603 & T1.CoordinateX >= 563 ...
& T1.CoordinateY <= 740 & T1.CoordinateY >= 700));

condition3 = ~(strcmp(T1.imageFile, 'Cluttered1.jpg') ...
& ~(T1.CoordinateX <= 986 & T1.CoordinateX >= 946 ...
& T1.CoordinateY <= 975 & T1.CoordinateY >= 935));

condition4 = ~(strcmp(T1.imageFile, 'Cluttered2.jpg') ...
& ~(T1.CoordinateX <= 1650 & T1.CoordinateX >= 1610 ...
& T1.CoordinateY <= 343 & T1.CoordinateY >= 303));

T_clean = T1(condition1 & condition2 & condition3 & condition4, :);
%% Comparison
T_easy = T_clean(strcmp(T_clean.imageFile, 'Easy1.jpg') | strcmp(T_clean.imageFile, 'Easy2.jpg'), :);
T_clu = T_clean(strcmp(T_clean.imageFile, 'Cluttered1.jpg') | strcmp(T_clean.imageFile, 'Cluttered2.jpg'), :);

T_clean.group = strcmp(T_clean.imageFile, 'Cluttered1.jpg') | strcmp(T_clean.imageFile, 'Cluttered2.jpg');
%I create two tables, one for each group and I add grouping column to table
%with whole data. That will make calculations later on easier

%% Preprocessing & checking assumptions
subplot(2,1,1)
qqplot(T_easy.RT)
subplot(2,1,2)
qqplot(T_clu.RT)
%I can see one clear outlier in easy group that I think should be removed
%The sample is very small, so deleting an observation is unfortunate, but
%that particular value is much bigger than the second highest. In order to
%get reliable results I will check for outliers in both groups
T_easy_nout = T_easy.RT(~(isoutlier(T_easy.RT)));
T_clu_nout = T_clu.RT(~(isoutlier(T_clu.RT)));
% Matlab found two outliers, so I am going to trust it

out = T_easy.RT(isoutlier(T_easy.RT));
T_no_out = T_clean(~(T_clean.RT == out(1) | T_clean.RT == out(2)),:);
% To make my work later easier, T_no_out is whole data with no outliers and
% T_easy_nout just easy group, T_clu_nout just cluttered group

subplot(2,1,1)
qqplot(T_easy_nout)
subplot(2,1,2)
qqplot(T_clu_nout)
% Both plots are not perfect, but their distribution is 'normal' enough to
% perform a parametric test. I want to try one-way ANOVA at alpha = 0.05
%But I have to check ANOVA assumptions first
vartestn(T_no_out.RT, T_no_out.group)
%P-value < 0.05 indicates that variances are heterogeneous. I cannot use ANOVA
%The samples are not independent, but for dependent samples I need to have
%the same sample sizes. Not all participants had valid trials for both easy
%and cluttered images, so I will perform an independent test anyway
%Therefore, I will use a t-test for unequal variances with default alpha = 0.05

%% Visualization
% Boxplot
meanRT = groupsummary(T_no_out.RT,T_no_out.group,'mean');
stdRT = groupsummary(T_no_out.RT,T_no_out.group,'std');

boxplot(T_no_out.RT, T_no_out.group, 'labels', {'Easy', 'Cluttered'})
hold on
plot(meanRT,'-o', 'Color', 'g')
hold off
str = {strcat('mean = ', num2str(meanRT(1))),strcat('mean = ', num2str(meanRT(2)))};
str2 = {strcat('sd = ', num2str(stdRT(1))),strcat('sd = ', num2str(stdRT(2)))};
text([1,1.75],[meanRT(1)+3,meanRT(2)+3],str)
text([0.85,1.85],[0.35,0.35],str2)
title('Respond time by image difficulty (with mean and standard deviation')
xlabel('Image')
ylabel('Respond time')

% Histogram
subplot(2,1,1)
h1 = histogram(T_easy_nout, 'facecolor', 'r');
h1.BinWidth = 5;
legend('Easy')
subplot(2,1,2)
h2 = histogram(T_clu_nout);
h2.BinWidth = 10;
legend('Cluttered')
%% T-test
[h,p] = ttest2(T_easy_nout,T_clu_nout,'Vartype','unequal')

%p-value = 0.0042 which is smaller than alpha, so the means are
%significantly different. However, it wouldn't be advisable to
%draw any definite conclusions about difference between our samples, 
%because sizes are small and samples are in some way dependent. More
%tests are needed and especially, bigger, equal sample

%% Report
org = height(T);
fprintf('In the data, there are %i observations not performed on time and %i on time.\n%i subjects did not find Waldo in Easy1.\n%i subjects did not find Waldo in Easy2.\n%i subjects did not find Waldo in Cluttered1.\n%i subjects did not find Waldo in Cluttered2.\n%i subjects correctly found Waldo on time.\nIn "easy" group, there were %i outliers\nA t-test with the assumption of unequal variances was performed \nto establish whether difference between means in "easy" and "cluttered" condition is significant.\np-value = %.4f < 0.05 indicates that the difference is significant', org - height(T1), height(T1), sum(~condition1), sum(~condition2), sum(~condition3), sum(~condition4), height(T_clean), length(out),p)