function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
lf = (w'*xTr - yTr)*(w'*xTr - yTr)';
regulization = transpose(w)*w*lambda;%regulazation part
loss = lf + regulization; %loss function 
gradient = (2*transpose(w)*xTr*transpose(xTr)-2*yTr*transpose(xTr))' + 2*w*lambda; % its gradient
 

