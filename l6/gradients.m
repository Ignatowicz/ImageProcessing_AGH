function  gradients(image, mask)

convoluted = uint8(conv2(image, mask, 'same'));

figure;
subplot(2, 2, 1);
imshow(image, []);
title('original');

subplot(2, 2, 2);
imshow(convoluted + 128, []);
title('laplacian + 128');

subplot(2, 2, 3);
imshow(abs(convoluted), []);
title('laplacian i modul wartosci');

subplot(2, 2, 4);
imshow(image + convoluted + 128, []);
title('obraz + 128');

end

