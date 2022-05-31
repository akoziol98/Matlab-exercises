% Categorise the elements of the vector x=[−2 3 0 2 −6 1 −2 0 0 −13 12] as positive, negative, and zero
% and store them in three separate vectors. Count the number of elements in each vector.
pos = [];
neg = [];
zer = [];
x=[-2 3 0 2 -6 1 -2 0 0 -13 12];
for i = x
    if i > 0
        pos(length(pos) +1) = i;
    elseif i == 0
        zer(length(zer) +1) = i;
    elseif i < 0
        neg(length(neg) +1) = i;
    else
        warning ('Something went wrong');
    end
    
end
fprintf('There are %i positive, %i negative elements and %i zeros', numel(pos),numel(neg),numel(zer))

    