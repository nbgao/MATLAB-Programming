function S_new = Mutation2_2(S,pm) %变异操作函数，pm为变异概率
S_new = S;
for i=1:11
    pp = rand();
    if(pp < pm)
        pos1 = ceil(rand * 26);
        pos2 = ceil(rand * 26);
        while (pos1 >= pos2)
            pos1 = ceil(rand * 26);
            pos2 = ceil(rand * 26);
        end
        S_new(i,:) = S(i,:);
        S_new(i,pos1:pos2) = S(i,pos2:-1:pos1);
    end
end
