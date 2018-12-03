function data_filtered = biliteral_local(data, local_window)

Nx = size(data, 2);
Ncy = ceil(local_window(1)/2);
Ncx = ceil(local_window(2)/2);
sigma = 3;

data_filtered = size(data);

h = fspecial('gaussian', local_window, 25);

for i = 1 : Nx
    
    patch = reshape(data(:, i), local_window);
    
    [rows, cols] = find(patch == patch);
    rows =  ceil(reshape(rows, local_window));
    cols = ceil(reshape(cols, local_window));
    dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
    dist = dist .* h;
    abs_val = abs(patch - patch(Ncy, Ncx));
    
    gamma = exp(((-1)*(abs_val).^2)/2*(sigma)^2);
    
    data_filtered(i) = sum(sum(dist .* gamma .* patch)) / sum(sum(dist .* gamma));
    
end 

end