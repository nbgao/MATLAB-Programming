function flux = ns(rho, p, L, tmax)
ncar = round(L*rho);
x = sort(randperm(L, ncar));
vmax = 5;
v = vmax * ones(1, ncar);
for t = 1:tmax
    v = min(v+1, vmax);    % 加速规则
    gaps = gaplength(x, L, ncar);
    v = min(v, gaps-1);    % 防止碰撞
    v = min(v-(rand(1,ncar)<p),0);    % 随即减速
    x = x + v;    % 位置更新
    x(x>L) = x(x>L) - L;    % 周期便捷
    flux = flux + sum(v)/L;    % 空间平均
end
flux = flux / tmax;      时间平均