color = randi(4,[1,10000]);
edges = [1,2,3,4,5];
bins = discretize(color,edges, 'categorical', {'yellow', 'blue','red','green'});

Y = randi(1000,[1,10000]);

mean_col = splitapply(@mean,Y, color);
std_col = splitapply(@std,Y, color);
median_col = splitapply(@median,Y, color);

yell = ['The mean value of colour yellow is ' ,num2str(mean_col(1)),', its standard deviation is ' ,num2str(std_col(1)),', and its median: ' ,num2str(median_col(1))];
disp(yell)

blue = ['The mean value of colour blue is ' ,num2str(mean_col(2)),', its standard deviation is ' ,num2str(std_col(2)),', and its median: ' ,num2str(median_col(2))];
disp(blue)

red = ['The mean value of colour red is ' ,num2str(mean_col(3)),', its standard deviation is ' ,num2str(std_col(3)),', and its median: ' ,num2str(median_col(3))];
disp(red)

gr = ['The mean value of colour green is ' ,num2str(mean_col(4)),', its standard deviation is ' ,num2str(std_col(4)),', and its median: ' ,num2str(median_col(4))];
disp(gr)