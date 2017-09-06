function T = Valid(S)
d = [105	136	181	135	71	113	108	110	96	81	104	92	88	120	118	239	68];
c = [7.5	6	6	6.5	10	6.5	7.5	8	8	9.5	9	9	9.5	8	8.5	6	10];
budget = [3000 2000 1000 1000 1000 3000 2000 1000 1000 1000];

T = 1;
roads = 17;
years = 10;

m = zeros(1,years);
for i = 1:roads
    year = S(i);
    m(year) = m(year) + d(i)*c(i);
end

for i = 1:years
    if(m(i) > budget(i))
        T = 0;
        break;
    end
end

