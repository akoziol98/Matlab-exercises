% Suppose three groups of subjects (named A, B, and C) have produced the following results:
% scoresA=rand(10, 1); scoresB=rand(20, 1)*3; scoresC = rand(15, 1); calculate a one-way analysis of
% variance and test whether the three groups were different from one another. Include a multiple
% comparison test.

scoresA=rand(10, 1); 
scoresB=rand(20, 1)*3; 
scoresC = rand(15, 1);

groupA = zeros(length(scoresA),1);
A = [scoresA groupA];

groupB = ones(length(scoresB),1);
B = [scoresB groupB];

groupC = repmat(2,length(scoresC),1);
C = [scoresC groupC];

ready = [A; B; C];

subplot(3,1,1)
qqplot(scoresA)
subplot(3,1,2)
qqplot(scoresB)
subplot(3,1,3)
qqplot(scoresC)
%Normal distribution
vartestn(ready(:, 1),ready(:, 2))
%At least one column has a different variance
[p,tbl,stats] = anova1(ready(:, 1),ready(:, 2))
%There is a significant difference between some groups, but inequality of
%variances doesn't allow us to make definite conclusions
multcompare(stats);
