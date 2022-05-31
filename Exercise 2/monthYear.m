function monthName = monthYear(monthNumber)
%The function takes an integer as an input and displayes the name of the
%month accordingly
switch monthNumber
    case 1
        monthName = 'January';
    case 2
        monthName = 'February';
    case 3
        monthName = 'March';
    case 4
        monthName = 'April';
    case 5
        monthName = 'May';
    case 6
        monthName = 'June';
    case 7
        monthName = 'July';
    case 8
        monthName = 'August';
    case 9
        monthName = 'September';
    case 10
        monthName = 'October';
    case 11
        monthName = 'November';
    case 12
        monthName = 'December';
    otherwise
         disp('Provide a number between 1 and 12')
end

