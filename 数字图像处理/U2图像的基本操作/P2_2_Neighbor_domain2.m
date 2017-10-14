x = imread('../IMAGE/Boat.tiff');
myf = @(x) max(x);
y = uint8(colfilt(x, [5 5], 'sliding', myf));
figure;
subplot(1,2,1); imshow(x);
subplot(1,2,2); imshow(y);