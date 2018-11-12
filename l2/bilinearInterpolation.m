% 1
clearvars;
close all;
clearvars;
close all;
clc;

%% read image
parrot = imread('parrot.bmp');
lena = imread('lena.bmp');
clock = imread('clock.bmp');
chessboard = imread('chessboard.bmp');

I = parrot;

% rescale
xReScale= 1.5;
yReScale= 1.5;

[YY,XX] = size(I);

%% rescale image by bilinear interpolation method

nXX = round(XX * xReScale);
nYY = round(YY * yReScale);

nI = double(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;

% rescaling loop
for ii = 0 : (nYY - 1)
    for jj = 0 : (nXX - 1)
        
        j1 = round(yStep * jj);
        i1 = round(xStep * ii);
        
        j2 = j1 + 1;
        i2 = i1 + 1;
        
        % out of bound
        if i2 > XX - 1
            i2 = XX - 1;
        end
        if j2 > YY - 1
            j2 = YY - 1;
        end
        
        A = double(I(j1 + 1, i1 + 1));
        B = double(I(j1 + 1, i2 + 1));
        C = double(I(j2 + 1, i1 + 1));
        D = double(I(j2 + 1, i2 + 1));
        
        i_norm = rem(ii, 1);
        j_norm = rem(jj, 1);
        
        nI(jj + 1, ii + 1) = [1 - i_norm i_norm] * [A D; B C] * [1 - j_norm; j_norm];
        
    end
end

% comparison
figure(1);
imshow(I);
title('Original');
figure(2);
imshow(uint8(nI));
title('Rescaled');

%% comparison nearest, bilinear, bicubic
figure(3)
subplot(2,2,1);
imshow(I);
title('Original');

subplot(2,2,2);
imshow(imresize(I, 5, 'nearest'));
title('nearest');

subplot(2,2,3);
imshow(imresize(I, 5, 'bilinear'));
title('bilinear');

subplot(2,2,4);
imshow(imresize(I, 5, 'bicubic'));
title('bicubic');