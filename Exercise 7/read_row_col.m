function data = read_row_col(file)
%This function reads the data starting from row 3 and column 1.
data = csvread(file, 2, 0);
end

