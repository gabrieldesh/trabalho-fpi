function P = interpolation(I, x, y, method)
  switch lower(method)
      case 'replication'
          interp_function = @interpolation_replication;
      case 'bilinear'
          interp_function = @interpolation_bilinear;
      otherwise
          error("Unknown interpolation method " + method + ".")
  end
  
  [N, M, numChannels] = size(I);
  
  function Q = F(y, x, c)
      if x >= 1 && x <= M && y >= 1 && y <= N
          Q = I(y, x, c);
      else
          Q = 0;
      end
  end

  P = zeros(1, 1, numChannels);
  for c = 1:numChannels
      P(c) = interp_function(@F, x, y, c);
  end
end