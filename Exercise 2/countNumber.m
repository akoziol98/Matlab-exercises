function countNumber(array, number)
%The function counts all instances of 'number' in 'array'

count = 0;
for a = array.'
    if a == number count = count + 1; end
end
txt = ['Number of times ''', num2str(number), ''' was repeated: ', num2str(count), '.'];
disp(txt)
