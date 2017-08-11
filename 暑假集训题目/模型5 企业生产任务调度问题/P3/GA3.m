function [S_min,T,M_min] = GA3(Max_gene,popsize,chromlength,pc,pm,t)
p = [3	4	1	2	6	1	4	7	5	2	1	1	1	3	5	2	4	6	5	1	3	1	5	6	3	2];
d = [5	9	3	12	10	24	5	6	6	10	15	15	20	20	20	25	28	30	30	30	40	40	45	50	60	60];
w1 = [750	1200	800	900	2500	500	3000	5600	4500	1000	700	900	750	750	1000	1250	1600	1800	2500	500	1700	650	1500	1800	1200	800];
w2 = [500	900	400	750	1800	300	1500	4000	2000	0	0	720	600	0	800	1000	1280	1440	200	0	1190	450	1050	1260	660	500];
dw = w1 - w2;

T = 60;
Max = sum(w1);
M_min = 1000000;
gene = 1;
count = 1;
S = InitPop(popsize,chromlength);

while(gene <= Max_gene)
    fprintf('\n第%d代\n',gene);
    [M,T1,S_best,S] = Selection3(S,t);
    S_M1 = S_best(1:t)
    S_M2 = S_best(t+1:chromlength)
    [T1, M, Max-M]
    if M < M_min && T1 >= 25
        T = T1;
        M_min = M;
        S_min = S_best;
    end
    S = Crossover3(S,pc);
    S = Mutation3(S,pm);
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