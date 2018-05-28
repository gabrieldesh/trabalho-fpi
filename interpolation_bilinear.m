function z = interpolation_bilinear(I, x, y, c)
  p = floor(y);
  q = floor(x);
  a = y - p;
  b = x - q;
  
  z = (1 - a) * ((1 - b) * I(p,   q, c) + b * I(p,   q+1, c)) ...
    +      a  * ((1 - b) * I(p+1, q, c) + b * I(p+1, q+1, c));
end