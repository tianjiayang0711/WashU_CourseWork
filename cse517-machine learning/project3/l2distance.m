function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

[d,n]=size(X);
if (nargin==1) % case when there is only one input (X)
	%% fill in code here
   D = l2distance(X,X);
else  % case when there are two inputs (X,Z)
    n=size(X,2);
    m=size(Z,2);
    S = repmat(transpose(dot(X,X)),1,m);
    R = repmat(dot(Z,Z),n,1);
	G = transpose(X)*Z;  
	D = S + R - 2*G;
    D(D<0) = 0;
	D = sqrt(D);
end





