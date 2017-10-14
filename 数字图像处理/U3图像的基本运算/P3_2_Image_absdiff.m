I = imread('../IMAGE/Elaine.tiff');
myf = @(x) mean(x);
J = uint8(colfilt(I, [7 7], 'sliding', myf));
K = imabsdiff(I, J);

figure;
subplot(1,3,1); imshow(I);
subplot(1,3,2); imshow(J);
subplot(1,3,3); imshow(K);