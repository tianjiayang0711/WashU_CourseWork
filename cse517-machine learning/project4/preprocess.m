function [xTr,xTe,u,m]=preprocess(xTr,xTe);
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data 
% xTe - pre-processed testing data
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%

% % 
trainmean = mean(xTr,2);
m = trainmean;
trainstd = std(xTr,0,2);
[dim1,traincols] = size(xTr);
u = diag(ones(dim1,1)./trainstd);
trainm = repmat(trainmean,1,traincols);
xTr = u*(xTr - trainm);
[~,testcols] = size(xTe);
testm = repmat(trainmean,1,testcols);
xTe = u*(xTe - testm);



end








