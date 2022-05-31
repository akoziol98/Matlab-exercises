function a = whichSmallest(x, y, z)
%The function takes x, y, z as in input and returns 'a' according to following rules: 
% a = -1 when x is the smallest 
% a = 0 when y is the smallest 
% a = 1 when z is the smallest
[~,I] = min([x, y, z]);
switch I
    case 1
        a = -1;
    case 2
        a = 0;
    case 3
        a = 1;
end

