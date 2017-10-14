I = imread('../IMAGE/rice.png');
I2 = imbinarize(I);

% 定义结构元素
se = strel('disk', 3);
% 施加腐蚀操作
erodedBW = imerode(I2, se);
% 显示结果
figure;
subplot(1,2,1); imshow(I2);
subplot(1,2,2); imshow(erodedBW);


J = imread('../IMAGE/Elaine.tiff');
se = strel('ball',5,5);
erodedJ = imerode(J, se);
figure;
subplot(1,2,1); imshow(J);
subplot(1,2,2); imshow(erodedJ);