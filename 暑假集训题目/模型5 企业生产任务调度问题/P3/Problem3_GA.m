clc

Max_gene = 100000;
popsize = 11;
chromlength = 26;
pc = 0.95;
pm = 0.06;
t = 17;

[S_best,T1,M] = GA3(Max_gene,popsize,chromlength,pc,pm,t);
S_M1 = S_best(1:t)
S_M2 = S_best(t+1:chromlength)
T1, M, sum(w1)-M