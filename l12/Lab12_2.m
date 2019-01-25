clearvars;
close all;
clc;

%% wbudowana indeksacja w matlabie
image = imread('ccl2.png');

nImage4 = bwlabel(image, 4); % 4 'stykajacych sie' sasiadow
nImage8 = bwlabel(image, 8); % 8 'stykajacych sie' sasiadow

figure(1);
subplot(1, 3, 1); 
imshow(image, []); 
title('oryginal');

subplot(1, 3, 2); 
imshow(nImage4, []); % w wyniku rozpoznano 6 obiektow
title('bwlabel 4');

subplot(1, 3, 3); 
imshow(nImage8, []); % w wyniku rozpoznano 4 obiekty
title('bwlabel 8');
