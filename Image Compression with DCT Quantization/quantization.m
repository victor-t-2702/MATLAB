function [] = quantization(delta)

% Read and display original image
originalImg = imread("barbara.pgm");

imshow("barbara.pgm");

% Convert original image to double format
originalImg = double(originalImg);

% Create the 8-point DCT matrix
T = dct(eye(8));

% Create reconstructed image matrix
reconstructedImg = zeros(size(originalImg));

% Initialize non-zero coefficient counter
counter = 0;

% Go through each 8x8 block of the image, using the provided formulae to 
% caclulatethe 2D DCT coefficients and their quantization reconstruction, 
% then transform them back to the original domain and save them to the
% reconstructed image matrix
for i = 1:size(reconstructedImg, 1)/8
    for j = 1:size(reconstructedImg, 2)/8
        currentBlock = originalImg(((i-1)*8 + 1):(i*8), ((j-1)*8 + 1):...
           (j*8));
        y2D = (T * currentBlock * T');
        yRec = round(y2D / delta) * delta;
        counter = counter + sum(sum(yRec ~= 0));
        currentReconstructedBlock = (T' * yRec * T);
        reconstructedImg(((i-1)*8 + 1):(i*8), ((j-1)*8 + 1):(j*8)) = ...
           currentReconstructedBlock;
        if i == 1 && j == 1
% Display the following information of the first block of the image: the
% original image block, the original 2D DCT coefficients of the block,
% the reconstructed 2D DCT coefficients, and the reconstructed block after 
% inverse DCT
            currentBlock
            y2D
            yRec
            currentReconstructedBlock
        end
    end
end

% Display total number of non-zero coefficients
totalNumberNonzeroCoefficients = counter


% Round to integers and limit range to [0, 255]
reconstructedImg = round(reconstructedImg);
reconstructedImg(reconstructedImg < 0) = 0;
reconstructedImg(reconstructedImg > 255) = 255;

% Calculate and display Mean Squared Error
rows = size(reconstructedImg, 1);
cols = size(reconstructedImg, 2);
MSE = sum(sum((originalImg - reconstructedImg).^2)) / rows / cols

% Convert reconstructed image to uint8 format
reconstructedImg = uint8(reconstructedImg);

% Display reconstructed image
figure;
imshow(reconstructedImg)

end

