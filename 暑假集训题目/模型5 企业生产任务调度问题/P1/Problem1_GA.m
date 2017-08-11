clc

Max_gene = 100;
popsize = 11;
chromlength = 9;
pc = 0.7;
pm = 0.1;

[S_best,M] = GA(Max_gene,popsize,chromlength,pc,pm);