d = 0.85;
n = 6;

C = (1-d)/n*ones(n,1);

L = [0  1/5  0  0  0  1/5    %a
     0   0  1/3 0  0  1/5    %B
     0  1/5  0  0 1/2 1/5    %C
     0  1/5 1/3 0  0  1/5    %D
     0  1/5  0  0  0  1/5    %E
     1  1/5 1/3 1 1/2  0];   %F
 
I = eye(n);
R = (I - d*L)\C