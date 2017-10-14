I = imread('../IMAGE/motion1.tiff');
J = imread('../IMAGE/motion2.tiff');
K = imsubtract(J, I);

figure;
subplot(1,3,1); imshow(I);
subplot(1,3,2); imshow(J);
subplot(1,3,3); imshow(K);