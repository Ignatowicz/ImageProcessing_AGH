close all;
clearvars;
clc;

%% read
%image = imread('kw.bmp');
image = imread('jet.bmp');

load('maskiPP.mat');

%% detekcja krawedzi - poprzez konwolucje obrazu z podana maska

gradients(image, R1);

gradients(image, R2);

gradients(image, P1);

gradients(image, P2);

gradients(image, S1);

gradients(image, S2);

%% filtr skombinowany na podstawie dwoch ortogonalnych masek Sobela
OW = sqrt((conv2(image, S1, 'same')).^2 + (conv2(image, S2, 'same')).^2);

OW2 = abs(conv2(image, S1, 'same')) + abs(conv2(image, S2, 'same'));

figure;
imshow(OW, []);

figure;
imshow(OW2, []);

