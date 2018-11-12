clearvars;
close all;
clc;

%
phobos = imread('phobos.bmp');

%% 
figure();
subplot(1,2,1);
imshow(phobos);
title('original');
subplot(1,2,2);
histeq(phobos);
title('histeq');

% wynik operacji nie jest satysfakcjonujacy, wyrownanie histeq uwydatnilo
% mankamenty zdjecia

%%
figure(2);
load histogramZadany;

plot(histogramZadany);
title('histogramZadany');

%% matching
figure(3);
phobos_matched = histeq(phobos, histogramZadany);
subplot(1,3,1);
imshow(phobos_matched);
title('histeq');

% histogram
subplot(1,3,2);
imhist(phobos_matched, 256);
title('histogram');

% adjust & CLAHE
phobos_streched = imadjust(phobos);
phobos_adapted = adapthisteq(phobos_streched);

subplot(1,3,3);
imshow(phobos_adapted);
title('rociagniete oraz CLAHE');

% najwiecej szczegolow jest widoczne na obrazie rozciagnietym i wyrownanym 
% metoda CLAHE