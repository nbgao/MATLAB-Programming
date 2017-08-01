x0 = [92.810 97.660 98.800 99.281 99.537 99.537 99.817 100.000];
n = length(x0);

% 做级比判断
lamda = x0(1:n-1)./x0(2:n);
range = minmax(lamda);
% 判定是否适合用一阶灰色模型模型
if range(1,1) < exp(-(2/(n+2))) || range(1,2) > exp(2/(n+2))
    error('级比没有落入灰色模型的范围内');
else
    % 空行输出
    disp('           ');
    disp('可用GM(1,1)');
end

% 做AGO累加处理
x1 = cumsum(x0);
for i = 2:n
    % 计算紧邻均值，白化背景值
    z(i) = (x1(i) + x1(i-1))/2;
end
B = [-z(2:n)' , ones(n-1,1)];
Y = x0(2:n)';

% 用最小二乘法计算发展系数和灰色作用量
u = inv(B'*B)*B'*Y;
% 利用GM(1,1)具体表达式计算原始数列的AGO
forecast = (x1(1) - u(2)./u(1)) .* exp(-u(1).*([0:n-1])) + u(2)./u(1);
% 把AGO输出值进行累减
% diff用于对符号表达式进行求导
% 如果输入的是向量，则表示计算原向量相邻的差
exchange = diff(forecast);

% 输出灰色模型预测的值
forecast = [x0(1),exchange];
% 计算残差
epsilon = x0 - forecast;
% 计算相对误差
delta = abs(epsilon./x0);

% 检验模型的误差
% 1.相对误差Q检验法
Q = mean(delta);
% 2.方差比C检验法
C = std(epsilon,1)/std(x0,1);
% 3.小误差概率P检验法
S1 = std(x0,1);
S1_new = S1 * 0.6745;
temp_P = find(abs(epsilon - mean(epsilon)) < S1_new);
P = length(temp_P)/n;

% 绘制原始数列与灰色模型预测得出的数列差异折线图
plot(1:n , x0 , 'ro' , 'markersize' , 11);
hold on;
plot(1:n , forecast , 'k-', 'linewidth' , 2.5);
grid on;
axis tight;
xlabel('x');
ylabel('y');
title('保持量比例与时间序列的关系');
legend('原始数列' , '模型数列');



