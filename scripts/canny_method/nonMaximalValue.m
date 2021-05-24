function [img] = nonMaximalValue(magnitude, theta)
%NONMAXIMALVALUE 
%   Function save only maximal value in the same angle
%   INPUT:
%       magnitude - gradient magnitude
%       theta - gradient theta
%   RETURN:
%       img - image without non maxilam value in the same angle

    img = zeros(size(magnitude));
    
    for i=2:size(magnitude,1)-1
        for j=2:size(magnitude,2)-1
            if (theta(i,j)==0)
                img(i,j) = (magnitude(i,j) == max([magnitude(i,j), magnitude(i,j+1), magnitude(i,j-1)]));
            elseif (theta(i,j)==45)
                img(i,j) = (magnitude(i,j) == max([magnitude(i,j), magnitude(i+1,j-1), magnitude(i-1,j+1)]));
            elseif (theta(i,j)==90)
                img(i,j) = (magnitude(i,j) == max([magnitude(i,j), magnitude(i+1,j), magnitude(i-1,j)]));
            elseif (theta(i,j)==135)
                img(i,j) = (magnitude(i,j) == max([magnitude(i,j), magnitude(i+1,j+1), magnitude(i-1,j-1)]));
            end
        end
    end
    
    img = img.*magnitude;  
end

