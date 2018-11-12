clearvars;
close all;
clc;

%% read image
parrot = imread('parrot.bmp');
lena = imread('lena.bmp');
clock = imread('clock.bmp');
chessboard = imread('chessboard.bmp');

I = parrot;

%% show original image
figure(1)
imshow(I);
title('Original');


%% values of rescaled image
xReScale = 1.5;
yReScale = 1.5;

[YY,XX] = size(I);

%% rescale image by nearest neighbour interpolation method
nXX = round(XX * xReScale);
nYY = round(YY * yReScale);

nI = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;

% rescaling loop
for jj = 0 : (nYY-1)
    for ii = 0 : (nXX-1)
        
        i = round(ii * xStep);
        j = round(jj * yStep);
       
        % out of bound
        if i > XX - 1
            i = XX - 1;
        end 
        if j > YY - 1
            j = YY - 1;
        end
         
         nI(jj + 1, ii + 1) = I(j + 1, i + 1);
    end
end

%% show results
figure(2)
imshow(nI);
title('Recaled');
