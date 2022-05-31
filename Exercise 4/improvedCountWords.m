function count = improvedCountWords(sentence)
%The function takes a string as an input and returns the number of words.
%Words are seperated by a space and contain only letters

%In line 12 I first check whether all characters in one word
%are letters by 'isletter',which returns an array filled with 1's only if all characters are letters.
%By summing 1's and comparing with length of the word,I can see if the word contains just letters

words = strsplit(sentence);
count = 0;
for i = 1:length(words)
    if sum(isletter(words{i})) == length(words{i}) 
        count = count + 1;
    end
end
end

