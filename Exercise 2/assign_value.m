function b = assign_value(A,a)
%This function assigns b value according to these conditions:
    %if A is <=0 and if a <=-5, b gets 1
    %if A is <=0 and if a is not <=-5, b gets 2
    %if A is not <=0 and if a <=5, b gets 3
    %if A is not <=0 and if a is not <=5, b gets 4 

if A <= 0 & a <= -5
	b = 1;
elseif A <= 0 & ~(a <= -5)
    b = 2;
elseif ~(A <= 0) & a <= 5
	b = 3;
elseif ~(A <= 0) & ~(a <= 5)
	b = 4;
else
    disp('Something went wrong')
end

