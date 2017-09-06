function [S_min,T,M_min] = GA(Max_gene,popsize,chromlength,pc,pm)

gene = 1;
count = 1;
S = InitPop(popsize,chromlength);

while(gene <= Max_gene)
    fprintf('\n第%d代\n',gene);
    [M,T1,S_best,S] = Selection(S);
    S_best
    [T1, M, Max-M]
    if M < M_min
        T = T1;
        M_min = M;
        S_min = S_best;
    end
    S = Crossover(S,pc);
    S = Mutation(S,pm);
    gene = gene + 1;
    
    Y(count) = M;
    count = count + 1;
end


figure;
plot(1:Max_gene,Y,'b.-');
grid on;
xlabel('迭代次数');
ylabel('目标函数值');
legend('目标函数曲线');