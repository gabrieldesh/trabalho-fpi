function P = interpolation(I, x, y, method)
  switch lower(method)
      case 'replication'
          P = interpolation_replication(I, x, y);
      otherwise
          error("Unknown interpolation method " + method + ".")
  end
end