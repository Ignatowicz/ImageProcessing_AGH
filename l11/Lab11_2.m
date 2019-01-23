clearvars;
close all;
clc;

%% Filtracja w dziedzinie czestotliwosci
% dla czestotliwosci mozna korzystac tylko z filtro liniowych (odpada mediana itp.)

I = imread('lena.bmp');

figure(1);
subplot(2,2,1);
imshow(I);
title('original');


fI = fft2(I);

subplot(2,2,2);
imshow(fI);
title('fourier');

% amplituda
A = abs(fI);
A = log10(A+1);

subplot(2,2,3);
imshow(A, []);
title('amplituda');

% faza
F = angle(fI.*(A > 0.0001)); % eliminuje elementy w macierzy ktore sa bliskie 0

subplot(2,2,4);
imshow(F, []);
title('faza');

%% filtracja gornoprzepustowa

[f1, f2] = freqspace(512, 'meshgrif'); % generuje wektory opisujace przestrzen w dziedzinie czestotliwosci

Hd = ones(512); % 512 to rozmiar obrazka

r = sqrt(f1.^2 + f2.^2); % wektor promienia kola w dziedzinie czestotliwosci

Hd((r<0.8)) = 0;    % generuje maske usuwajaco wszytsko poza okregiem o promieniu 0,3


figure(2);
colormap(jet(64)); 
mesh(f1, f2, Hd);
title('filtr colormap');

fSI = fftshift(fI); % przesuniecie fouriera
iF = fSI.*Hd;    % filtracja

nI = ifft2(ifftshift(iF));

figure(3);
imshow(nI, []);
title('przefiltrowany fourier');

% okno hanninga 2D
Hd((r>0.1)) = 0;    % generuje maske usuwajaco wszytsko poza okregiem o promieniu 0,1
h = fwind1(Hd, hanning(21));     % filtr 2D
[H f1 f2] = freqz2(h, 512, 512);

figure(4);
mesh(f1, f2, H);
title('filtr hanning');

iF2 = fSI.*H;

nI2 = ifft2(ifftshift(iF2));

figure(5);
imshow(nI2, []);
title('hanning');

% filtr gaussa
gauss = fspecial('gaussian', size(I), 32); % std_odchylenie, im wieksze tym mniej rozmyte
%[H_gauss f1 f2] = freqz2(gauss, 512, 512);
%grayed = mat2gray(H_gauss);
grayed = mat2gray(gauss);

figure(6);
mesh(f1, f2, grayed);
title('filtr gaussa');

iF3 = fSI.*grayed;

nI3 = ifft2(ifftshift(iF3));

figure(7);
imshow(nI3, []);
title('gauss');
