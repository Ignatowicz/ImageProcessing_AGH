close all;
clearvars;
clc;

%% transformacja hougha dla pojedynczego obrazu
kwadraty = imread('kwadraty.png');

krawedzie = edge(kwadraty, 'canny');

[H, T, R] = hough(krawedzie);

figure(1);
imshow(H, []);

peaks = houghpeaks(H, 8);
hold on;
plot(peaks, 'o');
hold off;

lines = houghlines(krawedzie, T, R, peaks, 'FillGap', 5, 'MinLength', 7);
figure(2);
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

% Highlight the longest line segment by coloring it cyan.
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');

hold off;
