x = imread('../IMAGE/Boat.tiff');
y = uint8(colfilt(x, [5 5], 'sliding', @MAX));
figure;
subplot(1,2,1); imshow(x);
subplot(1,2,2); imshow(y);

function y = MAX(x)
y = max(x);
end