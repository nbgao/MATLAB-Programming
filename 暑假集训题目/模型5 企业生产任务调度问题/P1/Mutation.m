function S_new = Mutation(S,pm) %�������������pmΪ�������
S_new = S;
for i=1:11
    pp = rand();
    if(pp < pm)
        pos1 = ceil(rand * 9);
        pos2 = ceil(rand * 9);
        while (pos1 >= pos2)
            pos1 = ceil(rand * 9);
            pos2 = ceil(rand * 9);
        end
        S_new(i,:) = S(i,:);
        S_new(i,pos1:pos2) = S(i,pos2:-1:pos1);
    end
end
