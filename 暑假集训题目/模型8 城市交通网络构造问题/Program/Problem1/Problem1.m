clc

Max_gene = 100;
popsize = 11;
chromlength = 17;
pc = 0.8;
pm = 0.1;

[S_best,T1,M] = GA(Max_gene,popsize,chromlength,pc,pm);
S_best
T1, M, sum(w1)-M