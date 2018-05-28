function z = interpolation_replication(I, x, y, channel)
  z = I(floor(y), floor(x), channel);
end