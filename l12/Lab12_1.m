clearvars;
close all;
clc;

%%
image = imread('ccl1.png');

figure(1);
imshow(image);
title('original');

[X,Y] = size(image);
L = 1;  % etykieta

nImage = zeros(X,Y);

% przeszukiwanie wglab
id = zeros(100);
for I = 1:100
    id(I) = I;  % tablica kolejki przeszukiwan
end

%% first pass - pierwsza faza indeksacji
for i = 2:X-1
    for j = 2:Y-1
        if(image(i,j) ~= 0) % rozne od zera
            
            % przyklad rozwiazania z laborki
            A = nImage(i-1, j-1);
            B = nImage(i-1, j);
            C = nImage(i-1, j+1);
            D = nImage(i, j-1);
            sasiedzi = [A,B,C,D];

            if sum(sasiedzi) == 0 % a
                nImage(i,j) = L;
                L = L+1;
            else
                sasiedzi1 = nonzeros(sasiedzi);
                minimum = min(sasiedzi1);
                maximum = max(sasiedzi1);

                if(minimum == maximum)  % b
                    nImage(i,j) = maximum;
                else
                    % c
                    id = union(minimum, maximum, id);
                    nImage(i,j) = minimum;
                end
            end 
        end
     end
end


figure(2);
subplot(1,3,1); 
imshow(image); 
title('oryginal');

% przekodowanie LUT
lut = zeros(100);
for I = 1:100
   lut(I) = root(id(I), id); 
end

for i = 1:X
    for j = 1:Y
        if nImage(i, j) ~= 0
           nImage(i, j) = lut(nImage(i, j)); 
        end
    end
end

subplot(1, 3, 2); 
imshow(nImage,[]); 
title('po indeksacji');

% wynik
imageResult = imread('ccl1Result.png');

subplot(1, 3, 3); 
imshow(imageResult); 
title('wynik');
