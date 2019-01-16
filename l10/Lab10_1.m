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

x = 236;
y = 347;


knee = double(knee);

[width, height] = size(knee);

%% pierwszy sposób
visited = zeros(width, height);
segmented = zeros(width, height);
stack = zeros(10000, 2);
iStack = 1;

visited(x, y) = 1;
segmented(x, y) = 1;
stack(iStack, 1:2) = [x, y];

while iStack > 0
    nY = stack(iStack, 1);
    nX = stack(iStack, 2);
    iStack = iStack - 1;
    
    if 1< nX && nX < width && 1 < nY && nY < height
       for j = nY - 1 : nY + 1
           for i = nX - 1 : nX + 1
                if(abs(knee(nY,nX) - knee(j, i)) < 4 && (visited(j, i) == 0))
                   iStack = iStack+1;
                   stack(iStack,:) = [j, i];
                   segmented(j, i) = 1;
                end
                
            visited(j, i) = 1;
           end
       end      
    end
end

figure(2);
imshow(segmented,[]);
title('pierwszy sposób');

%% drugi sposób
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
imshow(segmented,[]);
title('drugi sposób');

%% gauss & imfilter
gauss = fspecial('gaussian');
segmented = imfilter(uint8(segmented),gauss);

figure(4);
imshow(segmented,[]);
title('gauss & imfilter');
