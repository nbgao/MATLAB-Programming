function D = dijkstra(G,s)
%{
G 邻接矩阵
s 起点标号
e 终点标号
%}
n = length(G);
D = G(s,:);
visited(1:n) = 0;
visited(s) = 1;

for i = 1:n-1
    temp = [];
    for j = 1:n
        if visited(j) == 1
            temp = [temp inf];
        else
            temp = [temp D(j)];
        end
    end        
    [t,u] = min(temp);          % 查找最短距离
    visited(u) = 1;             % 标记访问过
   
    for v = 1:n
        if D(v) > (D(u) + G(u,v))
            D(v) = D(u) + G(u,v);
        end
    end
end

%d = D(e);    % 最短距离
end