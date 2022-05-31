function [data_average, data_median, data_sd] = calculate_data(data)
%Removes values less than 0.2 and calculates mean, median and std of
%remaining data
% Inputs
    % data -> a matrix
% Outputs
    % data_average -> mean of the remaining data
    % data_median -> median of the remaining data 
    % data_sd -> std of the remaining data 
% Removing values < 0.2
data_valid = data(data >= 0.2);
% Calculating mean, median and std
data_average = mean(data_valid);
data_median = median(data_valid);
data_sd = std(data_valid);
end

