function d = floyd(D)
d = D;
n = 25;
for k = 1:n
    for i = 1:n
        for j = 1:n
            if d(i,j) > d(i,k) + d(k,j)
                d(i,j) = d(i,k) + d(k,j);
            end
        end
    end
end