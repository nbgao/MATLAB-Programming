function [d,path] = floyd(a)
d = a;
path = zeros(n,n);
for i = 1:n
    for j = 1:n
        if d(i,j) ~= inf
            path(i,j) = j;
        end
    end
end
for k = 1:n
    for i = 1:n
        for j = 1:n
            if d(i,j) > d(i,k) + d(k,j)
                d(i,j) = d(i,k) + d(k,j)
                path(i,j) = path(i,k);
            end
        end
    end
end