% PCA MATLABʵ�ֳ���
% % ���ݵ��뼰����
clc
clear all
A = xlsread('Coporation_evaluation.xlsx','B2:I16');

% ���ݱ�׼������
a = size(A,1);
b = size(A,2);
for i = 1:b
    SA(:,i) = (A(:,i) - mean(A(:,i)))/std(A(:,i));
end

% % �������ϵ�����������ֵ����������
CM = corrcoef(SA);  % �������ϵ������(correlation matrix)
[V, D] = eig(CM);    % ��������ֵ����������

for j = 1:b
    DS(j,1) = D(b+1-j,b+1-j);   % ������ֵ�������������
end

for i = 1:b
    DS(i,2) = DS(i,1)/sum(DS(:,1));         % ������
    DS(i,3) = sum(DS(1:i,1)/sum(DS(:,1)));  % �ۼƹ�����
end

% % ѡ�����ɷּ���Ӧ����������
T = 0.9;    % ���ɷ���Ϣ������
for K = 1:b
    if DS(K,3) >= T
        Com_num = K;
        break;
    end
end

% ��ȡ���ɷֶ�Ӧ����������
for j = 1:Com_num
    PV(:,j) = V(:,b+1-j);
end

% % ��������۶�������ɷֵ÷�
new_score = SA * PV;
for i = 1:a
    total_score(i,1) = sum(new_score(i,:));
    total_score(i,2) = i;
end
result_report = [new_score, total_score];   % �����ɷֵ÷����ַܷ���ͬһ��������
result_report = sortrows(result_report, -4);    % ���ֽܷ�������

% % ���ģ�ͼ��������
disp('����ֵ���乱���ʡ��ۼƹ�����:')
DS
disp('��Ϣ������T��Ӧ�����ɷ�������������:')
Com_num
PV
disp('���ɷֵ÷ּ�����(����4�е��ֽܷ��н�������ǰ3��Ϊ�����ɷֵ÷֣���5��Ϊ��ҵ���)')
result_report