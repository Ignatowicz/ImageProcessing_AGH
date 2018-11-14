clc;
close all;
clearvars;

%% wczytanie pliku
coins = imread('coins.png');
%coins = imread('rice.png'); % prog 150
%coins = imread('tekst.bmp'); % prog 180
%coins = imread('obiekty.bmp'); % prog 185
%coins = imread('katalog.bmp'); % prog 220

figure(1);
subplot(1,2,1);
imshow(coins);
title('original');
subplot(1,2,2);
imhist(coins,256);
title('histogram');

%% progowanie, dobieranie progu wg 'kryterium jakosci'
coinsBW = im2bw(coins, 80/255);

% reczny prog = 80

figure(2);
imshow(coinsBW);

%% drugi plik
% figura
figura = imread('figura.png');

figure(3);
subplot(1,2,1);
imshow(figura);
title('original');
subplot(1,2,2);
imhist(figura, 255);
title('histogram');

% figura 2
figura2 = imread('figura2.png');

figure(4);
subplot(1,2,1);
imshow(figura2);
title('original - figura2');
subplot(1,2,2);
imhist(figura2, 255);
title('histogram - figura2');

% figura 3
figura3 = imread('figura3.png');

figure(5);
subplot(1,2,1);
imshow(figura3);
title('original - figura3');
subplot(1,2,2);
imhist(figura3, 255);
title('histogram - figura3');

% figura 4
figura4 = imread('figura4.png');

figure(6);
subplot(1,2,1);
imshow(figura4);
title('original - figura4');
subplot(1,2,2);
imhist(figura4, 255);
title('histogram - figura4');


%% metoda Ots'u
level = graythresh(coins)
coinsLevel = im2bw(coins, level);
% wyznaczony prog 0.4941 ja wyznaczylem 80, zeby byl wyrazny ksztalt
figure(7);
subplot(3,2,1);
imshow(coinsBW);
title(strcat('coinsBW: ',num2str(80)));

subplot(3,2,2);
imshow(coinsLevel);
title(strcat('coins level grathresh: ', num2str(level*255)));

% rozne metody
levelKit = clusterKittler(coins)/255;
coinsKittler = im2bw(coins, levelKit);
subplot(3,2,3);
imshow(coinsKittler);
title(strcat('coins level Kittler: ', num2str(levelKit*255)));

levelYen = entropyYen(coins)/255;
coinsYen = im2bw(coins, levelYen);
subplot(3,2,4);
imshow(coinsYen);
title(strcat('coins level Yen: ', num2str(levelYen*255)));

subplot(3,2,5);
imshow(coins)
title('original coins');

subplot(3,2,6);
imhist(coins, 255);
title('histogram - coins');


