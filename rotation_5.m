function rotation_5
    I = imread('lena.tif');
    [height, width, ~] = size(I);
    
    theta = 5;
    
    Translate = [ 1           0      -width  / 2
                  0           1      -height / 2
                  0           0           1      ];
    
    Rotate = [ cosd(theta) -sind(theta)      0
               sind(theta)  cosd(theta)      0
                    0            0           1 ];
    
    TranslateBack = [ 1           0      width  / 2
                      0           1      height / 2
                      0           0          1      ];
    
    T = TranslateBack * Rotate * Translate;

    Replication = transform(I, T, -20, width + 22, -20, height + 22, 'replication');
    Bilinear    = transform(I, T, -20, width + 22, -20, height + 22, 'bilinear');
    Bicubic     = transform(I, T, -20, width + 22, -20, height + 22, 'bicubic');

    figure;
    imshow(Replication);
    title('Replication');

    figure;
    imshow(Bilinear);
    title('Bilinear');

    figure;
    imshow(Bicubic);
    title('Bicubic');
end
