function [M,T1] = Fitness2(S)
p=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 3 5 2 4 6 5 1 3 1 5 6 3 2];
d=[5 5 5 9 9 9 9 3 12 12 10 10 10 10 10 10 24 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 6 10 15 15 20 20 20 25 28 30 30 30 40 40 45 50 60 60];
w1=[250 250 250 300 300 300 300 800 450 450 416.67 416.67 416.67 416.67 416.67 416.67 500 750 750 750 750 800 800 800 800 800 800 800 900 900 900 900 900 1000 700 900 750 750 1000 1250 1600 1800 2500 500 1700 650 1500 1800 1200 800];
w2=[166.67 166.67 166.67 225 225 225 225 400 375 375 300 300 300 300 300 300 300 375 375 375 375 571.43 571.43 571.43 571.43 571.43 571.43 571.43 400 400 400 400 400 0 0 720 600 0 800 1000 1280 1440 200 0 1190 450 1050 1260 660 500];
dw = w1 - w2;

cur = 0;
T1 = 0;     % 自有品牌加工天数
M = 0;


for i = 1:50
    cur = cur + p(S(i));
    
    if S(i) <= 33 && cur <= 60
        T1 = T1 + p(S(i));
    end
    
    if cur <= d(S(i))
        M = M + 0;
    else    
        if cur > 60
            M = M + w1(S(i));
        else 
            M = M + dw(S(i));
        end
    end
end