function IsCapitalLetter(word)
%The function determines whether first letter of a string is a capital letter.
if word(1) == upper(word(1))
    fprintf('Phrase "%s" starts with a capital letter.\n', word);
else
    fprintf('Phrase "%s" does not start with a capital letter.\n', word);
end
end

