% PCA MATLAB实现程序
% % 数据导入及处理
clc
clear all
A = xlsread('Coporation_evaluation.xlsx','B2:I16');

% 数据标准化处理
a = size(A,1);
b = size(A,2);
for i = 1:b
    SA(:,i) = (A(:,i) - mean(A(:,i)))/std(A(:,i));
end

% % 计算相关系数矩阵的特征值和特征向量
CM = corrcoef(SA);  % 计算相关系数矩阵(correlation matrix)
[V, D] = eig(CM);    % 计算特征值和特征向量

for j = 1:b
    DS(j,1) = D(b+1-j,b+1-j);   % 对特征值按降序进行排序
end

for i = 1:b
    DS(i,2) = DS(i,1)/sum(DS(:,1));         % 贡献率
    DS(i,3) = sum(DS(1:i,1)/sum(DS(:,1)));  % 累计贡献率
end

% % 选择主成分及对应的特征向量
T = 0.9;    % 主成分信息保留率
for K = 1:b
    if DS(K,3) >= T
        Com_num = K;
        break;
    end
end

% 提取主成分对应的特征向量
for j = 1:Com_num
    PV(:,j) = V(:,b+1-j);
end

% % 计算个评价对象的主成分得分
new_score = SA * PV;
for i = 1:a
    total_score(i,1) = sum(new_score(i,:));
    total_score(i,2) = i;
end
result_report = [new_score, total_score];   % 将主成分得分与总分放在同一个矩阵中
result_report = sortrows(result_report, -4);    % 按总分降序排序

% % 输出模型及结果报告
disp('特征值及其贡献率、累计贡献率:')
DS
disp('信息保留率T对应的主成分数与特征向量:')
Com_num
PV
disp('主成分得分及排序(按第4列的总分进行降序排序，前3列为各主成分得分，第5列为企业编号)')
result_report