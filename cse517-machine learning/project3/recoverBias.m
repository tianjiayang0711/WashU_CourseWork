function bias=recoverBias(K,yTr,alphas,C);
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : nx1 input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%
% YOUR CODE 

stable_alpha = abs(alphas-C/2);% find the furtherst from C and 0
a_index = find(stable_alpha == min(stable_alpha));
bias = 1/yTr(a_index) - sum(yTr.*alphas.*K(:,a_index));

