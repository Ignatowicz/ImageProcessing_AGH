function nTablica = union(indeksP, indeksQ, tablica)  % laczenie elementow tablicy wzgledem indeksu korzenia
    nTablica = tablica;
    nTablica(root(indeksP, tablica)) = root(indeksQ, tablica);
end