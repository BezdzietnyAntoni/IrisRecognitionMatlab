function [magnitude,theta] = gradientCanny(img)
%GRADIENTCANNY
%   Function calculate gradient of image.
%   Input:
%       img - image
%   Return:
%       magnitude - magnitude image
%       theta - angle around 0, 45, 90, 135
  
    KGx = [2,2,4,2,2;
      1,1,2,1,1;
      0,0,0,0,0;
      -1,-1,-2,-1,-1;
      -2,-2,-4,-2,-2];
    KGy = KGx';
    
    %splot operatoratorow Sobela z obrazem
    filtered_x = conv2(img, KGx, 'same');
    filtered_y = conv2(img, KGy, 'same');
    
    %wyznaczenie modulu
    magnitude = sqrt(filtered_x.^2 + filtered_y.^2);
    
    %wyznaczenie nachylenia
    theta_all = atan2(filtered_y, filtered_x)*180/pi;
    
    rows = size(img, 1);
    cols = size(img, 2);
    
    %konwersja z wartosci kat -180 ... 180 do 0 ... 360
    for row = 1:rows
        for col = 1:cols
            if theta_all(row,col) < 0
                theta_all(row,col) = 360+theta_all(row,col);
            end
        end
    end
    
    %konwersja do warosci 0, 45, 90, 135 stopni
    theta = zeros(size(img));
    for row = 1:rows
        for col = 1:cols
            if ((theta_all(row, col) >= 0 ) && (theta_all(row, col) < 22.5) || (theta_all(row, col) >= 157.5) && (theta_all(row, col) < 202.5) || (theta_all(row, col) >= 337.5) && (theta_all(row, col) <= 360))
                theta(row, col) = 0;
            elseif ((theta_all(row, col) >= 22.5) && (theta_all(row, col) < 67.5) || (theta_all(row, col) >= 202.5) && (theta_all(row, col) < 247.5))
                theta(row, col) = 45;
            elseif ((theta_all(row, col) >= 67.5 && theta_all(row, col) < 112.5) || (theta_all(row, col) >= 247.5 && theta_all(row, col) < 292.5))
                theta(row, col) = 90;
            elseif ((theta_all(row, col) >= 112.5 && theta_all(row, col) < 157.5) || (theta_all(row, col) >= 292.5 && theta_all(row, col) < 337.5))
                theta(row, col) = 135;
            end  
        end
    end
       
end
