close all;
clearvars;
clc;

%% setup
fingerprint = imread('fingerprint.bmp');

figure(1);
subplot(1, 1, 1);
imshow(fingerprint);
title('original');

n = 1;
scinanie = bwmorph()

for i = 0 : n
   scinanie = bwmorph(fingerprint, 'thin');
end

subplot(1, 2, 2);
imshow()