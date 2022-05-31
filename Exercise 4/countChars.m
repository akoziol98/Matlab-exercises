function count = countChars(word)
%The function takes a string and returns a number of characters excluding
%spaces
count = length(find(double(word) ~= 32));
end

