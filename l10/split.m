function split(image, xS, yS, xE, yE)
    global sLimit vLimit segRes index MRes
    
    subImage = image(yS:yE, xS:xE); % tworzy podzia na mniejsze obrazy
    vectorSubImage = subImage(:);
    
    meanValue = mean(vectorSubImage); % srednia wartosc dla rozwazanego obrazu
    stdValue = std(vectorSubImage); % odchylenie standardowe 
    
    if (stdValue < vLimit) || ((xE - xS) <= sLimit) % sprawdzanie warunkow z podanymi zmiennymi w zadaniu
        segRes(yS:yE, xS:xE) = index;
        MRes(yS:yE, xS:xE) = meanValue;
        index = index + 1;
        
        % jesli podobszar nie jest jednorodny to rekurencyjnie dokonujemy podzialu na 4
        % czesci
    else
        splitX = floor((xE + xS) / 2);
        splitY = floor((yE + yS) / 2);
        
        split(image, xS, yS, splitX, splitY);
        split(image, splitX + 1, yS, xE, splitY);
        split(image, splitX + 1, splitY + 1, xE, yE);
        split(image, xS, splitY + 1, splitX, yE);
    end
end