x = imread('../IMAGE/Clock.tiff');
x
figure;
imshow(x)
imagesc(x)

X1 = imread('../IMAGE/Boat.tiff');
X2 = imread('../IMAGE/Clock.tiff');
X3 = imread('../IMAGE/Elaine.tiff');
X4 = imread('../IMAGE/Man.tiff');

figure;
subplot(2,2,1); imshow(X1); title('Boat');
subplot(2,2,2); imshow(X2); title('Clock');
subplot(2,2,3); imshow(X3); title('Elaine');
subplot(2,2,4); imshow(X4); title('Man');
