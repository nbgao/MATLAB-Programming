clc
p = [3 4 1 2 6 1 4 7 5];
d = [5 9 3 12 10 24 5 6 6];
w1 = [750 1200 800 900 2500 500 3000 5600 4500];
w2 = [500 900 400 750 1800 300 1500 4000 2000];
dw = w1 - w2;

S1 = [8 9 4 1 3 6 2 5 7];

% S2 = [ 9     2     4     1     6     3     5     8     7];
%   S_best2 = SA(S2)
  
% S1 = randperm(9);
S2_best = SA(S1)