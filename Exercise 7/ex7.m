%% Exercise 1
%Create a 5x5 random array and save it in csv format.
r = randi([1,1000],5,5);
csvwrite('data.csv', r);
%Save the data starting in row number 3 and column number 1.
csvwrite('data_2.csv', r, 3, 1);
%Write a function that reads that data starting from the exact same row and column.
read_row_col('data.csv')

%% Exercise 2
answer = inputdlg({'Your code', 'Your age', 'Your study'});
array = randi([1,1000],100,1);
fid = fopen('student_data.txt', 'at');
if fid < 0
    error('Error opening file');
end
fprintf(fid, '%s\n%s\n%s\n',num2str(answer{1}), num2str(answer{2}), num2str(answer{3}));
for i = 1:size(array)
    fprintf(fid, ' %d', array(i)); 
end
fclose(fid);
%The dimension change of the array in txt file is intentional :)

%% Exercise 3

table = readtable('Data_ASD.xlsx');
c = table2cell(table);

a = size(c);
% a) 
for i = 1:a(1)
    c{i,3} =  datenum(date) - datenum(c{i,3}); 
    %c{i,3}= daysact(c{i,3}, date);
end

%b)
b = [c{:,3}];
format shortG
std_age = std(b,[],'all');
mean_age = mean(b);
fprintf('The standard deviation of age in days is: %.2f, the mean is: %.1f\n', std_age, mean_age);
%Removing outliers
new_age = b(~(b < mean_age-2*std_age | b > mean_age+2*std_age));
std_nage = std(new_age,[],'all');
mean_nage = mean(new_age);
fprintf('After removing outliers, the standard deviation of age in days is: %.2f, the mean is: %.1f', std_nage, mean_nage);

%% Exercise 4
% Create a file named nine.bin, containing the values from 1 to 9. Write the data as uint16 values.
nine = [1:9];
file = fopen('nine.bin', 'a');
fwrite(file, nine, 'uint16');
fclose(file);
%Read the first six values into a 3-by-2 array. Specify that the source data is class uint16. 
%After that return to the beginning of the file.
file = fopen('nine.bin');
fread(file, [3,2], 'uint16')
frewind(file);
fclose(file);
%Read two values at a time, and skip one value before reading the next values
file = fopen('nine.bin');
fread(file, '2*uint16', 2)
fclose(file);


