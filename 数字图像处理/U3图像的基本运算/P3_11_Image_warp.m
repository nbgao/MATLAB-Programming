I = imread('../IMAGE/Lena.tiff');
TransformMat1 = affine2d([cosd(30) sind(30) 0;
                        -sind(30) cosd(30) 0;
                                0   0      1]);
TransformMat2 = affine2d([1.5 0 0;
                          0 1 0;
                          0 0 1]);
TransformMat3 = affine2d([cosd(45) sind(45) 0;
                         -sind(45) cosd(45) 0;
                               0     0      1]);                            
J1 = imwarp(I, TransformMat1);
J2 = imwarp(I, TransformMat2);
J3 = imwarp(I, TransformMat3);

figure;
subplot(2,2,1); imshow(I);
subplot(2,2,2); imshow(J1);
subplot(2,2,3); imshow(J2);
subplot(2,2,4); imshow(J3);