function [P,M] = Fitness3(S)

a = [2	4	6	6	7	9	9	10	11	14	15	16	18	20	20	20	23];
b = [7	8	7	13	15	16	17	17	12	22	16	21	23	22	21	24	25];
d = [105	136	181	135	71	113	108	110	96	81	104	92	88	120	118	239	68];

w = [2.2 1.0 0.9 2.1 3.2 0.8 0.5 1.2 3.9 5.2 2.1 2.2 5.1 0.6 4.8 3.9 6.8 0 2.0 2.4 3.3 0.9 6.5 3.0 8.1];

for i = 1:17
    road(i).a = a(i);
    road(i).b = b(i);
    road(i).d = d(i);
end


D = InitD();

years2 = 10;
roads = 17;
cities = 25;

SP_18 = [];
SP_13 = [];
SP_15 = [];
SP_16 = [];
for i=1:years2
    [D, SP_18(i,:), SP_13(i,:), SP_15(i,:), SP_16(i,:)] = ShortestPath3(D);     % 动态更新每一年的最短距离
    for j=1:roads
        if S(j) == i
            D(road(j).a, road(j).b) = road(j).d;
            D(road(j).b, road(j).a) = road(j).d;
        end
    end   
end


for i = 1:years2
   P(i) = 0;
   for j = 1:cities
       p(1) = SP_18(i,j)*w(j)*10/10000;
       p(2) = (2*SP_13(i,j)+SP_13(i,18))*w(j)/2*10/10000;
       p(3) = (2*SP_15(i,j)+SP_15(i,18))*w(j)/2*10/10000;
       p(4) = (2*SP_16(i,j)+SP_16(i,18))*w(j)/2*10/10000;

       P(i) = P(i) + min(p);
   end
end

M = sum(P);     % 10年总物流成本

