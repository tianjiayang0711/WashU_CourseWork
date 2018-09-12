function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
%% fill in code here
%smoothing parameter l, initialize as 0
l = 0;
pos_count_alpha = sum((y==1).*x,2);
neg_count_alpha = sum((y==-1).*x,2);
pos_count_beta = sum((y==1).*sum(x,1),2);
neg_count_beta = sum((y==-1).*sum(x,1),2);
pos_upper = l + pos_count_alpha;
pos_lower = l*d + pos_count_beta;
neg_upper = l + neg_count_alpha;
neg_lower = l*d + neg_count_beta;
posprob = pos_upper/pos_lower;
negprob = neg_upper/neg_lower;

end
