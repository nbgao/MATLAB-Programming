function [m,M] = Fitness2(S)

a = [2	4	6	6	7	9	9	10	11	14	15	16	18	20	20	20	23];
b = [7	8	7	13	15	16	17	17	12	22	16	21	23	22	21	24	25];
d = [105	136	181	135	71	113	108	110	96	81	104	92	88	120	118	239	68];

w = [1.2 2.1 4.2 2.8 1.0 1.5 3.3 5.1 0.8 0.6 0.9 3.2 5.8 2.7 0 6.3 2.2 3.9 3.1 2.8 4.4 5.5 0.8 0.5 0.4];

for i = 1:17
    road(i).a = a(i);
    road(i).b = b(i);
    road(i).d = d(i);
end


D = InitD();

years2 = 10;
roads = 17;
cities = 25;

SP = [];
for i=1:years2
    [D, SP(i,:)] = ShortestPath(D);     % 动态更新每一年的最短距离
    for j=1:roads
        if S(j) == i
            D(road(j).a, road(j).b) = road(j).d;
            D(road(j).b, road(j).a) = road(j).d;
        end
    end   
end

for i = 1:years2
   m(i) = 0;
   for j = 1:cities
       if j ~= 15
           m(i) = m(i) + SP(i,j)*w(j)*10/10000;     % 第i年的物流成本
       end
   end
end

M = sum(m);     % 10年总物流成本

