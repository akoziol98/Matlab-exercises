%% Exercise 1
A = randi([-50, 50], 1);
a = randi([-50, 50], 1);
b = assign_value(A, a);

%% Exercise 2
monthNumber = randi([1, 13], 1); %13 numbers to test display message
month = monthYear(monthNumber);

%% Exercise 3
x = randi([-50, 50], 1);
y = randi([-50, 50], 1);
z = randi([-50, 50], 1);
a = whichSmallest(x, y, z)

%% Exercise 4 
%Listing prime numbers and factors of 6
FactorOf6 = [];
Prime = [];
fCount = 0;
pCount = 0;
for a = 1:100
    if mod(6, a) == 0 %I didn't know if I should calculate numbers divisible by 6 or factors of 6, 
                      %but name of the array suggested factors
        fCount = fCount + 1;
        FactorOf6(fCount) = a;
    end
    if isprime(a) == 1 
        pCount = pCount + 1;
        Prime(pCount) = a;
    end
end
I = intersect(Prime, FactorOf6);
disp(['Factors of 6: ' num2str(FactorOf6(:)')]) %I used disp() to show all numbers in one line
disp(['Prime numbers: ' num2str(Prime(:)')])
disp(['Prime factors of 6: ' num2str(I(:)')])

%% Exercise 5
A = randi(100,100, 1);
N = randi([1, 100], 1);
countNumber(A, N);
