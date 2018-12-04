function data_filtered = bilateral_local(data, local_window)

Nx = size(data, 2);
sigma = 3;

data_filtered = size(data);

for i = 1 : Nx
    
    patch = reshape(data(:, i), local_window);
    
    [rows, cols] = find(patch == patch);
    rows =  ceil(reshape(rows, local_window));
    cols = ceil(reshape(cols, local_window));
    
    Ncy = ceil(local_window(1)/2);
    Ncx = ceil(local_window(2)/2);
    
    dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
    abs_val = abs(patch - patch(Ncy, Ncx));
    
    h = exp(((-1) * (abs_val .* abs_val)) / (2 * sigma ^ 2));
    luminosity = exp(((-1) * (dist .* dist)) / (2 * sigma ^ 2));
    
    data_filtered(i) = sum(sum(luminosity .* patch .* h)) / sum(sum(luminosity .* h));
    
end 

end