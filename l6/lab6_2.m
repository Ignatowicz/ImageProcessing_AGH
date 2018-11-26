close all;
clearvars;
clc;

%% read
lenaSzum = imread('lenaSzum.bmp');

%% filtr medianowy
figure(1);
subplot(1, 3, 1);
imshow(lenaSzum);
title('Oiginal');

subplot(1, 3, 2);
imshow(medfilt2(lenaSzum));
title('maska - filtr medianowy');

subplot(1, 3, 3);
imshow(imabsdiff(lenaSzum, medfilt2(lenaSzum)));
title('roznica');

%% porownanie filtr usredniajacy i medianowy
figure(2);
subplot(1, 2, 1);
imshow(uint8(conv2(lenaSzum, fspecial('average', [3 3]), 'same')));
title('filtr usredniajacy');

subplot(1, 2, 2);
imshow(medfilt2(lenaSzum));
title('filtr medianowy');

%% filtr medianowy 10-krotnie

lenaSzum10 = lenaSzum;
for i = 0 : 10
    lenaSzum10 = medfilt2(lenaSzum10);
end

figure(3);
subplot(1, 2, 1); 
imshow(lenaSzum); 
title('original');

subplot(1, 2, 2); 
imshow(medfilt2(lenaSzum10));
title('filtr medianowy 10-krotnie');

