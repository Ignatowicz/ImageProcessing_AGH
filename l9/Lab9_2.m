close all;
clearvars;
clc;

%% Transformacja Hough'a
obraz = zeros(11);

% pierwszy punkt
obraz(2, 3) = 1;

figure(1);
subplot(1, 2, 1);
imshow(obraz);
title('original 11x11 - (2,3)');

subplot(1, 2, 2);
imshow(hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5), []);
title('transformacja hougha');

% drugi punkt
obraz(9, 7) = 1;

figure(2);
subplot(1, 2, 1);
imshow(obraz)
title('original 11x11 - (2,3; 9,7)');

subplot(1, 2, 2);
imshow(hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5), []);
title('transformacja hougha - dwa punkty');

% trzeci i czwarty punkt
obraz(5, 5) = 1;
obraz(3, 10) = 1;

figure(3);
subplot(1, 2, 1);
imshow(obraz)
title('original 11x11 - 4 punkty');

subplot(1, 2, 2);
imshow(hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5), []);
title('transformacja hougha - dwa punkty');

% odczytane za pomoca data cursor
rho = 118;
theta = 154;

[H, T, R] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

x = 0 : 0.1 : 10;
y = (R(rho) - x * cosd(T(theta))) / sind(T(theta));

figure(4);
subplot(1, 2, 1);
imshow(obraz);
title('original');

subplot(1, 2, 2);
imshow(obraz, []);
hold on;
plot(x + 1, y + 1);
hold off;
title('+1');
