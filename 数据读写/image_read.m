imag = imread('Yui.jpg');
size(img)

image(img)
lip = img(242:266, 255:279, :);
image(lip);
procheilon = lip(12:13, 12:12, :)

image(procheilon);