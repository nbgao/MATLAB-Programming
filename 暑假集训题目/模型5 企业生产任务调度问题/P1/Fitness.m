function M = Fitness(S)
p = [3 4 1 2 6 1 4 7 5];
d = [5 9 3 12 10 24 5 6 6];
w1 = [750 1200 800 900 2500 500 3000 5600 4500];
w2 = [500 900 400 750 1800 300 1500 4000 2000];
dw = w1 - w2;

cur = 0;
M = 0;
for i = 1:9
    cur = cur + p(S(i));
    if cur <= d(S(i))
        M = M + 0;
    else
        M = M + dw(S(i));
    end
end