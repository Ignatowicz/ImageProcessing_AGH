clearvars;
close all;
clc;

%% read
lena = imread('lena.bmp');
jet = imread('jet.bmp');

%% add images
figure(1);
subplot(1,2,1);
imshow(imadd(lena,jet),[]);
title('Dodawanie');

subplot(1,2,2);
imshow(imadd(uint16(lena),uint16(jet)),[]);
title('Dodawanie uint16');


%% Kombinacja liniowa
figure(2);
subplot(2,2,1);
imshow(imlincomb(0.9,lena,0.2,jet),[]);
title('Kombinacja liniowa');

subplot(2,2,2);
imshow(imlincomb(0.6,lena,0.3,jet),[]);
title('Kombinacja liniowa');

subplot(2,2,3);
imshow(imlincomb(0.25,lena,0.6,jet),[]);
title('Kombinacja liniowa');

subplot(2,2,4);
imshow(imlincomb(0.1,lena,0.1,jet),[]);
title('Kombinacja liniowa');


%% Odejmowanie
figure(3);
subplot(1,2,1);
imshow(imsubtract(lena,jet),[]);
title('Odejmowanie uint8');

lena16 = int16(lena);
jet16 = int16(jet);
subplot(1,2,2);
imshow(imsubtract(lena16,jet16),[]);
title('Odejmowanie int16');


% Odejmowanie bezwgledne
figure(4);
imshow(imabsdiff(lena16,jet16),[]);
title('Odejmowanie bezwgledne');


%% Mnozenie
figure(5);
imshow(immultiply(lena16,jet16),[]);
title('Mnozenie lena x jet');

figure(6);
imshow(immultiply(lena,3.5));
title('Mnozenie przez stala');

% wczytanie maski
maska = imread('kolo.bmp');
maska = boolean(maska);

figure(7);
imshow(immultiply(lena16,maska),[]);
title('Mnozenie przez maske');

%% Negatyw
figure(8);
imshow(imcomplement(lena),[]);
title('Negatyw');
