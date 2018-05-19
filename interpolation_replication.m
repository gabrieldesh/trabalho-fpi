function P = interpolation_replication(I, x, y)
  [N, M, numChannels] = size(I);
  P = zeros(1, 1, numChannels);
  for c = 1:numChannels
      if x > 0 && x <= M && y > 0 && y <= N
          P(c) = I(ceil(y), ceil(x), c);
      else
          P(c) = 0;
      end
  end
end