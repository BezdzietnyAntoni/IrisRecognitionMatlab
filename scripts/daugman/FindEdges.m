function [YYHI,YYVI,IEI] = FindEdges(IrisImage)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% 1. Design grd (gradient mask)
% 2. Make grdh and grdv
% 3. Filter image with grdh and grdv
% 4. Find the length of gradient (hi^2+vi^2)
  w1 = hamming(4);
  ww = w1*w1'; % check this!
  
  %grdh = [-1 -1-1 -1 -2 0 2 1 1 1 1];
  grdh = [-1 -1-1 -1 -1 0 1 1 1 1 1  ];
  %grdh = [-1 -1 -1 -2 -2 -4 -2 0 2 4 2 2 1 1 1 ];
  %grdh = [-1 -1 -1 -1 -1 -2 -2 0 2 2 1 1 1 1 1 ];
  
  grdv = grdh';
  Y = IrisImage;
  YY = filter2(ww/1,Y); %Y; 
  YYH = filter2(grdh,YY);
  YYV = filter2(grdv,YY);

IEI = sqrt(YYH.*YYH + YYV.*YYV);

YYHI = YYH;
YYVI = YYV;
end
