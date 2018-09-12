function [loss, gradient]=logistic(w,xTr,yTr,lambda)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
if nargin<4, lambda = 0;end

[ d, n ]=size(xTr);
gradient = 0;
loss_reg = lambda*transpose(w)*w;
loss= sum(log(1+exp((-1)*yTr.*(transpose(w)*xTr))),2) + loss_reg;

for i = 1:n
    grad_new = - (yTr(i)*xTr(:,i))./(1+exp(yTr(i)*(transpose(w)*xTr(:,i))));
    gradient = gradient + grad_new;
end
grad_reg =  2*lambda*w;
gradient = gradient + grad_reg;


