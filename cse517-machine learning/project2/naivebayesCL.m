function [w,b]=naivebayesCL(x,y);
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%

[d,n]=size(x);
%% fill in code here
[p_y_pos,p_y_neg] = naivebayesPY(x,y);
b = log(p_y_pos/p_y_neg);
[p_xy_pos,p_xy_neg] = naivebayesPXY(x,y);
w = log(p_xy_pos) - log(p_xy_neg);




