function [sum_of_circle] = daugmanCircle(img, rows_range, cols_range, r_range)

    img_rows = size(img,1);
    img_cols = size(img,2);
    
    row_low_range  = rows_range(1);
    row_high_range = rows_range(2);
    if(row_low_range >= row_high_range)
        error("In function daugmanCircle: bad arg rows_range");
    end
    
    col_low_range  = cols_range(1);
    col_high_range = cols_range(2);
    if(col_low_range >= col_high_range)
        error("In function daugmanCircle: bad arg cols_range");
    end
    
    r_low_range  = r_range(1);
    r_high_range = r_range(2);
    if(r_low_range >= r_high_range)
        error("In function daugmanCircle: bad arg r_range");
    end
    
    sum_of_circle = zeros((row_high_range-row_low_range)+1, ...
                          (col_high_range-col_low_range)+1, ...
                          (r_high_range-r_low_range)+1);
    
    
    for row = row_low_range:row_high_range
        for col = col_low_range:col_high_range
            for r = r_low_range:r_high_range
                for theta = 0:2*pi
                    
                    c_row = round(row + r*sin(theta));
                    if(c_row>img_rows || c_row < 1)
                        continue
                    end
                    
                    c_col = round(col + r*cos(theta));
                    if(c_col>img_cols || c_col < 1)
                        continue
                    end

                    
                    sum_of_circle(row-(row_low_range-1),col-(col_low_range-1),r-(r_low_range-1)) = sum_of_circle(row-(row_low_range-1),col-(col_low_range-1),r-(r_low_range-1)) + img(c_row,c_col);              
                end
                sum_of_circle(row-(row_low_range-1),col-(col_low_range-1),r-(r_low_range-1)) = sum_of_circle(row-(row_low_range-1),col-(col_low_range-1),r-(r_low_range-1)) /(2*pi*r);
            end
        end
    end
    
    
end

