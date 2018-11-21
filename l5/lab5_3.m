clearvars;
close all;
clc;

%% read
bart = imread('bart.bmp');

bartBW = bart > 192 & bart < 210;
%bartBW = uint8(bartBW, []);

figure;
subplot(1,3,1);
imshow(bart);
title('Original');
subplot(1,3,2);
imhist(bart);
title('Histogram');
subplot(1,3,3);
imshow(bartBW);
title('Binaryzacja');