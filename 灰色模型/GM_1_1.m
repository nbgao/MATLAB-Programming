x0 = [92.810 97.660 98.800 99.281 99.537 99.537 99.817 100.000];
n = length(x0);

% �������ж�
lamda = x0(1:n-1)./x0(2:n);
range = minmax(lamda);
% �ж��Ƿ��ʺ���һ�׻�ɫģ��ģ��
if range(1,1) < exp(-(2/(n+2))) || range(1,2) > exp(2/(n+2))
    error('����û�������ɫģ�͵ķ�Χ��');
else
    % �������
    disp('           ');
    disp('����GM(1,1)');
end

% ��AGO�ۼӴ���
x1 = cumsum(x0);
for i = 2:n
    % ������ھ�ֵ���׻�����ֵ
    z(i) = (x1(i) + x1(i-1))/2;
end
B = [-z(2:n)' , ones(n-1,1)];
Y = x0(2:n)';

% ����С���˷����㷢չϵ���ͻ�ɫ������
u = inv(B'*B)*B'*Y;
% ����GM(1,1)������ʽ����ԭʼ���е�AGO
forecast = (x1(1) - u(2)./u(1)) .* exp(-u(1).*([0:n-1])) + u(2)./u(1);
% ��AGO���ֵ�����ۼ�
% diff���ڶԷ��ű��ʽ������
% �������������������ʾ����ԭ�������ڵĲ�
exchange = diff(forecast);

% �����ɫģ��Ԥ���ֵ
forecast = [x0(1),exchange];
% ����в�
epsilon = x0 - forecast;
% ����������
delta = abs(epsilon./x0);

% ����ģ�͵����
% 1.������Q���鷨
Q = mean(delta);
% 2.�����C���鷨
C = std(epsilon,1)/std(x0,1);
% 3.С������P���鷨
S1 = std(x0,1);
S1_new = S1 * 0.6745;
temp_P = find(abs(epsilon - mean(epsilon)) < S1_new);
P = length(temp_P)/n;

% ����ԭʼ�������ɫģ��Ԥ��ó������в�������ͼ
plot(1:n , x0 , 'ro' , 'markersize' , 11);
hold on;
plot(1:n , forecast , 'k-', 'linewidth' , 2.5);
grid on;
axis tight;
xlabel('x');
ylabel('y');
title('������������ʱ�����еĹ�ϵ');
legend('ԭʼ����' , 'ģ������');



