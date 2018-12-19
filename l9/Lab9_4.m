close all;
clearvars;
clc;

%% transformacja Hougha dla obrazu rzeczywistego
lab112 = imread('lab112.png');
dom = imread('dom.png');
I = lab112;

figure(1);
imshow(I);
title('original');

% binaryzacja
I = im2bw(I, 36/255);

% czyszczenie krawedzi
I = not(I);
I = imclearborder(I);
I = not(I);

% usuwanie pionowych linii
square = strel('square', 5);
I = imclose(I, square);

figure(2);
imshow(I);
title('oczyszczone');

% krawedzie
krawedzie = edge(I, 'canny');

[H, T, R] = hough(krawedzie);

figure(2);
imshow(H, []);
peaks = houghpeaks(H, 8);
hold on;
plot(peaks, 'o');
hold off;

lines = houghlines(krawedzie, T, R, peaks, 'FillGap', 5, 'MinLength', 7);
figure(3);
imshow(krawedzie);
hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; 
         lines(k).point2];
   plot(xy(:,1), xy(:, 2), 'LineWidth', 2, 'Color', 'green');

   % Plot beginnings and ends of lines
   plot(xy(1,1), xy(1, 2), 'x', 'LineWidth', 2, 'Color', 'yellow');
   plot(xy(2,1), xy(2, 2), 'x', 'LineWidth', 2, 'Color', 'red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

hold off;