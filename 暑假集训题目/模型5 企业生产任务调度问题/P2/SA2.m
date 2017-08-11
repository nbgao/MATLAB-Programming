function S_best = SA(S)
p=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 3 5 2 4 6 5 1 3 1 5 6 3 2];
d=[5 5 5 9 9 9 9 3 12 12 10 10 10 10 10 10 24 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 6 10 15 15 20 20 20 25 28 30 30 30 40 40 45 50 60 60];
w1=[250 250 250 300 300 300 300 800 450 450 416.67 416.67 416.67 416.67 416.67 416.67 500 750 750 750 750 800 800 800 800 800 800 800 900 900 900 900 900 1000 700 900 750 750 1000 1250 1600 1800 2500 500 1700 650 1500 1800 1200 800];
w2=[166.67 166.67 166.67 225 225 225 225 400 375 375 300 300 300 300 300 300 300 375 375 375 375 571.43 571.43 571.43 571.43 571.43 571.43 571.43 400 400 400 400 400 0 0 720 600 0 800 1000 1280 1440 200 0 1190 450 1050 1260 660 500];
dw = w1 - w2;

Max = sum(w1);

a = 0.99;
t = 100000;
tf = 1;

count = 0;
Y = [];

S_cur = S;
S_new = S;
S_best = S;

E_cur = inf;
E_best = inf;

while t >= tf
    S_new = Trans2(S);
    E_new = fun2(S_new);
    
    if E_new < E_cur
        E_cur = E_new;
        S_cur = S_new;
        if E_new < E_best
            E_best = E_new;
            S_best = S_new;
        end
    else
        if rand < exp(-(E_new-E_cur)/t)
            E_cur = E_new;
            S_cur = S_new;
        else
            S_new = S_cur;
        end
    end
    t = t * a;
    count = count + 1;
    S_best
    [count E_best Max-E_best]
    Y(count) = E_best;
end

figure;
plot(1:count,Y,'b.-');
grid on;
xlabel('迭代次数');
ylabel('目标函数值');
legend('目标函数曲线');


