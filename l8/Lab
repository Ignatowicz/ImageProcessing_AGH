close all;
clearvars;
clc;

%% scienianie
fingerprint = imread('fingerprint.bmp');

thinnedImage1 = bwmorph(fingerprint, 'thin', 1);
thinnedImage2 = bwmorph(fingerprint, 'thin', 2);
thinnedImageInf = bwmorph(fingerprint, 'thin', Inf);

figure(1);
subplot(2,2,1);
imshow(fingerprint);
title('original');

subplot(2,2,2);
imshow(thinnedImage1);
title('thinned 1');

subplot(2,2,3);
imshow(thinnedImage2);
title('thinned 2');

subplot(2,2,4);
imshow(thinnedImageInf);
title('thinned 3');

%% szkieletyzacja
kosc = imread('kosc.bmp');

skeletedImage = bwmorph(kosc, 'skel', Inf);

figure(2);
subplot(1,2,1);
imshow(kosc);
title('original');
subplot(1,2,2);
imshow(skeletedImage);
title('skeletonized');

%% rekonstrukcja morfologiczna
text = imread('text.bmp');

square = strel('square', 3);
SE = ones(51, 1);

edited = text; 
edited = imerode(edited, square);
edited = imdilate(edited, square);

marker = imerode(text, SE);
mask = text;
reconstructed = imreconstruct(marker, mask);

figure(3);
subplot(3,1,1);
imshow(text);
title('original');
subplot(3,1,2);
imshow(edited);
title('opened');
subplot(3,1,3);
imshow(reconstructed);
title('reconstructed');

%% wypelnianie dziur
figure(4);
imshow(imfill(text,'holes'));
title('wypelnione dziury');

%% czyszczenie krawedzi
figure(5);
imshow(imclearborder(text));
title('wyczyszczone krawedzie');

figure(6);
imshow(text);
title('original');
