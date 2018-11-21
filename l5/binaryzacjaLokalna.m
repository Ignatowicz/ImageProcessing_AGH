function imageBW = binaryzacjaLokalna(image)

[X, Y] = size(image);

imageBW = image;

frame = 15;

for i = 1:X
    for j = 1:Y
        
        mean = meanLT(i, j, floor(frame/2), image, X, Y);
        
        if image(i, j) > mean
            imageBW(i, j) = 255;
        else
            imageBW(i, j) = 0;
        end
        
    end
end

end
