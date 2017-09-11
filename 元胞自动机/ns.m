function flux = ns(rho, p, L, tmax)
ncar = round(L*rho);
x = sort(randperm(L, ncar));
vmax = 5;
v = vmax * ones(1, ncar);
for t = 1:tmax
    v = min(v+1, vmax);    % ���ٹ���
    gaps = gaplength(x, L, ncar);
    v = min(v, gaps-1);    % ��ֹ��ײ
    v = min(v-(rand(1,ncar)<p),0);    % �漴����
    x = x + v;    % λ�ø���
    x(x>L) = x(x>L) - L;    % ���ڱ��
    flux = flux + sum(v)/L;    % �ռ�ƽ��
end
flux = flux / tmax;      ʱ��ƽ��