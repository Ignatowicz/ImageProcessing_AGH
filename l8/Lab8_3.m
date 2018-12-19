close all;
clearvars;
clc;

%% ferrari
ferrari = imread('ferrari.bmp');

figure(1);
subplot(3,3,1);
imshow(ferrari);
title('original');

square = strel('square', 3);

eroded = imerode(ferrari, square);
subplot(3,3,2);
imshow(eroded);
title('eroded');

dilatated = imdilate(ferrari, square);
subplot(3,3,3);
imshow(dilatated);
title('dilatated');

erodedDiff = ferrari - eroded;
subplot(3,3,4);
imshow(erodedDiff);
title('roznica erozja');

dilatatedDiff = dilatated - eroded;
subplot(3,3,5);
imshow(dilatatedDiff, []);
title('roznica dylatacja');

subplot(3,3,7);
imshow(imopen(ferrari, square));
title('tlumienie jasnych - open');

subplot(3,3,6);
imshow(imclose(ferrari, square));
title('tlumienie ciemnych - close');

subplot(3,3,8);
imshow(imtophat(ferrari, square));
title('top-hat');

subplot(3,3,9);
imshow(imbothat(ferrari, square));
title('bottom-hat');

%% rice
rice = imread('rice.png');

disk = strel('disk', 10);

figure(2);
subplot(1,3,1);
imshow(rice);
title('original');

subplot(1,3,2);
imshow(imtophat(rice, disk));
title('top-hat z disk');

subplot(1,3,3);
imshow(imbothat(rice, disk));
title('bottom-hat z disk');
