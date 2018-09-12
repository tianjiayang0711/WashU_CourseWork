function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxn);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

if nargin<2
	Z=X;
end

%%YOUR CODE HERE
switch lower(kernel_type)
    case {'linear'}
        K = transpose(X) * Z;
    case {'rbf'}
        K = exp(-param * l2distance(X,Z));
    case {'poly'}
        K = (transpose(X) * Z + 1) .^ param;
    otherwise
        error('should be one of rbf/linear/poly')
end


  
    

