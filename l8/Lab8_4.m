close all;
clearvars;
clc;

%% zastosowanie morfologii
calculator = imread('calculator.bmp');

figure(1);
imshow(calculator);
title('original');

%% usuniecie odbic poziomych
object = ones(1, 71);

% erozja
marker = imerode(calculator, object);

% rekonstrukcja
mask = calculator;
reconstruction = imreconstruct(marker, mask);
edited = calculator - reconstruction;

figure(2);
imshow(edited);
title('rekonstrukcja morfologiczna - pozioma');

% klasyczne otwarcie
edited2 = imopen(calculator, object);
edited2 = calculator - edited2;

figure(3);
imshow(edited2);
title('klasyczne otwarcie - open');


%% usuniecie odbic pionowych
object = ones(1,11);

eroded = imerode(edited, object);

edited3 = imreconstruct(eroded, edited);

figure(4);
imshow(edited3);
title('rekonstrukcj amorfologiczna - pionowa');

%% usuniecie cienkich elementow
object = ones(1, 21);

dilatateMarker = imdilate(edited3, object);

edited4 = imreconstruct(min(dilatateMarker, edited2), edited2);

figure(5);
imshow(edited4);
title('usuniecie cienkich elementow');
