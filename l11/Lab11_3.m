clearvars;
close all;
clc;

%% usuwanie zaklocen okresowych

I = imread('lunar.bmp');

figure(1);
subplot(1, 3, 1);
imshow(I);
title('original');

fI = fft2(I);

% amplituda
A = abs(fI);    % na obrazie amplitudy okresowym zakloceniom odpowiadaja rogi
A = log10(A+1);


Ashifted = fftshift(A);

subplot(1, 3, 2);
imshow(Ashifted, []);
title('amplituda');

% faza
F = angle(fI.*(Ashifted > 0.0001)); % eliminuje elementy w macierzy ktore sa bliskie 0

subplot(1, 3, 3);
imshow(F, []);
title('faza');


[X, Y] = size(Ashifted);

mask = Ashifted;
%mask(1:X, Y/2 - 8:Y/2 + 8) = 0;

for i = 1:X
    for j = 1:Y
        if j > 0.48 * Y && j < 0.52 * Y && sqrt((Y/2-j)^2 + (X/2-i)^2) > 0.03*Y
            mask(i, j) = 0;
        end
    end
end

figure(2);
imshow(mask, []);
title('maska');

% usuniecie zaklocen
%th = 10; % pierwszy najnizszy gdzie zaczelo byc cos widac

fft2abs = log10(abs(fI) + 1);

%imgfft2(fft2abs > th) = 0;

fSI = fftshift(fI); % przesuniecie fouriera

fImask = fSI .* mask;

%reversed_shift = ifftshift(imgfft2.*mask);

reversed_shift = ifftshift(fImask);
reversed_fourier = ifft2(reversed_shift);


figure(3);
imshow(I);
title('original');

figure(4);
imshow(reversed_fourier, []);
title('usuniete zaklocenia');
