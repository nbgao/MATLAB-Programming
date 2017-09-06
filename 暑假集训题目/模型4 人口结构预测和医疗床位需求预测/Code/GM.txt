function G = GM(A)
n = length(A);
% 做级比判断
lamda = A(1:n-1) ./ A(2:n);
% 级比矩阵
lamda
range = minmax(lamda);
% 判定是否适合用一阶灰色模型模型
if range(1,1) < exp(-(2/(n+2))) || range(1,2) > exp(2/(n+2))
    error('级比没有落入灰色模型的范围内');
else
    disp('可用GM(1,1)模型');
end

% 原始数据累加
S = cumsum(A);
% 累加矩阵
S

for i = 1:(n-1)
    C(i) = (S(i) + S(i+1))/2;   % 计算紧邻均值(白化背景值)
end

% 计算待定参数的值
% 数据矩阵B
B = [-C ; ones(1,n-1)]';
B

% 数据向量Y
Y = A;
Y(1) = [];
Y = Y';
Y

c = inv(B'*B)*B'*Y;
c = c';
% 发展系数a
a = c(1)
% 灰色作用量
b = c(2)

% 预测后续数据
F = []; F(1) = A(1);
for i = 2:(n+20)
    F(i) = (A(1) - b/a) * (exp(-a * (i-1))) + b/a;
end

%
G = []; G(1) = A(1);
for i = 2:(n+20)
    G(i) = F(i) - F(i-1);
end
% 模型方程
fprintf('X1(k+1)=%fe^(-%fk) + %f',(A(1)-b/a),a,(b/a));

G
disp(['发展系数',num2str(-a)]);
disp(['灰色作用量',num2str(b)]);


%{
file = 'Out_data_age.xlsx';
sheet = 4;

if (strcmp(file,'Out_data_sex.xlsx') == 1)
    xlswrite(file,lamda,sheet,'B2:P2');
    xlswrite(file,S,sheet,'B4:Q4');
    xlswrite(file,a,sheet,'B7:B7');
    xlswrite(file,b,sheet,'C7:C7');
    xlswrite(file,B,sheet,'B10:C24');
    xlswrite(file,Y,sheet,'E10:E24');
    xlswrite(file,G,sheet,'B27:AK27');
elseif (strcmp(file,'Out_data_age.xlsx') == 1)
    xlswrite(file,lamda,sheet,'B2:F2');
    xlswrite(file,S,sheet,'B4:G4');
    xlswrite(file,a,sheet,'B7:B7');
    xlswrite(file,b,sheet,'C7:C7');
    xlswrite(file,B,sheet,'B10:C14');
    xlswrite(file,Y,sheet,'E10:E14');
    xlswrite(file,G,sheet,'B17:AA17');
end
%}

