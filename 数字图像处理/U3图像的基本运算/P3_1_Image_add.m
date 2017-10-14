I = imread('../IMAGE/Boat.tiff');
J = imread('../IMAGE/Lena.tiff');
K = imadd(I, J, 'uint16');
figure;
subplot(1,3,1); imshow(I);
subplot(1,3,2); imshow(J);
subplot(1,3,3); imshow(K, []);