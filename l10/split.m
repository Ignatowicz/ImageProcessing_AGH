function split(image, xS, yS, xE, yE)
    global sLimit vLimit segRes index MRes
    
    subImage = image(yS:yE, xS:xE);
    vectorSubImage = subImage(:);
    
    meanValue = mean(vectorSubImage);
    stdValue = std(vectorSubImage);
    
    if (stdValue < vLimit) || ((xE - xS) <= sLimit)
        segRes(yS:yE, xS:xE) = index;
        MRes(yS:yE, xS:xE) = meanValue;
        index = index + 1;
        
    else
        splitX = floor((xE + xS) / 2);
        splitY = floor((yE + yS) / 2);
        
        split(image, xS, yS, splitX, splitY);
        split(image, splitX + 1, yS, xE, splitY);
        split(image, splitX + 1, splitY + 1, xE, yE);
        split(image, xS, splitY + 1, splitX, yE);
    end
end