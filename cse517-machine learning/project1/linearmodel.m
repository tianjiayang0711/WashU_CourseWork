function [preds]=linearmodel(w,xTe)
% function w=linearmodel(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTe dxn matrix (each column is an input vector)
%
% OUTPUTS:
% 
% preds predictions
% 

[d,n]=size(xTe);
 preds = transpose(w) * xTe ;



