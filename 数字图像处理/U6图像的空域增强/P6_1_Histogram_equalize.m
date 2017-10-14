I = imread('../IMAGE/pout.png');
figure;
subplot(2,2,1); imshow(I); title('Origin Image');
subplot(2,2,2); imhist(I); title('Origin Image Histogram');
J = histeq(I);
subplot(2,2,3); imshow(J); title('Output Image');
subplot(2,2,4); imhist(J); title('Output Image Histogram');