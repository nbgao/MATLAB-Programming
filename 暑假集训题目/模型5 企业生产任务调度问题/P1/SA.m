function S_best = SA(S)
p = [3 4 1 2 6 1 4 7 5];
d = [5 9 3 12 10 24 5 6 6];
w1 = [750 1200 800 900 2500 500 3000 5600 4500];
w2 = [500 900 400 750 1800 300 1500 4000 2000];
dw = w1 - w2;
Max = sum(w1);

a = 0.99;
t = 1000;
tf = 1;

count = 0;
Y = [];

S_cur = S;
S_new = S;
S_best = S;

E_cur = inf;
E_best = inf;

while t >= tf
    S_new = Trans(S);
    E_new = fun(S_new);
    
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


