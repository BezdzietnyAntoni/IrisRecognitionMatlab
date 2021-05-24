function [closest_position] = findMinDistance(vector_positions,center)
%FINDMINDISTANCE Summary of this function goes here
%   Function return position of the closest object
    if isempty(vector_positions) || isempty(center)
        closest_position = [];
        return
    end
    length_square = (vector_positions-center).^2;
    length = length_square(:,1) + length_square(:,2); 
    [~, closest_position] = min(length);
end

