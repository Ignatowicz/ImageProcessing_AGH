clear;
clc;
close all;

%% usuwanie zaklocen okresowych

I = imread('lunar.bmp');

figure(1);
subplot(2,2,1);
imshow(I);
title('original');

fI = fft2(I);

% amplituda
A = abs(fI);    % na obrazie amplitudy okresowym zakloceniom odpowiadaja rogi
A = log10(A+1);

subplot(2,2,2);
imshow(A, []);
title('amplituda');

% faza
F = angle(fI.*(A > 0.0001)); % eliminuje elementy w macierzy ktore sa bliskie 0

subplot(2,2,3);
imshow(F, []);
title('faza');

fSI = fftshift(fI); % przesuniecie fouriera

subplot(2,2,4);
imshow(fSI, []);
title('przesuniecie');

% usuniecie zaklocen
th = 7; % pierwszy najnizszy gdzie zaczelo byc cos widac
imgfft2 = fft2(I);
fft2abs = log10(abs(imgfft2) + 1);
imgfft2(fft2abs > th) = 0;

reversed_shift = ifftshift(imgfft2);
reversed_fourier = ifft2(reversed_shift);

figure(3);
imshow(I);
title('original');

figure(4);
imshow(reversed_fourier, []);   % w sumie to negatyw z tego wyszedl
title('usuniete zaklocenia');
