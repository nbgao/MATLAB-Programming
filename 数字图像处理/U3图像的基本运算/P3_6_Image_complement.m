I = imread('../IMAGE/Brest.tif');
J = imcomplement(I);

figure;
subplot(1,2,1); imshow(I);
subplot(1,2,2); imshow(J);

