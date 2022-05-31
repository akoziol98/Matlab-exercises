function result = MyDivision(number1, number2)
%The function divides number1 by number2

try
    assert(number2 ~= 0);
    result = number1/number2;
    fprintf('Number %d divided by %d equals %.2f', number1, number2, result);
catch
    result = NaN;
    warning('Division by zero not allowed. Assigning a value of NaN.')
end
end

