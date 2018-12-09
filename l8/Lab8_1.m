close all;
clearvars;
clc;

%% setup

I = imread('ertka.bmp');
%I = imread('wyspa.bmp');

%SE = strel('diamond', 3);
SE = strel('square', 3);

%% erosion
I_erosion = imerode(I, SE);

figure(1);
subplot(2, 2, 1);
imshow(I);
title('original');
subplot(2, 2, 2);
imshow(I_erosion);
title('erosion');

I_erosion2 = imerode(I_erosion, SE);
subplot(2, 2, 3);
imshow(I_erosion2);
title('erosion * 2');

I_erosion3 = imerode(I_erosion2, SE);
subplot(2, 2, 4);
imshow(I_erosion3);
title('erosion * 3');

%% buzka
buzka = imread('buzka.bmp');

SE_buzka = [1,0,0; 0,1,0; 0,0,1];

buzka_erosion = imerode(buzka, SE_buzka);
figure(2);
subplot(1, 2, 1);
imshow(buzka);
title('original');
subplot(1, 2, 2);
imshow(buzka_erosion);
title('erosion');

%% dilatation
ertka_dilatation = imdilate(I, SE);
ertka_open = imopen(I, SE);
ertka_close = imclose(I, SE);

figure(3);
subplot(2, 2, 1);
imshow(I);
title('original');

subplot(2, 2, 2);
imshow(ertka_dilatation);
title('dilataion');

subplot(2, 2, 3);
imshow(ertka_open);
title('open');

subplot(2, 2, 4);
imshow(ertka_close);
title('close');

%% usuniecie dziur z ertki
ertka_clear = imdilate(imdilate(imclose(imopen(I, SE), SE), SE), SE);

figure(4);
subplot(1, 2, 1);
imshow(I);
title('original');

subplot(1, 2, 2);
imshow(ertka_clear);
title('cleared');

%% hitmiss
hom = imread('hom.bmp');

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

hom_hitmiss1 = bwhitmiss(hom, SE1);
hom_hitmiss2 = bwhitmiss(hom, SE2);

hom_hitmiss = bwhitmiss(hom_hitmiss1, SE2);

figure(5);
subplot(2, 2, 1);
imshow(hom);
title('original');

subplot(2, 2, 2);
imshow(hom_hitmiss1);
title('hitmiss SE1');

subplot(2, 2, 3);
imshow(hom_hitmiss2);
title('hitmiss SE2');

subplot(2, 2, 4);
imshow(hom_hitmiss);
title('SE1 + SE2');
