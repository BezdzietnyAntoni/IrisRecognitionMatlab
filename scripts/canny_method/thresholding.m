function [img_bin] = thresholding(img, low, high)
%THRESHOLDING 
%   Function set: 0 when (value < low), 1 when (value > high), between: if
%   in neighborhood is value > high set 1.
%   INPUT:
%       img - image to processing
%       low - low treshold
%       high - high treshhold
%   RETURN:
%       img_bin - binary image
    low  = low * max(max(img));
    high = high * max(max(img));
    img_tmp = zeros(size(img));
    
    
    for i = 1:size(img,1)
        for j = 1:size(img,2)
            if img(i,j) < low
                img_tmp(i,j) = 0;
            elseif img(i,j) > high
                img_tmp(i,j) = 1;
            elseif (img(i+1,j) > high || img(i-1,j) > high || ...
                    img(i,j+1) > high || img(i,j-1) > high || ...
                    img(i-1,j-1) > high || img(i-1,j+1) > high || ...
                    img(i+1,j-1) > high || img(i+1,j+1) > high ) 
                img_tmp(i,j) = 1;
            end                           
        end
    end
    
    img_bin = logical(img_tmp);
end

