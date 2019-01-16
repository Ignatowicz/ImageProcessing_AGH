clearvars;
close all;
clc;

%% filtracja wynikow
dwieFale = imread('dwieFale.bmp');

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
F = angle(fDwieFale.*(A > 0.0001));

subplot(2,2,3);
imshow(F, []);
title('faza');

%% fftshift - przesuwa najnizsze czestotliwosci do centrum

fshiftDwieFale = fftshift(dwieFale);

reversedFourier

figure(3);
subplot(2,1,1);
imshow(dwieFale);
title('original');

subplot(2,1,2);
imshow(fShiftDwieFale);
title('po odwrotnym fourierze');