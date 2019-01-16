clear;
clc;
close all;

%% preparation
global sLimit vLimit MRes segRes index;

umbrella = imread('umbrealla.png');

figure(1);
imshow(umbrella, []);
title('Original');
 
imageHSV = rgb2hsv(umbrella);
imageH = double(imageHSV(:, :, 1));

figure(2);
imshow(imageH, []);
title('wektor H');

%% variables
sLimit = 4;
vLimit = 0.05;
index = 1;

[y, x] = size(imageH);

segRes = zeros(y, x);
MRes = zeros(y, x);


%% Segmentacja przez podzial
split(imageH, 1, 1, x, y);

i = 0;
while i <= index
   IB = segRes == i;        % aktualny indeks maski pikseli
   
   if any(IB(:))            % jesli puste(same zera) to nie liczymy
       [yF, xF] = find(IB, 1, 'first');
       
       square = strel('square', 3);
       neighbours = imdilate(IB, square);
       diff = imabsdiff(neighbours, IB);
       pointMult = diff .* segRes;
       nonZeros = nonzeros(pointMult);
       uniqued = unique(nonZeros);
       
       isJoined = 0;
       for neighbour = 1 : numel(uniqued)
           IBS = segRes == uniqued(neighbour);
           
           [yFS, xFS] = find(IBS, 1, 'first');
           
           colorDiff = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if colorDiff <  5/255
               segRes(IBS) = i;
               isJoined = 1;
           end
       end
       
       if isJoined == 0
          i = i + 1;
       end
       
   else
       i = i + 1;
   end
end

figure(3);
imshow(segRes,[]);
title('segmentacja przez podzial');

%% filtracja 
% I metoda
U = unique(segRes);     % unikalne indeksy

for i = 1 : numel(U)
    C = segRes == U(i);     % wycinana maska dla danego indeksu
    if sum(C) < 35
       segRes(C) = 0; 
    end
end

fileredImage1= label2rgb(segRes);

figure(4);
imshow(fileredImage1);
title('po filtracji I metoda');

% filtracja II metoda
U = unique(segRes);

for ii = 1 : numel(U)
    C = segRes == U(ii);
    segRes(C) = ii;
end

fileredImage2 = label2rgb(segRes);

figure(5);
imshow(fileredImage2);
title('po filtracji II metoda');
