function logratio = naivebayes(x,y,x1)
% function logratio = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% logratio: log (P(Y = 1|X=x1)/P(Y=-1|X=x1))

[d,n] = size(x);
%% fill in code here

%Bayes Theroem :P(B|A) = P(A|B)*P(B) / P(A)
[p_y_pos,p_y_neg] = naivebayesPY(x,y);
[p_xy_pos,p_xy_neg] = naivebayesPXY(x,y);
p_x_pos = prod(p_xy_pos.^x1);
p_x_neg = prod(p_xy_neg.^x1);
p_x = p_y_pos*p_x_pos + p_y_neg*p_x_neg;
pos_prob = (p_xy_pos*p_x_pos) / p_x;
neg_prob = (p_xy_neg*p_x_neg) / p_x;
logratio = log(pos_prob/neg_prob);
