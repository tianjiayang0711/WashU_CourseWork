function [bestC,bestP,bestval]=crossvalidateRandom(xTr,yTr,ktype,Cs,paras,n)
% function [bestC,bestP,bestval]=crossvalidateRandom(xTr,yTr,ktype,Cs,paras,n)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%



%% Split off validation data set
ii=randperm(length(yTr));
k=ceil(0.8*length(yTr));
xTe=xTr(:,k+1:end);
yTe=yTr(k+1:end);
xTr=xTr(:,1:k);
yTr=yTr(1:k);


bestval=inf;
%% Evaluate all parameter settings
for i=1:n
  C=Cs(1)+rand()*(Cs(end)-Cs(1));
  p=paras(1)+rand()*(paras(end)-paras(1))
  [svmclassify,sv_i,alphas]=trainsvm(xTr,yTr,2^C,ktype,2^p);
  err=sum(sign(svmclassify(xTe))~=yTe(:))/length(yTe)
  if err<bestval,
  	bestval=err;
  	bestP=p;
  	bestC=C;
  end;
end;




