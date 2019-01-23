clearvars;
close all;
clc;

%% rozpoznawanie obiektow z wykorzystaniem wspolczynnikow ksztaltu
image = imread('shapes.png');

srcImage = image;

image = bwlabel(image,4);

wsp = obliczWspolczynniki(image);
[X,Y] = size(image);

for i = 1:X
    for j = 1:Y
        piksel = image(i,j);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.33 && wsp(piksel,2) < 0.66)
            image(i,j) = 0;
        end
    end
end

figure(1);
subplot(1,2,1); 
imshow(srcImage,[]); 
title('oryginal');

subplot(1,2,2); 
imshow(image,[]); 
title('x');

%%
image = imread('shapesReal.png');

imageSrc = image;

IBW = im2bw(image, 0.22);
IC = imcomplement(IBW);
element_str = strel('rectangle', [5 5]);
Ierode = imerode(IC, element_str);

image = Ierode;

figure(2);
subplot(1, 2, 1); 
imshow(imageSrc);

subplot(1, 2, 2); 
imshow(image);

%%
image = bwlabel(image, 4);

wsp = obliczWspolczynniki(image);
[X,Y] = size(image);

for i = 1:X
    for j = 1:Y
        piksel = image(i, j);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.50 && wsp(piksel,2) < 0.66)
            image(i, j) = 0;
        end
    end
end

figure(3);
subplot(1, 2, 1); 
imshow(imageSrc, []); 
title('oryginal');

subplot(1, 2, 2); 
imshow(image, []); 
title('x');
