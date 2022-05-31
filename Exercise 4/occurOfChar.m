function count = occurOfChar(word,character)
%The function takes a string and a character as an input and returns the
%number of occurences of that character in the string
count = length(strfind(word,character));
end

