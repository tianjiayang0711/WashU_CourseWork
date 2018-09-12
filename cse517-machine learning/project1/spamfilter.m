function [fpr,tpr,auc]=spamfilter(xTe,yTe,thresh);
%	function [fpr,tpr,auc]=spamfilter(xTe,yTe,thresh);
%	
% INPUT:
% xTe = dxn data matrix
% yTe = 1xn label matrix
% threshold = any prediction below this threshold is classified as ham
%
% OUTPUT:
% fpr = False positive rate
% tpr = True positive rate
% auc = Area under the ROC curve
%
	
[d,n]=size(xTe);

if exist('thresh')~=1,thresh=0.3;end;

% load weight vector w
load('w0','w');


% Now go through xTe one by one
fpr=0;tpr=0;allpreds=zeros(1,n);
for i=1:length(yTe)
	rawpred=0; % the raw prediction (real value)
	pred=1;  % setting prediction to 1 (either 1 or -1)
	email=xTe(:,i);
	truth=yTe(i);
	
	% Do prediction here:
	rawpred=linearmodel(w,email);
    pred=(rawpred>thresh)*2-1;
	
	%%
    if pred>0,	pstring='SPAM';else pstring='GOOD';end;
    if truth==1,tstring='SPAM';else tstring='GOOD';end;
    if yTe(i)~=pred,
	    %fprintf('Wrong: %s TRUTH: %s \n',pstring,tstring);
		if pred==1,fpr=fpr+1;end;

		% if you made a mistake, you have the chance to update w
		w=spamupdate(w,email,truth);
	else 
	    %fprintf('Correct: %s TRUTH: %s \n',pstring,tstring);
		if(sign(pred)==1),tpr=tpr+1;end;
	end;	
	allpreds(i)=rawpred;
end;

[a,b,auc]=area_under_roc_curve(yTe,allpreds);
tpr=tpr/sum(yTe==1);
fpr=fpr/sum(yTe==-1);
fprintf('\n\nFalse positive rate: %2.2f%%\n',fpr*100);
fprintf('True positive rate: %2.2f%%\n',tpr*100);
fprintf('AUC: %2.2f%%\n',auc*100);

