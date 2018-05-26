function J = transform(I, T, min_x, max_x, min_y, max_y, interpolationMethod)
    N = max_y - min_y + 1;
    M = max_x - min_x + 1;
    numChannels = size(I, 3);
    J = zeros(N, M, numChannels, 'uint8');
    
    for i = 1 : N
        for j = 1 : M
            x_out = min_x + j - 1;
            y_out = min_y + i - 1;
          
            a = T \ [ x_out    % A \ B é equivalente a inv(A) * B, mas o
                      y_out    % algoritmo usado em A \ B é mais eficiente 
                      1     ]; % e preciso.
            x_in = a(1);
            y_in = a(2);
          
            J(i, j, :) = interpolation(I, x_in, y_in, interpolationMethod);
        end
    end
end