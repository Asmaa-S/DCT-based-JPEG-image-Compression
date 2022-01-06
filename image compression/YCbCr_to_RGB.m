function rgb = YCbCr_to_RGB(y,cb,cr)
%this function converts a ycbcr image to rgb given the y (luminance), and
%the downsampled chrominance (cb,cr) components. 
%the downsampling factor is 2 
%   INPUTS: y, cb, cr: the luminance, downsampled red-chrominance,
%   and downsampled blue chrominance components respectively.
%   OUTPUTS: rgb: the RGB image array

% upsample the cb and cr components 
upsampler = vision.ChromaResampler('Resampling','4:2:2 to 4:4:4');
[Cb_upsampled,Cr_upsampled] = upsampler(cb,cr);
rgb = ycbcr2rgb(cat(3,y,Cb_upsampled,Cr_upsampled));
end

