function Interpolated = interpolation(Image, x, y, method)
  switch lower(method)
      case 'replication'
          interpolation_function = @interpolation_replication;
      case 'bilinear'
          interpolation_function = @interpolation_bilinear;
      case 'bicubic'
          interpolation_function = @interpolation_bicubic;
      otherwise
          error("Unknown interpolation method " + method + ".")
  end
  
  [num_lines, num_columns, num_channels] = size(Image);
  
  % Retorna o valor na posição y, x, channel da imagem. Se as coordenadas
  % não estão contidas na imagem, retorna 0.
  function P = Image_extended(y, x, channel)
      if x >= 1 && x <= num_columns ...
      && y >= 1 && y <= num_lines
          P = Image(y, x, channel);
      else
          P = 0;
      end
  end

  Interpolated = zeros(1, 1, num_channels);
  
  % Interpola cada canal separadamente.
  for channel = 1 : num_channels
      Interpolated(channel) = ...
          interpolation_function(@Image_extended, x, y, channel);
  end
end