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

%% variables - podane w tresci zadania
sLimit = 4;     % minimalny obszar podobszaru
vLimit = 0.05;  % prog porownawczy dla odchylenia standardowego dla podobszaru
index = 1; % przechowuje ilosc obszarow

[y, x] = size(imageH);

segRes = zeros(y, x); % macierz zawierajaca dla punktow indeksy podobszarow 
MRes = zeros(y, x); % macierz zawierajaca srednie wartosci dla podobszarow


%% Segmentacja przez podzial
split(imageH, 1, 1, x, y);

i = 0;
while i <= index
    % przypisuje do macierzy IB elementy o tkaim samym indeksie
   IB = segRes == i;        % aktualny indeks maski pikseli
   
   if any(IB(:))            % jesli puste(same zera) to nie liczymy
       [yF, xF] = find(IB, 1, 'first');
       
       square = strel('square', 3);
       neighbours = imdilate(IB, square);   % sasiedzi danego obszaru
       diff = imabsdiff(neighbours, IB);    % odjecie maski oryginalnej
       pointMult = diff .* segRes;          % wyciecie fragmentu macierzy
       nonZeros = nonzeros(pointMult);      % elementy niezerowe
       uniqued = unique(nonZeros);          % elementy unikalne
       
       isJoined = 0;
       for neighbour = 1 : numel(uniqued)   % wektor z indeksami sasiadow
           IBS = segRes == uniqued(neighbour);  % maska dla obszaru sasiedniego
           
           [yFS, xFS] = find(IBS, 1, 'first');  % lewy gorny rog - wyciecie maski
           
           colorDiff = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if colorDiff <  5/255    % sprawdzamy czy mozemy polaczyc z obszarem
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

for i = 1 : numel(U)        % eliminacja podobszarow o rozmiarze mniejszym niz zadany
    C = segRes == U(i);     % wycinana maska dla danego indeksu
    if sum(C) < 40
       segRes(C) = 0; 
    end
end

fileredImage1= label2rgb(segRes);

figure(4);
imshow(fileredImage1);
title('po filtracji I metoda');

% filtracja II metoda
% przeindeksowanie na pierwsze N liczb calkowitych
U = unique(segRes);

for ii = 1 : numel(U)   % wycinanie maski
    C = segRes == U(ii);
    segRes(C) = ii; % przypisanie iteratora do wynikow
end

fileredImage2 = label2rgb(segRes);

figure(5);
imshow(fileredImage2);
title('po filtracji II metoda');
