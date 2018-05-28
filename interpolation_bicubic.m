function z = interpolation_bicubic(I, x, y, c)
    % Preenche P com os 16 pontos a serem usados na interpolação.
    P = zeros(4, 4);
    for i = 1 : 4
        for j = 1 : 4
            P(i, j) = I(floor(y) + i - 2, floor(x) + j - 2, c);
        end
    end
    
    % Interpola na horizontal.
    r1 = cubic_interpolation(x, P(1, :));
    r2 = cubic_interpolation(x, P(2, :));
    r3 = cubic_interpolation(x, P(3, :));
    r4 = cubic_interpolation(x, P(4, :));
    
    % Interpola na vertical.
    z = cubic_interpolation(y, [r1 r2 r3 r4]);
end

function z = cubic_interpolation(x, y)
    % y é um vetor com os 4 valores a serem usados na interpolação.
    
    % Transforma y em vetor coluna
    y = y(:);
    
    a = x - floor(x);
    b = [ a^3 a^2  a   1  ];
    
    invB = [ -1  3 -3  1
              3 -6  3  0
             -2 -3  6 -1
              0  6  0  0 ] / 6;
    
    z = b * invB * y;
end