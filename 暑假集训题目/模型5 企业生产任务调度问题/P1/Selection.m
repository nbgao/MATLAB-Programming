function [M,S_best,S] = Selection(S) %ѡ���������
sum = 0;
Max = -1;
max_p = 1;
for i=1:11
    f(i) = 10000 - Fitness(S(i,:));
    sum = sum + f(i);
    if(Max < f(i))
        Max = f(i);
        max_p = i;
    end
end

T(11,:) = S(max_p,:);   %����Ӧ����С��Ⱦɫ��ѡ����11��Ⱦɫ��

for i=1:11              %������Ӧ��ռ�ȸ���
    f(i) = f(i)/sum;
end

for i=2:11              %������Ӧ���ۼƸ���
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

for i=1:11              %����Ⱦɫ��
    S(i,:) = T(i,:);
end

S_best = S(11,:);      
M = Fitness(S_best);
    