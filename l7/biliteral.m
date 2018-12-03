function data_filtered = biliteral(data, local_window)

FUNCTION = @(data_, local_window_)biliteral_local(data_, local_window_);

data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);

end