function S_new = Crossover2_2(S,pc)
S_new = S;

for i=1:2:10
    p1 = rand();
    if(p1 < pc)
        t = ceil(rand()*26);
        T1 = zeros(1,26);
        T2 = zeros(1,26);
        k1 = 1;
        k2 = 1;
        
        for j = 1:26
            if S(i,j) <= t
                S_new(i,j) = S(i,j);
            else                
                T1(k1) = S(i,j);
                k1 = k1 + 1;
            end
            
            if S(i+1,j) <= t
                S_new(i+1,j) = S(i+1,j);
            else
                T2(k2) = S(i+1,j);
                k2 = k2 + 1;
            end
        end
        
        k1 = 1;
        k2 = 1;
        for j = 1:26
           if S_new(i,j) == 0
               S_new(i,j) = T2(k1);
               k1 = k1 + 1;
           end
           if S_new(i+1,j) == 0
               S_new(i+1,j) = T1(k2);
               k2 = k2 + 1;
           end
        end       
    end
end