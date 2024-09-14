close all 
clear all

% Loads and plays the built-in audio signal handel.mat
load handel.mat
sound(y, Fs);

% Uses the plot( ) command to plot the y vector
figure;
plot(y)

% Creates a figure to plot the segment of the signal y(4000 : 4300)
figure;
plot(y(4000 : 4300))

% Calls the function norm_data_study( ) with y as the input
figure;
norm_data_study(y)