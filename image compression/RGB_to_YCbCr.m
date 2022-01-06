function [y, Cb_downsampled, Cr_downsampled] = RGB_to_YCbCr(rgb_img, blocksize)
% a function to convert the input RGB image to YCbCr, then downsample the
% chrominance components by a factor of 2
% INPUT: rgb_im: the 3 dimensional RGB image 
% OUTPUTS: y: the luminance component,
%          Cb_resampled: the downsampled blue chrominance component
%          Cr_resampled: the downsampled red chrominance component


%make image size even to be able to downsample by 2
[r,c,~] = size(rgb_img);
dim_new = min([r,c])-rem(min([r,c]),blocksize);
rgb_img = imresize(rgb_img,'OutputSize',[dim_new, dim_new] );

% convert RGB to yCbCr
ycbcr_img = rgb2ycbcr(rgb_img);
y= ycbcr_img(:,:,1);
cb = ycbcr_img(:,:,2);
cr= ycbcr_img(:,:,3);

% resample the chrominance
downsampler = vision.ChromaResampler('Resampling','4:4:4 to 4:2:2');
[Cb_downsampled,Cr_downsampled] = downsampler(cb,cr);


end
