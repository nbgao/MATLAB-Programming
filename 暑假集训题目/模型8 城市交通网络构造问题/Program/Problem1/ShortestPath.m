function [d,sp] = ShortestPath(D)
center = 15;

d = floyd(D);
for i = 1:25
   sp(i) = d(i, center);
end

%sp = dijkstra(D,15);


