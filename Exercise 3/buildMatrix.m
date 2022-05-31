function output = buildMatrix(M,N)
%The function takes number of rows M and numbers of columns N
% and creates an array M x N where each element is equal to i^3 + j^3 (i,j)
% are position of the element

for row = 1:M
    for column = 1:N
        array(row, column) = row^3 + column^3;
    end
end
output = array;
end

