function vector = threeLetters(cell)
%This function extracts the first three characters of all elements in a cell and returns them as a character
%vector
vector = char(cellfun(@(x) x(1:3), cell, 'UniformOutput', false));
end

