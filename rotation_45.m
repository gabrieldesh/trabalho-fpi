function rotation_45
    I = imread('lena.tif');
    [height, width, ~] = size(I);
    
    theta = 45;
    
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

    Replication = transform(I, T, -105, width + 107, -105, height + 107, 'replication');
    Bilinear    = transform(I, T, -105, width + 107, -105, height + 107, 'bilinear');
    Bicubic     = transform(I, T, -105, width + 107, -105, height + 107, 'bicubic');
    
    imwrite(Replication, 'rotation_45_replication.png');
    imwrite(Bilinear, 'rotation_45_bilinear.png');
    imwrite(Bicubic, 'rotation_45_bicubic.png');

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
