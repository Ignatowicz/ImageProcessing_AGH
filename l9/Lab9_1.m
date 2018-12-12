close all;
clearvars;
clc;

%% Detekcja krawedzi
dom = imread('dom.png');

figure(1);
subplot(2, 2, 1);
imshow(dom);
title('original');


%% detekcja z LoG
detection_log = edge(dom, 'log');

subplot(2, 2, 2);
imshow(detection_log);
title('LoG')

%% detekcja Canny'ego
detection_canny = edge(dom, 'canny');

subplot(2, 2, 3);
imshow(detection_canny);
title('Canny');

%% detekcja Sobel
detection_sobel = edge(dom, 'sobel');

subplot(2, 2, 4);
imshow(detection_sobel);
title('sobel');
