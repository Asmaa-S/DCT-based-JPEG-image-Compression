% in the experiments section, we conduct various test runs of the
% compression-decompression pipeline with varying block-sizes and
% compression degrees on both a sample grayscale image and an RGB colored
% image. The test input images are in the folder 'input_test_images', the
% intermediate compressed binaries are in the 'compressed_outputs' folder,
% and the decompressed images are in the 'decompressed_outputs' folder.
clear;clc;close all;

%% Experiment 1: Grayscale_image, blocksize = 8, Low-compression
blocksize=8;
matrix =imread('input_test_images/GRAY.jpg'); %reading the image
[r, c, ~]= size(matrix); 
orig_size=(floor(min([r c])/blocksize)*blocksize)^2;  
matrix = rgb2gray(matrix);

[h, d, cb, cr]= compressJPEG(matrix,0,blocksize);
decomp= decompressJPEG(h,d,cb,cr,0,blocksize);

subplot(1,2,1);
imshow(matrix);title('before compression');
subplot(1,2,2); 
imshow(decomp);title('after compression');
 
sgt = sgtitle('low compression,8by8block-wise','Color','red');
imwrite(decomp, 'decompressed_outputs/gray_low_comp 8by8.jpg','jpeg');
%compression ration from array length reduction
gray_c_ratio_low_8by8= ((orig_size-length(h))/orig_size)*100;

[r, c]=size(decomp);
% calculating mean absolute error
gray_error8by8_low= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c))));

%% Experiment 2: Grayscale_image, blocksize = 8, HIGH-compression
figure;

[h2, d2]= compressJPEG(matrix,1,blocksize);
decomp= decompressJPEG(h2,d2,cb,cr,1,blocksize);

subplot(1,2,1);
imshow(matrix);title('before compression');
subplot(1,2,2); 
 imshow(decomp);title('after compression');
 
 sgt2 = sgtitle('high compression,8by8block-wise','Color','red');
 imwrite(decomp, 'decompressed_outputs/gray_high_comp 8by8.jpg','jpeg');
 
 gray_c_ratio_high_8by8= ((orig_size-length(h2))/orig_size)*100;
 
 [r, c]=size(decomp);
gray_error8by8_high= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c))));
%% Experiment 3: Grayscale_image, blocksize = 16, LOW-compression
blocksize=16;
orig_size=(floor(min([r c])/blocksize)*blocksize)^2;
figure;
[h1, d1, cb, cr]= compressJPEG(matrix,0,blocksize);
decomp= decompressJPEG(h1,d1,cb, cr,0,blocksize);

subplot(1,2,1);
imshow(matrix);title('before compression');
subplot(1,2,2); 
 imshow(decomp);title('after compression');
 
 sgt3 = sgtitle('low compression,16by16block-wise','Color','red');
 
imwrite(decomp, 'decompressed_outputs/gray_low_comp_16by16.jpg','jpeg');
%compression ration per array lengths
gray_c_ratio_low_16by16= ((orig_size-length(h1))/orig_size)*100;
[r, c]=size(decomp);
%mean absolute error
gray_error16by16_low= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c))));

%% Experiment 4: Grayscale_image, blocksize = 16, HIGH-compression
figure;

[h4, d4, cb,cr]= compressJPEG(matrix,1,blocksize);
decomp= decompressJPEG(h4,d4,cb,cr,1,blocksize);

subplot(1,2,1);
imshow(matrix);title('before compression');
subplot(1,2,2); 
 imshow(decomp);title('after compression');
 
 sgt4 = sgtitle('high compression,16by16block-wise','Color','red');
 imwrite(decomp, 'decompressed_outputs/gray_high_comp 16by16.jpg','jpeg');
 gray_c_ratio_high_16by16= ((orig_size-length(h4))/orig_size)*100;
 
 [r, c]=size(decomp);
gray_error16by16_high= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c))));


%% Experiment 5: RGB_image, blocksize = 8, Low-compression
figure
blocksize=8;
matrix =imread('input_test_images/RGB.jpg'); %reading the image
[r, c, ch]= size(matrix); 
orig_size=(floor(min([r c])/blocksize)*blocksize)^2;  


[h, d, cb, cr]= compressJPEG(matrix,0,blocksize);
decomp= decompressJPEG(h,d,cb,cr,0,blocksize);

[rr,cc,~]= size(decomp);
matrix2 = imresize(matrix, [rr,cc]);
subplot(1,2,1);
imshow(matrix2);title('before compression');
subplot(1,2,2); 
imshow(decomp);title('after compression');
 
sgt = sgtitle('low compression,8by8block-wise','Color','red');
imwrite(decomp, 'decompressed_outputs/rgb_low_comp 8by8.jpg','jpeg');
%compression ration from array length reduction
rgb_c_ratio_low_8by8= ((orig_size-length(h))/orig_size)*100;

[r, c,~]=size(decomp);
% calculating mean absolute error
rgb_error8by8_low= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c,:))));

%% Experiment 6: RGB_image, blocksize = 8, HIGH-compression
figure;

[h2, d2]= compressJPEG(matrix,1,blocksize);
decomp= decompressJPEG(h2,d2,cb,cr,1,blocksize);

subplot(1,2,1);
imshow(matrix2);title('before compression');
subplot(1,2,2); 
 imshow(decomp);title('after compression');
 
 sgt2 = sgtitle('high compression,8by8block-wise','Color','red');
 imwrite(decomp, 'decompressed_outputs/rgb_high_comp 8by8.jpg','jpeg');
 
 rgb_c_ratio_high_8by8= ((orig_size-length(h2))/orig_size)*100;
 
 [r, c,~]=size(decomp);
rgb_error8by8_high= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c,:))));
%% Experiment 7: RGB_image, blocksize = 16, LOW-compression
blocksize=16;
orig_size=(floor(min([r c])/blocksize)*blocksize)^2;
figure;
[h1, d1, cb, cr]= compressJPEG(matrix,0,blocksize);
decomp= decompressJPEG(h1,d1,cb, cr,0,blocksize);

subplot(1,2,1);
imshow(matrix2);title('before compression');
subplot(1,2,2); 
 imshow(decomp);title('after compression');
 
 sgt3 = sgtitle('low compression,16by16block-wise','Color','red');
 
imwrite(decomp, 'decompressed_outputs/rgb_low_comp_16by16.jpg','jpeg');
%compression ration per array lengths
rgb_c_ratio_low_16by16= ((orig_size-length(h1))/orig_size)*100;
[r, c,~]=size(decomp);
%mean absolute error
rgb_error16by16_low= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c,:))));

%% Experiment 8: RGB_image, blocksize = 16, HIGH-compression
figure;

[h4, d4, cb,cr]= compressJPEG(matrix,1,blocksize);
decomp= decompressJPEG(h4,d4,cb,cr,1,blocksize);

subplot(1,2,1);
imshow(matrix2);title('before compression');
subplot(1,2,2); 
 imshow(decomp);title('after compression');
 
 sgt4 = sgtitle('high compression,16by16block-wise','Color','red');
 imwrite(decomp, 'decompressed_outputs/rgb_high_comp 16by16.jpg','jpeg');
 rgb_c_ratio_high_16by16= ((orig_size-length(h4))/orig_size)*100;
 
 [r, c, ~]=size(decomp);
rgb_error16by16_high= (1/numel(decomp))*sum(sum(abs(decomp-matrix(1:r,1:c,:))));


%% print statistics 
colors = ["gray", "rgb"];
degrees = ["high", "low"];
blocks= [8,16];

fprintf("compression Ratios")
for i = 1:2
    for j = 1:2
        for k = 1:2
            com_ratio = eval(sprintf('%s_c_ratio_%s_%dby%d', colors(i), degrees(j), blocks(k),blocks(k) ));
            fprintf('\n\n%s image, %s compression, with block size = %d: \n',colors(i), degrees(j), blocks(k))
            fprintf('compression ratio = %.2f',com_ratio)
        end 
    end 
end


fprintf("\n**********************\n\n reconstrction error (mean absolute error):")
for i = 1:2
    for j = 1:2
        for k = 1:2
            error = eval(sprintf('%s_error%dby%d_%s', colors(i), blocks(k),blocks(k) , degrees(j)));
            if i==2
                error = max(error);
            end
            fprintf('\n\n%s image, %s compression, with block size = %d: \n',colors(i), degrees(j), blocks(k))
            fprintf('reconstruction error = %.2f',error)
        end 
    end 
end