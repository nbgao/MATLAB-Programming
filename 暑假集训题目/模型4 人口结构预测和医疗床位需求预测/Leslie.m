function [G,P] = Leslie(X,w,b,p,D)
n = length(X);

% 净迁入率分布函数
for i = 1:22
    if i <= 10
        d(i,1) = D/10;
    else
        d(i,1) = 0;
    end
end

% 构建Leslie矩阵
L = zeros(n,n);
for i = 1:n
    L(1,i) = ((1+d(i))/(1-d(1))) * w(i) * b(i); 
end
for i = 1:n-1
    L(i+1,i) = (1/(1-d(i+1))) * p(i);
end
L

year_group = (2037-2007)/5;
for i = 1:year_group+1
    G(:,i) = (L^(i-1)) * X;
end

P = zeros(1,year_group+1);
for i = 1:year_group+1
    P(i) = sum(G(:,i));
end
