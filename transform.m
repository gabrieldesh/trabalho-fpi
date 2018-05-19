function J = transform(I, T, scaleX, scaleY, interpolationMethod)
  J = I;
  [N, M, ~] = size(I);
  
  for yj = 1 : N * scaleY
      for xj = 1 : M * scaleX
          a = T \ [ xj    % A \ B é equivalente a inv(A) * B, mas o
                    yj    % algoritmo usado em A \ B é mais eficiente e
                    1  ]; % preciso.
          xi = a(1);
          yi = a(2);
          J(yj, xj, :) = interpolation(I, xi, yi, interpolationMethod);
      end
  end
end