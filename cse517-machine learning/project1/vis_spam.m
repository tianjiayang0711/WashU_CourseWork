function vis_spam

%% load labels (Y)
load('data_train');
valsplit
[label,paths]=textread('data/data_train/index','%s %s');
Y=cellfun(@(x) isequal(x,'spam')*2-1,label,'UniformOutput',true)';    
clear('label');


[d,n]=size(xTr);
load w0
%%
ind=length(yTr);
correct=[];
for i=1:length(yTv)    
    p=linearmodel(w,xTv(:,i));
    if p>0,pred='SPAM';else pred='GOOD';end;
    if yTv(i)==1,truth='SPAM';else truth='GOOD';end;
    if yTv(i)~=sign(p),
      correct=[correct 0];            
	    fprintf('Wrong: %s TRUTH: %s \n',pred,truth);
	    fprintf('Accuracy %2.2f\n',sum(correct)/length(correct)*100.0);
      web(['file:///' pwd '/data/data_train/' paths{ind+i}]);        
	  pause;
	else 
      correct=[correct 1];
	    fprintf('Correct: %s TRUTH: %s \n',pred,truth);
	end;
end;
