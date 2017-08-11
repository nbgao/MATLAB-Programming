function [M,T1] = Fitness3(S,t)
p = [3	4	1	2	6	1	4	7	5	2	1	1	1	3	5	2	4	6	5	1	3	1	5	6	3	2];
d = [5	9	3	12	10	24	5	6	6	10	15	15	20	20	20	25	28	30	30	30	40	40	45	50	60	60];
w1 = [750	1200	800	900	2500	500	3000	5600	4500	1000	700	900	750	750	1000	1250	1600	1800	2500	500	1700	650	1500	1800	1200	800];
w2 = [500	900	400	750	1800	300	1500	4000	2000	0	0	720	600	0	800	1000	1280	1440	200	0	1190	450	1050	1260	660	500];
dw = w1 - w2;

cur1 = 0;   % 旧工厂当前生产天数
cur2 = 0;   % 新工厂当前生产天数

T1 = 0;     % 自有品牌加工天数
M = 0;
early = 28;

for i = 1:26
    if i <= t
        cur1 = cur1 + p(S(i));
    else
        cur2 = cur2 + 0.5*p(S(i));
    end
    
    if S(i) <= 9 && cur1 <= 60
        T1 = T1 + p(S(i));
    end
    
    if i <= t
        if cur1 <= d(S(i))
            M = M + 0;
        else
            if cur1 > 60
                M = M + w1(S(i));
            else
                M = M + dw(S(i));
            end
        end
    else
        if early + cur2 <= d(S(i))
            M = M + 0;
        else
            if early + cur2 > 60
                M = M + w1(S(i));
            else
                M = M + dw(S(i));
            end
        end
    end
end