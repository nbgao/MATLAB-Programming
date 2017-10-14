I = imread('../IMAGE/rice.png');
myf = @(x) (min(min(x.data))) * uint8(ones(size(x.data)));
J = blockproc(I, [15 15], myf);
K1 = imdivide(I, J);
K2 = imdivide(I, 2);
K3 = imdivide(I, 4);

figure;
subplot(2,2,1); imshow(I);
subplot(2,2,2); imshow(K1, []);
subplot(2,2,3); imshow(K2, []);
subplot(2,2,4); imshow(K3, []);