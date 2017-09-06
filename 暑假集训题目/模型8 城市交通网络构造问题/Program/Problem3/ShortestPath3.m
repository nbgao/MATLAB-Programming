function [d,sp_18,sp_13,sp_15,sp_16] = ShortestPath3(D)
%center = 15;

d = floyd(D);
for i = 1:25
   sp_18(i) = d(i, 18);
   sp_13(i) = d(i, 13);
   sp_15(i) = d(i, 15);
   sp_16(i) = d(i, 16);
end

%sp = dijkstra(D,15);


