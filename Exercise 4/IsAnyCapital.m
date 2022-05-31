function IsAnyCapital(word)
%The function determines whether any letter of a string is a capital letter.
for letter = 1:length(word)
    if word(letter) == upper(word(letter))
        fprintf('Phrase "%s" has a capital letter.\n', word);
        return
    end
end
fprintf('Phrase "%s" does not have a capital letter.\n', word);
end

