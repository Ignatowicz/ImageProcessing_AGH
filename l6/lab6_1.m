close all;
clearvars;
clc;

%% read 
plansza = imread('plansza.bmp');

figure(1);
imshow(plansza);

%% srednia
averageFilter = fspecial('average', [3 3]);

figure(2);
subplot(1, 3, 1);
imshow(plansza);
title('Oiginal');
subplot(1, 3, 2);
imshow(uint8(conv2(plansza, averageFilter, 'same')));
title('srednia');

subplot(1, 3, 3);
imshow(imabsdiff(plansza, uint8(conv2(plansza, averageFilter, 'same'))));
title('roznica');

%% maska
mask = [1 2 1; 2 4 2; 1 2 1];
mask = mask / sum(sum(mask));

figure(3);
subplot(1, 1, 1);
imshow(uint8(conv2(plansza, mask, 'same')));
title('maska');

%% maska guassian
guassianFilter = fspecial('gaussian', [5 5], 0.5);



