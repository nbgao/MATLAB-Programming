I = imread('../IMAGE/Clock.tiff');
I16 = uint16(I);
J = immultiply(I16, I16);
K = immultiply(I, 0.5);

figure;
subplot(1,3,1); imshow(I);
subplot(1,3,2); imshow(J);
subplot(1,3,3); imshow(K);