x = imread('../IMAGE/Clock.tiff');
myf = @(x) max(x(:));
y = nlfilter(x, [5 5], myf);
figure;
subplot(1,2,1); imshow(x);
subplot(1,2,2); imshow(y);