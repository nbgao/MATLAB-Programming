fun = @(X) std2(X.data) * ones(size(X.data));
I1 = imread('../IMAGE/test_pixel.tif');
I2 = blockproc(I1, [16 16], fun);
I3 = blockproc(I1, [8 8], fun);
I4 = blockproc(I1, [4 4], fun);

figure;
subplot(2,2,1); imshow(I1); title('Origin Image');
subplot(2,2,2); imshow(I2); title('Block Size: 16*16');
subplot(2,2,3); imshow(I3); title('Block Size: 8*8');
subplot(2,2,4); imshow(I4); title('Block Size: 4*4');