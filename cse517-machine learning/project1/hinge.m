% delete preds
function [loss,gradient]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

loss = 0;
gradient = zeros(d,1);

for l_counter = 1:n
    loss_next = max(0,1-(yTr(l_counter)*(transpose(w)*xTr(:,l_counter))));
    loss = loss + loss_next;
end
loss_reg = lambda*(w*transpose(w));
loss = loss + loss_reg;


grad_reg = 2*lambda*w;
for g_counter = 1:n
    if max(1-(yTr(g_counter)*(transpose(w)*xTr(:,g_counter))),0) ~= 0
        gradient = gradient - yTr(g_counter)*xTr(:,g_counter);
    end
end
gradient = gradient + grad_reg ;


