clearvars;
close all;
clc;

%% read image
parrot = imread('parrot.bmp');
lena = imread('lena.bmp');
clock = imread('clock.bmp');
chessboard = imread('chessboard.bmp');


%% brightness level
I = imresize(clock, [128, 128]);

table = [31,15,7,3,1];

figure(1);
for i = 1:5
    
    I_a = imadjust(I, [], [0, table(i)/255]);
    subplot(2,3,i);
    imshow(I_a,[]);
    
end