clear all
close all

disp('T1 = (10 + 20 + T2 + T3) / 4');
disp('T2 = (20 + 40 + T1 + T4) / 4');
disp('T3 = (10 + 30 + T1 + T4) / 4');
disp('T4 = (30 + 40 + T2 + T3) / 4');

% We can re-write these equations in a linear algebra type format.

% T1 - T2/4 - T3/4 + 0*T4 = 7.5;
% 
% -T1/4 + T2 + 0*T3 - T4/4 = 15;
% 
% -T1/4 + 0*T2 + T3 - T4/4 = 10;
% 
% 0*T1 - T2/4 - T3/4 + T4 = 17.5;

% We can now convert this system of linear equations (AT = b) into an 
% augmented matrix, where the values in matrix A are the coefficients of 
% the values of the vector T (i.e. T1, T2, T3, T4).

A = [1, -1/4, -1/4, 0; -1/4, 1, 0, -1/4; -1/4, 0, 1, -1/4; 0, -1/4, ...
    -1/4, 1];
b = [7.5; 15; 10; 17.5];
augmentedMatrix = [A b]

% Solve using Matrix Inverse Method

disp('Option 1: Solve with Matrix Inverse Method');
T = inv(A) * b;
T1 = T(1)
T2 = T(2)
T3 = T(3)
T4 = T(4)

disp('Error using the Matrix Inverse method is:')
inverseError = A*T-b;
disp(inverseError);

% Solve using Matrix Left Division

disp('Option 2: Solve with Matrix Left Division');
T = A\b;
T1 = T(1)
T2 = T(2)
T3 = T(3)
T4 = T(4)

disp('Error using the Matrix Left Division method is:')
leftDivisionError = A*T-b;
disp(leftDivisionError);





