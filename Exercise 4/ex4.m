%% Exercise 1
product = 'product';
temp = 'temperature';
final = [upper(product(1)), product(2:end), ' vs ', upper(temp(1)), temp(2:end)];

%% Exercise 2
% a)
IsCapitalLetter('Bob Smith');
IsCapitalLetter('lizard');
IsCapitalLetter('Ed');
IsCapitalLetter('hi Biff');
% b)
IsAnyCapital('Bob Smith'); 
IsAnyCapital('lizard'); 
IsAnyCapital('Ed'); 
IsAnyCapital('hi Biff');
       
%% Exercise 3
results_char = [countChars(''),
                countChars(' '),
                countChars('lizard'),
                countChars('two lizards'),
                countChars('Two lizards and three toads.')]
  
%% Exercise 4
result_occur = [occurOfChar('', 'a'),
                occurOfChar('aaaabc', 'a'),
                occurOfChar('Two lizards and three toads.', 'a'),
                occurOfChar('Two lizards and three toads.', 'T'),]

%% Exercise 5
result_sen = [improvedCountWords('Two lizards and 3 toads'),
              improvedCountWords('lizards2  and 32toads'),
              improvedCountWords('twolizards  four toads and 5snakes'),
              improvedCountWords('..  aa a.b .')]
          
%% Exercise 6
worker1Data.name = 'Bob'; 
worker1Data.time = [15.7, 12.2, 16.0, 14.8, 19.5, 9.8, 10.1, 20.2];
worker1Data.quality = [true, false, true, true, true, true, false,true];
worker2Data.name = 'Joe';
worker2Data.time = [18.7, 19.9, 23.4, 18.0, 18.7, 20.0];
worker2Data.quality = [false, true, true, false, true, false];

workerstime = [worker1Data.time; worker2Data.time]; %we can't do it, because the vector lenghts are not equal
worker1time = worker1Data.time;
worker2time = worker2Data.time;

worker1Data.averageTime = mean2(worker1time);
worker2Data.averageTime = mean2(worker2time);

worker1Data.averageQualityTime = mean2(worker1time(worker1Data.quality));
worker2Data.averageQualityTime = mean2(worker2time(worker2Data.quality));

worker1Data.itemsQuality = length(worker1Data.quality(worker1Data.quality == 1));
worker2Data.itemsQuality = length(worker2Data.quality(worker2Data.quality == 1));

worker1Data.QualityPercentage = worker1Data.itemsQuality/length(worker1Data.quality)*100;
worker2Data.QualityPercentage = worker2Data.itemsQuality/length(worker2Data.quality)*100;

