%% Exercise 1
% Creating two random matrices
A = randi(50,[4,5]);
B = randi(50,[4,5]);

% Multiplying matrices by scalars
C = A * 3;
D = B * 5;

% Multiplying element by element
E = A(:,3) .* B(:,3);

% Summing and replacing elements
F = A + B;
F(:, 2) = E;

% Summing column
summation = sum(F(:, 1));

% Finding minimum
minimum_value = min(A, [], 'all');

% Finding maximum
maximum_value = max(B, [], 'all');

% Calculating mean
mean_value = mean2(A);

% Calculating std
std_value = std2(A);

%% Exercise 2
X = [1:3:35];
Y = [41:3:75];
Z = X;
Z(2:2:end) = Y(2:2:end);

%% Exercise 3
% Extracting submatrix
A = rand(10);
A(6:end, 6:end);

% Extracting particular elements
A = [8 9 7 4 5 2 6 5 4 1 3 9 8 7 5 2 3];
unique(A(A >= 2 & A <= 5));

%Percentage of unique elements
A = [5 8 8 8 9 9 6 6 5 5 4 1 2 3 5 3 3];
sortrows(tabulate(A), 3, 'descend')

%% Exercise 4
% Calculating values greater than or equal 6
A = [4 6 1 5 9 13];
x = A >= 6;
total_number = sum(x);

% Calculating non-NaN values
reaction_times = [0.45 NaN 0.23 0.60 NaN 0.34 0.89 0.94];
y = ~isnan(reaction_times)
total_nonan_number = sum(y(y == 1));

%% Exercise 5
A = [1:7; 9:-2:-3; power(2, (2:8))]

%% Exercise 6
x = rand(500,1)
[data_average , data_median, data_sd] = calculate_data(x)
