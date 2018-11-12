clearvars;
close all;
clc;

%% Wczytaj i skonwertuj kolo i kwadrat
kwadratImage = imread('kwadrat.bmp');
koloImage = imread('kolo.bmp');

kolo = boolean(koloImage);
kwadrat = boolean(kwadratImage);

figure(1);
subplot(1,2,1);
imshow(kolo);
title('Kolo');

subplot(1,2,2);
imshow(kwadrat);
title('Kwadrat');


%% Operacje 
figure(2);
subplot(2,2,1);
imshow(not(kolo));
title('Negacja kolo');

subplot(2,2,2);
imshow(kolo & kwadrat);
title('Kwadrat & Kolo');

subplot(2,2,3);
imshow(kwadrat | kolo);
title('Kwadrat | kolo');

subplot(2,2,4);
imshow(xor(kwadrat,kolo));
title('Kwadrat xor kolo');
