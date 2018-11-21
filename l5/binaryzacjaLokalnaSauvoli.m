function imageBW = binaryzacjaLokalnaSauvoli(image, k, R, frame)

[X, Y] = size(image);

imageBW = image;

for i = 1:X
    for j = 1:Y
        
        mean = meanLT(i, j, floor(frame/2), image, X, Y);
        stddev = stddevLT(i, j, floor(frame/2), image, mean, X, Y);
        threshold = mean * (1 + k *(stddev/R - 1));
        
        if image(i,j) > threshold
            imageBW(i,j) = 255;
        else
            imageBW(i,j) = 0;
        end
        
    end
end

end