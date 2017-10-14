I = imread('../IMAGE/Clock.tiff');
J1 = imcrop(I, [128 1 128 128]);
J2 = imcrop(I, [1 128 128 128]);
J3 = imcrop(I, [128 128 128 128]);

figure;
subplot(2,2,1); imshow(I);
subplot(2,2,2); imshow(J1);
subplot(2,2,3); imshow(J2);
subplot(2,2,4); imshow(J3);

