function [ loss] = compute_loss(zs, yTr)
% function [loss] = compute_loss(zs, yTr)
%
% INPUT:
% zs output of forward pass (cell array)
% yTr 1xn matrix (each entry is a label)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr, or the prediction of yTr is not passed on
%

delta=zs{1}-yTr;
n = size(yTr, 2);
loss=0;
% INSERT CODE HERE:

loss = 0.5*delta*transpose(delta)/n;
end
