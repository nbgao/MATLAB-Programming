function T = Valid2(S)
d = [105	136	181	135	71	113	108	110	96	81	104	92	88	120	118	239	68];

T = 1;
roads = 17;
years2 = 10;

l = zeros(1,years2);
for i = 1:roads
    year = S(i);
    l(year) = l(year) + d(i);
end

for i = 1:years2
    if(l(i) > 300)
        T = 0;
        break;
    end
end

