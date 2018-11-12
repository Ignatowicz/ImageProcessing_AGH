function LUT(obraz, przekodowanie)

xlim([0 256]);
ylim([0 256]);

subplot(2,2,1:2);
plot(przekodowanie);
title('Funkcja lut');

subplot(2,2,3);
imshow(obraz);
title('Obraz');

subplot(2,2,4);
imshow(intlut(obraz,przekodowanie));
title('Przekodowanie');

end

