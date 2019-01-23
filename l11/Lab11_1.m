clearvars;
close all;
clc;

%% dwuwymiarowa transformata fouriera
%dwieFale = imread('dwieFale.bmp');
image = imread('kolo.bmp');
%image = imread('kwadrat.bmp');
%image = imread('kwadrat45.bmp');
%image = imread('trojkat.bmp');

dwieFale = image;

figure(1);
subplot(2,1,1);
imshow(dwieFale);
title('original');

% dwuwymiarowa transformata fouriera
fDwieFale = fft2(dwieFale);

subplot(2,1,2);
imshow(fDwieFale);
title('po fourierze');


figure(2);
subplot(2,2,1);
imshow(dwieFale);
title('original');

% amplituda
A = abs(fDwieFale);
A = log10(A+1);

subplot(2,2,2);
imshow(A, []);
title('amplituda');

% faza
F = angle(fDwieFale.*(A > 0.0001)); % eliminuje elementy w macierzy ktore sa bliskie 0

subplot(2,2,3);
imshow(F, []);
title('faza');

%% fftshift - przesuwa najnizsze czestotliwosci do centrum

fShiftDwieFale = fftshift(fDwieFale); % biore obraz po fourierze

reversedShift = ifftshift(fShiftDwieFale);
reversedImage = ifft2(reversedShift);

figure(3);
subplot(2,1,1);
imshow(dwieFale);
title('original');

subplot(2,1,2);
imshow(reversedImage, []);
title('po odwrotnym fourierze');

% odpowiedz na pytania:
%1
% biale piksele na obrazie amplitudy to wysokie czestotliwosci
%2
% wydaje sie jakby kierunek krawedzi na F-obrazie byl odbiciem lustrzanym
% wzgledem oryginalnych krawedzi (szczegolnie dobrze widac na kole)