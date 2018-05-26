function P = interpolation(I, x, y, method)
  switch lower(method)
      case 'replication'
          interp_function = @interpolation_replication;
      otherwise
          error("Unknown interpolation method " + method + ".")
  end
  
  [N, M, numChannels] = size(I);
  P = zeros(1, 1, numChannels);
  for c = 1:numChannels
      if x > 0 && x <= M && y > 0 && y <= N
          P(c) = interp_function(I, x, y, c);
      else
          P(c) = 0;
      end
  end
end