clearvars;
close all;
clc;

%% read image
parrot = imread('parrot.bmp');
lena = imread('lena.bmp');
clock = imread('clock.bmp');
chessboard = imread('chessboard.bmp');

I = lena;

%% dpi

table1 = [256,128,64];
table2 = [200,400,800];

figure(1)
subplot(2,2,1);
imshow(I);
title('Original');
for i = 1:3
    I_n = imresize(I, table1(i)/512, 'nearest');
    subplot(2,2,i+1);
    imshow(I_n, 'InitialMagnification', table2(i));
    title(i);
end



