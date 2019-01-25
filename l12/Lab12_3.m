clearvars;
close all;
clc;

%% rozpoznawanie obiektow z wykorzystaniem wspolczynnikow ksztaltu
image = imread('shapes.png');

srcImage = image;

image = bwlabel(image, 4);

wsp = obliczWspolczynniki(image);
[X,Y] = size(image);

%r = regionprops(image, 'Centroid');    % nie widze tych podpisow
%for i=1:length(r)
%    text(r(i).Centroid(1), r(i).Centroid(2), ['\color(magenta)', num2str(i)]);
%end

for i = 1:X
    for j = 1:Y
        piksel = image(i, j);
        if piksel ~= 0 && ~(wsp(piksel, 2) > 0.33 && wsp(piksel ,2) < 0.66)
            image(i, j) = 0;
        end
    end
end

figure(1);
subplot(1, 2, 1); 
imshow(srcImage, []); 
title('oryginal');

subplot(1,2,2); 
imshow(image, []); 
title('x');

%%
image2 = imread('shapesReal.png');

imageSrc = image2;

BW = im2bw(image2, 0.22);   % do obrazu binarnego

IM = imcomplement(BW);     % uzupelnij braki w obrazie

SE = strel('rectangle', [5 5]); % przeksztalc morfologicznie

eroded = imerode(IM, SE);   % dokonaj prostokatnej erozji binarnego obrazu

image2 = eroded;

figure(2);
subplot(1, 2, 1); 
imshow(imageSrc);
title('oryginal');

subplot(1, 2, 2); 
imshow(image2);
title('x');


%%
image3 = bwlabel(image2, 4);

wsp2 = obliczWspolczynniki(image3);
[X,Y] = size(image3);

for i = 1:X
    for j = 1:Y
        piksel = image3(i, j);
        if piksel ~= 0 && ~(wsp2(piksel, 2) > 0.50 && wsp2(piksel, 2) < 0.66)   % znalezione wspolczynniki
            image3(i, j) = 0;
        end
    end
end

figure(3);
subplot(1, 2, 1); 
imshow(imageSrc, []); 
title('oryginal');

subplot(1, 2, 2); 
imshow(image3, []); 
title('x');         % znaloziono kszalty 'X' na obrazie rzeczywistym
