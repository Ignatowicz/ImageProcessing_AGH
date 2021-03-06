clearvars;
close all;
clc;

%% Reading images

lena = imread('lenaRGB.bmp');
jezioro = imread('jezioro.jpg');

I = jezioro;
figure(1)
imshow(I);

%% extract rgb
red = I(:,:,1);
green = I(:,:,2);
blue = I(:,:,3);

figure(2);
subplot(1,3,1);
imhist(red, 256);
title('Red');

subplot(1,3,2);
imhist(green, 256);
title('Green');

subplot(1,3,3);
imhist(blue, 256);
title('Blue');

%% wyrownywanie
eqI = I;
eqI(:,:,1) = histeq(red, 256);
eqI(:,:,2) = histeq(green, 256);
eqI(:,:,3) = histeq(blue, 256);

figure(3);
imshow(eqI);

% tracimy glebie kolorow (bardziej widac na jeziorze)

%% HSV
hsvI = rgb2hsv(I);

h = hsvI(:,:,1);
s = hsvI(:,:,2);
v = hsvI(:,:,3);

figure(4);
subplot(1,3,1);
imhist(h, 256);
title('H');

subplot(1,3,2);
imhist(s, 256);
title('S');

subplot(1,3,3);
imhist(v, 256);
title('V');

% podmiana skladowej V
hsvI(:,:,3) = histeq(v, 256);

hsvI = hsv2rgb(hsvI);
figure(5);
subplot(1,2,1);
imshow(hsvI);
title('manipulated');
subplot(1,2,2);
imshow(I);
title('original');

