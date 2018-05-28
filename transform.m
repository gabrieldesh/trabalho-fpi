function OutputImage = transform(InputImage, T, min_x, max_x, ...
                                                min_y, max_y, ...
                                                interpolationMethod)
    num_lines = max_y - min_y + 1;
    num_columns = max_x - min_x + 1;
    num_channels = size(InputImage, 3);
    OutputImage = zeros(num_lines, num_columns, num_channels, 'uint8');
    
    for line = 1 : num_lines
        for column = 1 : num_columns
            % Pixel (1, 1) da imagem corresponde a coordenadas (0, 0) no
            % plano cartesiano.
            x_out = min_x + column - 2;
            y_out = min_y + line - 2;
          
            a = T \ [ x_out    % A \ B é equivalente a inv(A) * B, mas o
                      y_out    % algoritmo usado em A \ B é mais eficiente 
                      1     ]; % e preciso.
            x_in = a(1);
            y_in = a(2);
            
            
            % Passa coordenadas da imagem, que começam em (1,1), em vez de 
            % coordenadas do plano cartesiano, que começam em (0,0).
            OutputImage(line, column, :) = ...
                interpolation(InputImage, x_in + 1, y_in + 1, ...
                              interpolationMethod);
        end
    end
end