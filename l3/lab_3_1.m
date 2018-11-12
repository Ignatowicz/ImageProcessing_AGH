clearvars;
close all;
clc;

%% LUT operations

load funkcjeLUT;

figure(1);
plot(kwadratowa);
title('Funkcja kwadratowa');

% read image
lena = imread('lena.bmp');

figure(2);
imshow(lena);
title('Lena');

% lut
figure(3);
imshow(intlut(lena, kwadratowa));

% made lut function
figure(4);
LUT(lena, kwadratowa);

figure(5);
LUT(lena, log);

figure(6);
LUT(lena, odwlog);

figure(7);
LUT(lena, odwrotna);

figure(8);
LUT(lena, pierwiastkowa);

figure(9);
LUT(lena, pila);

figure(10);
LUT(lena, wykladnicza);
