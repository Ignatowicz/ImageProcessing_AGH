function root_indeks = root(indeks, tablica) % szuka korzenia indeksu w tablicy
    root_indeks = indeks;
    while tablica(root_indeks) ~= root_indeks
        root_indeks = tablica(root_indeks);
    end
end