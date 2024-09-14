function [] = norm_data_study(data)

% Generate a histogram of the data and calculate the mean and STD
H = histogram(data);
Mean = mean(data)
StandardDeviation = std(data, 1)

% Create the zScore variables
zScore1 = 0;
zScore2 = 0;
zScore3 = 0;

% Calculates how many elements of the input data are within the distances 
% of 1 x std, 2 x std, and 3 x std of the mean, finds their 
% probabilities, puts the probabilities in a 1 x 3 vector, and displays the 
% vector
for x = 1:numel(data)
    if data(x) <= (Mean + StandardDeviation) && data(x) ...
            >= (Mean - StandardDeviation)
        zScore1 = zScore1 + 1;
    end

    if data(x) <= (Mean + 2*StandardDeviation) && data(x) ...
            >= (Mean - 2*StandardDeviation)
        zScore2 = zScore2 + 1;
    end

    if data(x) <= (Mean + 3*StandardDeviation) && data(x) ...
            >= (Mean - 3*StandardDeviation)
        zScore3 = zScore3 + 1;
    end
end 

% Uses normcdf( ) to find the total probabilities of the standard normal 
% distribution within the distances of 1 x std, 2 x std, and 3 x std of
% the mean, puts them in a 1 x 3 vector, and displays the vector
ProbabilitiesZScores = [zScore1 / numel(data), zScore2 / numel(data)...
    zScore3 / numel(data)];
ProbabilitiesZScores

p1STD = normcdf(Mean + StandardDeviation, Mean, StandardDeviation) ...
    - normcdf(Mean - StandardDeviation, Mean, StandardDeviation);
p2STD = normcdf(Mean + 2*StandardDeviation, Mean, StandardDeviation) ...
    - normcdf(Mean - 2*StandardDeviation, Mean, StandardDeviation);
p3STD = normcdf(Mean + 3*StandardDeviation, Mean, StandardDeviation) ...
    - normcdf(Mean - 3*StandardDeviation, Mean, StandardDeviation);
ProbabilitiesSTD = [p1STD, p2STD, p3STD];
ProbabilitiesSTD

% Uses the function abs( ) to calculate the absolute error between the 
% two probability vectors and displays the result
AbsoluteError = abs(ProbabilitiesZScores - ProbabilitiesSTD)

  
end

