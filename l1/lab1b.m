clearvars;
close all;
clc;

%% image conversion
lena_gray = imread('lena_gray.bmp');

[X, map] = gray2ind(lena_gray, 256);

figure(1);
imshow(X, map);

figure(2);
map = colormap(summer(256));
imshow(X, map);