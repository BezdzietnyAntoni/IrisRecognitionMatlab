function [blured_img] = gaussianBlur(img,sigma)
%GAUSSIANBLUR 
%   Function filtered image by Gaussian filter.
%   Input:
%       img - Image to be filtered
%       sigma - Standard deviation 
%                (default should be sqrt(2))
%   Return:
%       blured_img - blured image

% This is a version not respons for changing sigma 
% For this sigma = sqrt(2)
%    B = [2, 4, 5, 4, 2;
%        4, 9, 12, 9, 4;
%        5, 12, 15, 12, 5;
%        4, 9, 12, 9, 4;
%        2, 4, 5, 4, 2 ];
%    B = 1/159.* B;

B = fspecial('gaussian',[5 5], sigma);
blured_img = conv2(img,B,'same');

end

