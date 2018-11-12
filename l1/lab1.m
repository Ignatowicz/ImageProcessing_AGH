clearvars;
close all;
clc;

%% read info about file
imfinfo('lena.jpg')
imfinfo('lena.bmp')

%% read & display images
lena_jpg = imread('lena.jpg');
figure(1);
imshow(lena_jpg);

lena_bmp = imread('lena.bmp');
figure(2);
imshow(lena_bmp);

%% convert .bmp to gray and display
lena_gray = rgb2gray(lena_bmp);
figure(3);
imshow(lena_gray);

% save converted image to file
imwrite(lena_gray, 'lena_gray.bmp');

%% read image on graph 3D, 
colormap gray;
figure(4);
mesh(lena_gray);

% take one section of graph
figure(5);
plot(lena_gray(10,:));

figure(6);
plot(lena_gray(:,2));

