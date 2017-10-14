I = imread('../IMAGE/Lena.tiff');
imshow(I);
K = imadjust(I, [0.3 0.7], []);
figure, imshow(K)