function z = interpolation_replication(I, x, y, c)
  z = I(floor(y) + 1, floor(x) + 1, c);
end