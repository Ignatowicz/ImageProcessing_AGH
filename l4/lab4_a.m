clearvars;
close all;
clc;

% read
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

%% Histogram dla obrazow w odcieniach szarosci
figure(1);
subplot(4,2,1);
imshow(lena1);
title('Lena1');
subplot(4,2,2);
imhist(lena1,256);

subplot(4,2,3);
imshow(lena2);
title('Lena2');
subplot(4,2,4);
imhist(lena2,256);

subplot(4,2,5);
imshow(lena3);
title('Lena3');
subplot(4,2,6);
imhist(lena3,256);

subplot(4,2,7);
imshow(lena4);
title('Lena4');
subplot(4,2,8);
imhist(lena4,256);

%%streching
hist1 = imread('hist1.bmp');
hist1_streched = imadjust(hist1);

figure(2);
subplot(2,2,1);
imshow(hist1);
title('Przed rozciagnieciem');
subplot(2,2,2);
imhist(hist1,255);

subplot(2,2,3);
imshow(hist1_streched);
title('Po rozciagnieciu');
subplot(2,2,4);
imhist(hist1_streched,256);

%% Histogram skumulowany
[H,x] = imhist(hist1, 256);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

figure(3);
subplot(1,2,1);
imshow(hist1);

subplot(1,2,2);
plot(x,H);
hold on;
plot(x,C2);
hold off;
title('Histogram skumulowany');

% rozciagniety
[H,x] = imhist(hist1_streched, 256);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

figure(4);
subplot(1,2,1);
imshow(hist1_streched);

subplot(1,2,2);
plot(x,H);
hold on;
plot(x,C2);
hold off;
title('Histogram skumulowany-rozciagniety');

%% HE lut
[H,x] = imhist(hist1,256);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

C4 = C2 * 256 / max(C2);
lutHE = uint8(C4);

figure(5);
subplot(1,3,1);
hist1_he = intlut(hist1, lutHE);
imshow(hist1_he);
title('zastosowanie HE LUT');

subplot(1,3,2);
plot(x,H);
hold on;
plot(x,C2);
title('histogram z HE');
hold off;

% skumulowany
[H1,x1] = imhist(hist1_he,256);
C1 = cumsum(H1);
k = max(C1)/max(H1);
C3 = C1/k;

subplot(1,3,3);
plot(x1,H1);
hold on;
plot(x1,C3);
title('skumulowany');
hold off;

%% funkcje matlaba histeq i adapthisteq
figure(6);
subplot(3,2,1);
imshow(hist1);
title('pierwotnie');
subplot(3,2,2);
imhist(hist1,255);

subplot(3,2,3);
imshow(histeq(hist1));
title('histeq');
subplot(3,2,4);
imhist(histeq(hist1));

subplot(3,2,5);
imshow(adapthisteq(hist1));
title('adapthisteq');
subplot(3,2,6);
imhist(adapthisteq(hist1));

%% wyrownywanie obrazu dla rzeczywistych obrazow
% hist2
hist2 = imread('hist2.bmp');

figure(7);
subplot(2,3,1);
imshow(hist2);
title('pierwotnie');

subplot(2,3,2);
imhist(hist2,256);
title('histogram');

subplot(2,3,3);
imhist(histeq(hist2));
title('histeq');

subplot(2,3,4);
imhist(adapthisteq(hist2));
title('adapthisteq');

hist2_streched = imadjust(hist2);
[H,x] = imhist(hist2_streched,256);
C = cumsum(H);
C2 = C/(max(C)/max(H));

subplot(2,3,5);
imshow(hist2_streched);
title('rociagniete');

% hist3
hist3 = imread('hist3.bmp');

figure(8);
subplot(2,3,1);
imshow(hist3);
title('pierwotnie');

subplot(2,3,2);
imhist(hist3,256);
title('histogram');

subplot(2,3,3);
imhist(histeq(hist3));
title('histeq');

subplot(2,3,4);
imhist(adapthisteq(hist3));
title('adapthisteq');

hist3_streched = imadjust(hist3);
[H,x] = imhist(hist3_streched,256);
C = cumsum(H);
C2 = C/(max(C)/max(H));

subplot(2,3,5);
imshow(hist3_streched);
title('rociagniete');

% hist4
hist4 = imread('hist4.jpg');

figure(9);
subplot(2,3,1);
imshow(hist4);
title('pierwotnie');

subplot(2,3,2);
imhist(hist4,256);
title('histogram');

subplot(2,3,3);
imhist(histeq(hist4));
title('histeq');

subplot(2,3,4);
imhist(adapthisteq(hist4));
title('adapthisteq');

hist4_streched = imadjust(hist4);
[H,x] = imhist(hist4_streched,256);
C = cumsum(H);
C2 = C/(max(C)/max(H));

subplot(2,3,5);
imshow(hist4_streched);
title('rociagniete');
