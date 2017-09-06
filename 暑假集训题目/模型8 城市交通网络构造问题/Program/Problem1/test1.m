
a = [2	4	6	6	7	9	9	10	11	14	15	16	18	20	20	20	23];
b = [7	8	7	13	15	16	17	17	12	22	16	21	23	22	21	24	25];
d = [105	136	181	135	71	113	108	110	96	81	104	92	88	120	118	239	68];

years = 10;
roads = 17;

for j = 1:roads
    s0(j) = ceil(rand()*10);
end
s0


num1 = [1 2 6 7];
num2 = [1 6];
flag = [4 2 1 1 1 4 2 1 1 1];

tic
while(1)
    for j = 1:roads
        if(j==3 || j==15)
            year = num1(ceil(rand()*4));
            s0(j) = year;
        elseif(j == 16)
            year = num2(ceil(rand()*2));
            s0(j) = year;
        else
            while(1)
                year = ceil(rand()*years);
                s0(j) = year;
                if(flag(year) > 0)
                    flag(year) = flag(year)-1;
                    break;
                end
            end
        end
    end
    if (Valid(s0) == 1)
        break;
    end
end
ss0(cnt5,:) = s0
cnt5 = cnt5+1;
toc

[mm0, MM0] = Fitness(s0)

S0 = InitPop(years,roads);

D0 = InitD();

D1 = D0;
for j=1:roads
    D1(a(j), b(j)) = d(j);
    D1(b(j), a(j)) = d(j);
end

[D2, SP] = ShortestPath(D1)

[D18_1, SP18_0] = ShortestPath(D0)
[D18_2, SP18_10] = ShortestPath(D1)

[D13_1, SP13_0] = ShortestPath(D0)
[D13_2, SP13_10] = ShortestPath(D1)

[D16_1, SP16_0] = ShortestPath(D0)
[D16_2, SP16_10] = ShortestPath(D1)

cnt1 = 0;
cnt2 = 0;
cnt3 = 0;
for i=1:25
    for j=1:i
        if(D0(i,j) > 0 && D0(i,j) < inf)
            cnt1 = cnt1 + 1;
        end
        if(D1(i,j) > 0 && D1(i,j) < inf)
            cnt2 = cnt2 + 1;
        end
        if(D2(i,j) > 0 && D2(i,j) < inf)
            cnt3 = cnt3 + 1;
        end
    end
end
cnt1,cnt2,cnt3
