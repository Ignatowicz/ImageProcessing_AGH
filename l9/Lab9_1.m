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
[detection_log, thresh] = edge(dom, 'log', 0.005);     % 0.0035
thresh
subplot(2, 2, 2);
imshow(detection_log);
title('LoG')

%% detekcja Canny'ego
[detection_canny, thresh] = edge(dom, 'canny', [0.09 0.1]); % 0.025, 0.0625
thresh
subplot(2, 2, 3);
imshow(detection_canny);
title('Canny');

%% detekcja Sobel
[detection_sobel, thresh] = edge(dom, 'sobel', 0.12); % 0.1063
thresh
subplot(2, 2, 4);
imshow(detection_sobel);
title('sobel');
