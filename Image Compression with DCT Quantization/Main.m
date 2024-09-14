clear all
close all

% Enter in delta, non-zero coefficient, and MSE data
delta = [1, 4, 10, 20, 50, 100];
totalNumberNonzeroCoefficients = [229897, 151727, 83952, 51714, 25430, ...
    13152];
MSE = [0.0836, 1.3878, 6.3337, 16.9397, 58.9967, 145.1442];

% Plot Quantization Step Size VS Number of Non-Zero Coefficients graph
figure;
plot(delta, totalNumberNonzeroCoefficients, 'r-*');
title 'Quantization Step Size VS Number of Non-Zero Coefficients';
xlabel 'Quantization Step Size';
ylabel 'Number of Non-Zero Coefficients';

% Plot Quantization Step Size VS Mean Squared Error graph
figure;
plot(delta, MSE, 'r-*');
title 'Quantization Step Size VS Mean Squared Error';
xlabel 'Quantization Step Size';
ylabel 'Mean Squared Error';
