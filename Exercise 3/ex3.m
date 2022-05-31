%% Exercise 2
array = buildMatrix(9,4);

%% Exercise 3
hcat = HurrCat(randi([-10, 200], 1));
disp('The hurricane category'); disp(hcat);
%% Exercise 4
num1 = randi([-50, 50], 1);
num2 = randi([-50, 50], 1);
div = MyDivision(num1, num2);
%% Exercise 5
for i = [1:2:10, 9:-2:1]
    fprintf('%s\n',repelem('*',i))
end

%% Exercise 6
sum = 0;
iter = 0;
a = rand(1);
while a < 1
    iter = iter + 1;
    sum = sum + a;
    a = rand(1);
    if a > 0.9
        break
    end
end
fprintf('Result of summing %d number(s): %.3f', iter, sum);
