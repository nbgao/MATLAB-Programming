I = imread('../IMAGE/Elaine.tiff');
J = imread('../IMAGE/Boat.tiff');
K1 = imlincomb(3,I,1,J,'uint16');
K2 = imlincomb(1,I,3,J,'uint16');

figure;
subplot(2,2,1); imshow(I);
subplot(2,2,2); imshow(J);
subplot(2,2,3); imshow(K1, []);
subplot(2,2,4); imshow(K2, []);


%{
I2 = gpuArray(imread('../IMAGE/Elaine.tiff'));
J2 = gpuArray(imread('../IMAGE/Boat.tiff'));
K3 = imlincomb(1,I2,3,J2,'uint16');
K4 = imlincomb(3,I2,1,J2,'uint16');
subplot(2,2,1); imshow(I);
subplot(2,2,2); imshow(J);
subplot(2,2,3); imshow(K3, []);
subplot(2,2,4); imshow(K4, []);
%}