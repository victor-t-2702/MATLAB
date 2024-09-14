close all
clear all

% Create an anonymous function to calculate P(n, k)
pnk = @(n, k) prod([n - k + 1 : n]);

% Create empty vectors to hold the result of each for loop iteration
nResults = [];
kResults = [];
combinationResults = [];
permutationResults = [];

% Calculate and record values of combinations C(n, k) and permutations 
% P(n, k) for n = 2 : 5, and k = 0 : n for each n
for n = 2:5
    for k = 0:n
        combinations = nchoosek(n, k);
        permutations = pnk(n, k);
        nResults = [nResults;n];
        kResults = [kResults;k];
        combinationResults = [combinationResults;combinations];
        permutationResults = [permutationResults;permutations];
    end
end

% Create and show a table displaying the results 
T = table(nResults, kResults, combinationResults, permutationResults, ...
    'VariableNames', {'n','k','C(n, k)','P(n, k)'});
T