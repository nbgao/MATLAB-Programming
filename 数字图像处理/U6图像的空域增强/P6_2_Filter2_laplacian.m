I = imread('../IMAGE/Mark.bmp');
h = fspecial('laplacian');
J = filter2(h,I);

figure;
subplot(1,2,1); imshow(I); title('原始图像');
subplot(1,2,2); imshow(J); title('拉普拉斯滤波');