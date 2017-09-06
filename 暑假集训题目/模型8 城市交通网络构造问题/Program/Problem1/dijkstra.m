function D = dijkstra(G,s)
%{
G �ڽӾ���
s �����
e �յ���
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
    [t,u] = min(temp);          % ������̾���
    visited(u) = 1;             % ��Ƿ��ʹ�
   
    for v = 1:n
        if D(v) > (D(u) + G(u,v))
            D(v) = D(u) + G(u,v);
        end
    end
end

%d = D(e);    % ��̾���
end