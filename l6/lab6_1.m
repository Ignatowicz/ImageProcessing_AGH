close all;
clearvars;
clc;

%% read 
plansza = imread('plansza.bmp');
%plansza = imread('lena.bmp');

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

%% rozne okna
figure(3);
subplot(2,3,1);
imshow(plansza);
title('original');

subplot(2,3,2);
imshow(uint8(conv2(plansza, fspecial('average', [3 3]), 'same')));
title('okno 3');

subplot(2,3,3);
imshow(uint8(conv2(plansza, fspecial('average', [5 5]), 'same')));
title('okno 5');

subplot(2,3,4);
imshow(uint8(conv2(plansza, fspecial('average', [9 9]), 'same')));
title('okno 9');

subplot(2,3,5);
imshow(uint8(conv2(plansza, fspecial('average', [15 15]), 'same')));
title('okno 15');

subplot(2,3,6);
imshow(uint8(conv2(plansza, fspecial('average', [35 35]), 'same')));
title('okno 35');

%% maska
mask = [1 2 1; 
        2 4 2; 
        1 2 1];
mask = mask / sum(sum(mask));

figure(4);
subplot(1, 3, 1);
imshow(plansza);
title('Oiginal');

subplot(1, 3, 2);
imshow(uint8(conv2(plansza, mask, 'same')));
title('maska');

subplot(1, 3, 3);
imshow(imabsdiff(plansza, uint8(conv2(plansza, mask, 'same'))));
title('roznica');

%% maska guassian
guassianFilter = fspecial('gaussian', [5 5], 0.5);

figure(5);
subplot(2, 2, 1);
mesh(fspecial('gaussian', [5 5], 0.5));
subplot(2, 2, 2);
mesh(fspecial('gaussian', [5 5], 1));
subplot(2, 2, 3);
mesh(fspecial('gaussian', [5 5], 2));
subplot(2, 2, 4);
mesh(fspecial('gaussian', [5 5], 4));

%% filtracja gaussem
figure(6);
subplot(2,2,1);
imshow(plansza);
title('original');

subplot(2,2,2);
imshow(uint8(conv2(plansza, fspecial('gaussian', [5 5], 0.5), 'same')));
title('odchylenie 0.5');

subplot(2,2,3);
imshow(uint8(conv2(plansza, fspecial('gaussian', [5 5], 2), 'same')));
title('odchylenie 2');

subplot(2,2,4);
imshow(uint8(conv2(plansza, fspecial('gaussian', [5 5], 4), 'same')));
title('odchylenie 4');

