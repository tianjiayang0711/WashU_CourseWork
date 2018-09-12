function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
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
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%
% 
[d,n]=size(xTr);
c_size = length(Cs);
p_size = length(paras);
k=10;
% val_prop = 1/10;
% val_size = round(val_prop*n);
indices=crossvalind('Kfold',xTr(d,1:n),10);
allvalerrs_temp=zeros(c_size,p_size,k);
for ite = 1:k
    %% Split off validation data set. 
    test = (indices == k);
    train = ~test;
    train_data = xTr(:,train);
    train_label = yTr(:,train);
    test_data=xTr(:,test);
    test_target=yTr(:,test);

    %% Evaluate all parameter settings
    for i = 1:c_size
       for j = 1:p_size
           [svm,~,~]    = trainsvm(train_data,train_label, Cs(i),ktype,paras(j));
           allvalerrs_temp(i,j,ite) = sum(sign(svm(test_data))~=test_target')/length(test_target);
       end
    end
end
%% Find best parameter through comparing the averages of all crossvalidate errors
allvalerrs=mean(allvalerrs_temp,3);
bestval=min(min(allvalerrs));
[c_index,p_index] = find(allvalerrs==bestval);
bestC=c_index(1);
bestP=p_index(1);

end
    
    
