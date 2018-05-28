function zoom_3
    I = imread('onion.png');
    [height, width, ~] = size(I);
    T = [ 3 0 0
          0 3 0
          0 0 1 ];

    Replication = transform(I, T, 1, width * 3, 1, height * 3, 'replication');
    Bilinear    = transform(I, T, 1, width * 3, 1, height * 3, 'bilinear');
    Bicubic     = transform(I, T, 1, width * 3, 1, height * 3, 'bicubic');

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
