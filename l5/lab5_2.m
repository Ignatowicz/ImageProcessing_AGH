clearvars;
close all;
clc;

%% read
rice = imread('rice.png');
katalog = imread('katalog.bmp');

%% binaryzacja lokalna
riceBW = binaryzacjaLokalna(rice);
katalogBW = binaryzacjaLokalna(katalog);

figure;
subplot(1,2,1);
imshow(rice);
title('Original');
subplot(1,2,2);
imshow(riceBW);
title('binaryzacja lokalna - rice');

figure;
subplot(1,2,1);
imshow(katalog);
title('Original');
subplot(1,2,2);
imshow(katalogBW);
title('binaryzacja lokalna - katalog');

%% binaryzacja lokalna - Sauvoli
k = 0.15;
R = 128;
frame = 15;
riceSauvoli = binaryzacjaLokalnaSauvoli(rice, k, R, frame);
katalogSauvoli = binaryzacjaLokalnaSauvoli(katalog, k, R, frame);

figure;
subplot(1,2,1);
imshow(rice);
title('Original');
subplot(1,2,2);
imshow(riceSauvoli);
title('Binaryzacja Sauvoli - rice');

figure;
subplot(1,2,1);
imshow(katalog);
title('Original');
subplot(1,2,2);
imshow(katalogSauvoli);
title('Binaryzacja Sauvoli - katalog');
