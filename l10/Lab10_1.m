clear;
clc;
close all;

%% segmentacja poprzez rozrost

knee = imread('knee.png');

figure(1);
imshow(knee);

%[x, y] = ginput(1);    % zczytuje punkt od ktorego zaczynam  segmentacje
%x = floor(x)
%y = floor(y)

x = 252;
y = 329;


knee = double(knee);

[width, height] = size(knee);

%% pierwszy sposob
visited = zeros(width, height);
segmented = zeros(width, height);
stack = zeros(10000, 2);
iStack = 1;

visited(x, y) = 1;
segmented(x, y) = 1;
stack(iStack, 1:2) = [x, y];

while iStack > 0
    nX = stack(iStack, 1);
    nY = stack(iStack, 2);
    iStack = iStack - 1;
    
    if 1< nX && nX < width && 1 < nY && nY < height
        
        for i = nX-1 : nX + 1
            for j = nY-1 : nY + 1      
                if(abs(knee(nX, nY) - knee(i, j)) < 4 && (visited(i, j) == 0))
                    iStack = iStack + 1;
                    stack(iStack, :) = [i, j];
                    segmented(i, j) = knee(i, j);
                    
                elseif i == nX && j == nY
                    segmented(i, j) = knee(i, j);
                end
                visited(i, j) = 1;

            end
        end    
    end
end

figure(2);
imshow(uint8(segmented),[]);
title('pierwszy sposob');

%% drugi sposob
visited = zeros(width, height);
segmented = zeros(width, height);   % rezultaty segmentacji
stack = zeros(10000, 2);            % stos 
iStack = 1;

visited(x, y) = 1;
segmented(x, y) = 1;
stack(iStack, 1:2) = [x, y];

threshold = 35;
nS = 0;     % licznik odwiedzonych pikseli
mV = 0;     % srednia

while iStack > 0
    nX = stack(iStack, 1);
    nY = stack(iStack, 2);
    iStack = iStack - 1;
    
    nS = nS + 1;
    mV = (mV * (nS - 1) + knee(nX, nY)) / nS;
    
    if 1< nX && nX < width && 1 < nY && nY < height
        
        for i = nX-1 : nX + 1
            for j = nY-1 : nY + 1      
                if i ~= nX && j ~= nY && visited(i, j) == 0 && ((abs(knee(i, j) - mV)) < threshold)
                    iStack = iStack + 1;
                    stack(iStack, :) = [i, j];
                    segmented(i, j) = knee(i, j);
                    
                elseif i == nX && j == nY
                    segmented(i, j) = knee(i, j);
                end
                visited(i, j) = 1;

            end
        end    
    end
end

figure(3);
imshow(uint8(segmented),[]);
title('drugi sposob');

%% gauss & imfilter
gauss = fspecial('gaussian');
segmented = imfilter(uint8(segmented),gauss);

figure(4);
imshow(segmented,[]);
title('gauss & imfilter');
