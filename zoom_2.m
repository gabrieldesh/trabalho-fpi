function zoom_2
    I = imread('onion.png');
    [height, width, ~] = size(I);
    T = [ 2 0 0
          0 2 0
          0 0 1 ];

    Replication = transform(I, T, 1, width * 2, 1, height * 2, 'replication');
    Bilinear    = transform(I, T, 1, width * 2, 1, height * 2, 'bilinear');
    Bicubic     = transform(I, T, 1, width * 2, 1, height * 2, 'bicubic');

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
