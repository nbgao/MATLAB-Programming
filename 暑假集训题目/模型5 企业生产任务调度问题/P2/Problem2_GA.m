clc

Max_gene = 100000;
popsize = 11;
chromlength = 50;
pc = 0.95;
pm = 0.06;

[S_best,T1,M] = GA2(Max_gene,popsize,chromlength,pc,pm);
S_best
T1, M, sum(w1)-M