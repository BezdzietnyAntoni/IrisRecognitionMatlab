function [out] = isDefault(isDeff, default, new)
%ISDEFAULT Summary of this function goes here
%   Detailed explanation goes here
    if isDeff == true
        out = default;
    else
        out = new;
    end
end

