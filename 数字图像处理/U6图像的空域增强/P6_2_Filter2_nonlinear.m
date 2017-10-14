I =  imread('../IMAGE/Mark.bmp');
h1 = fspecial('sobel');
K1 = filter2(h1,I);
h2 = fspecial('prewitt');
K2 = filter2(h2,I);
h3 = fspecial('log');
K3 = filter2(h3,I);

figure;
subplot(2,2,1); imshow(I); title('原始图像');
subplot(2,2,2); imshow(K1); title('sobel算子');
subplot(2,2,3); imshow(K2); title('prewitt算子');
subplot(2,2,4); imshow(K3); title('log算子');