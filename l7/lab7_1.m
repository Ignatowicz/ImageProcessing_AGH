close all;
clearvars;
clc;

%% setup
load('MR_data.mat');
local_window = [4 4];

%
img1 = I_noisefree;
img2 = I_noisy1;
img3 = I_noisy2;
img4 = I_noisy3;
img5 = I_noisy4;

img_array = {img1, img2, img3, img4, img5};

%% convolution
img_conv_array = img_array;

for i = 1 : 5
    img_conv_array{i} = convolution(img_array{i}, local_window);
end

%% biliteral
img_bil_array = img_array;

for i = 1 : 5
    img_bil_array{i} = bilateral(img_array{i}, local_window);
end

%% show results
for i = 1 : 5
    
    figure('units', 'normalized', 'outerposition', [0 0 1 1]);
    
    subplot(1, 3, 1);
    imshow(uint8(img_array{i}), []);
    title('original');
    
    subplot(1, 3, 2);
    imshow(uint8(img_conv_array{i}), []);
    title('convolution');
    
    subplot(1, 3, 3);
    imshow(uint8(img_bil_array{i}), []);
    title('bilateration');
    
end