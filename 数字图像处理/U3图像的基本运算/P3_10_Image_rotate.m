I = imread('../IMAGE/Lena.tiff');
n = length(I);
theta = [-45 -90 30 45 60];
J1 = imrotate(I, theta(1), 'loose');
J2 = imrotate(I, theta(2), 'loose');
J3 = imrotate(I, theta(3), 'crop');
J4 = imrotate(I, theta(4), 'crop');
J5 = imrotate(I, theta(5), 'crop');

figure;
subplot(2,3,1); imshow(I);
subplot(2,3,2); imshow(J1);
subplot(2,3,3); imshow(J2);
subplot(2,3,4); imshow(J3);
subplot(2,3,5); imshow(J4);
subplot(2,3,6); imshow(J5);