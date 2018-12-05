close all;
clearvars;
clc;

%% read
moon = imread('moon.bmp');

%% Laplacian
laplacianFilter = fspecial('laplacian');
M = [ 0  1  0;
      1 -4  1; 
      0  1  0];
M = M/9;

convoluted = conv2(moon, laplacianFilter, 'same');

figure(1);
subplot(2, 2, 1);
imshow(moon, []);
title('original');

subplot(2, 2, 2);
imshow(uint8(convoluted + 128), []);
title('laplacian + 128');

subplot(2, 2, 3);
imshow(abs(convoluted), []);
title('laplacian i modul wartosci');

subplot(2, 2, 4);
imshow(moon + uint8(convoluted + 128), []);
title('moon + 128');


