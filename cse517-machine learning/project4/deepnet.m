function [loss,gradient]=deepnet(Ws,xTr,yTr,wst,transname)
% function [loss,gradient]=deepnet(Ws,xTr,yTr,wst,transname)
%% reformat the data from one vector to a cell-array of matrices
entry=cumsum(wst(1:end-1).*wst(2:end)+wst(1:end-1)); 
if isempty(Ws), Ws=randn(entry(end),1)./100;end;
W={};
e=1;
for i=1:length(entry)
    W{i}=reshape(Ws(e:entry(i)),[wst(i),wst(i+1)+1]);
    e=entry(i)+1;
end;

if nargin<5,transname='sigmoid';end;

%% define transition functions and gradient
[trans_func, trans_func_der] = get_transition_func(transname);

%% compute forward pass, loss, and gradient
[as,zs] = forward_pass(W, xTr, trans_func);
if isempty(yTr),
    loss=zs{1};
    return;
end;
    
loss = compute_loss(zs, yTr);
gradientCell = backprop(W, as,zs, yTr, trans_func_der);

%% reformat the gradient from a cell-array of matrices to one vector
gradient = zeros(entry(end),1);
e=1;
for i=1:length(entry)
    gradient(e:entry(i))=gradientCell{i}(:); 
    e=entry(i)+1;
end


