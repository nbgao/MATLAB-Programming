function [M,T1,S_best,S] = Selection2_2(S) %选择操作函数
sum = 0;
T1 = 0;
Max = -1;
max_p = 1;
for i=1:11
    [M,T1] = Fitness2_2(S(i,:));
    f(i) = 30000 - Fitness2_2(S(i,:));
    sum = sum + f(i);
    if(Max < f(i))
        Max = f(i);
        max_p = i;
    end
end

T(11,:) = S(max_p,:);   %将适应度最小的染色体选作第11条染色体

for i=1:11              %计算适应度占比概率
    f(i) = f(i)/sum;
end

for i=2:11              %计算适应度累计概率
    f(i) = f(i-1) + f(i);
end

for i=1:10
    p = rand();
    k = 1;
    while(p > f(k))
        k = k+1;
    end 
    T(i,:) = S(k,:);
end

parfor i=1:11              %更新染色体
    S(i,:) = T(i,:);
end

S_best = S(11,:);      
[M,T1] = Fitness2_2(S_best);
    