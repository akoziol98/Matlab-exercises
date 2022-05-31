function hcat = HurrCat(windspeed)
%The function takes wind speed and returns category of the hurricane
%accordingly:
% Wind between 1 and 73 is category 0
% Wind between 73 and 93 is category 1
% Wind between 91 and 110 is category 2
% Wind between 110 and 130 is category 3
% Wind between 130 and 155 is category 4
% Larger winds represent category 5
try
    assert(windspeed > 0);
catch    
    if windspeed < 0
       hcat = NaN;
       warning('Error. Enter a number higher than 1. Assigning a value of NaN');
    elseif isnan(windspeed)
       hcat = NaN;
       warning('Error. Enter a number. Assigning a value of NaN');
    else
       hcat = NaN;
       warning('Unknown error. Assigning a value of NaN'); 
    end
end
if (windspeed >= 1) && (windspeed <= 73)
        hcat = 0;
elseif (windspeed > 73) && (windspeed <= 93)
        hcat = 1;
elseif (windspeed > 93) && (windspeed <= 110)
        hcat = 2;
elseif (windspeed > 110) && (windspeed <= 130)
        hcat = 3;
elseif (windspeed > 130) && (windspeed <= 155)
        hcat = 4;
elseif windspeed > 155
        hcat = 5;
end
end


