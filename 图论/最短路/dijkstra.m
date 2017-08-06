function [d,path] = dijkstra(G,s,e)
%{
G �ڽӾ���
s �����
e �յ���
%}
n = length(G);
D = G(s,:);
visited(1:n) = 0;
visited(s) = 1;
parent(1:n) = 0;

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
            parent(v) = u;
        end
    end
end

d = D(e);    % ��̾���

path = []
t = e;
while (t ~= s && t>0)
    path = [t,path];
    p = parent(t);
    t = p;
end
path = [s,path];    %���·��

end

% W=[0 50 inf 40 25 10  
%     50 0 15 20 inf 25  
%     inf 15 0 10 20 inf   
%     40 20 10 0 10 25  
%     25 inf 20 10 0 55  
%     10 25 inf 25 55 0];   



