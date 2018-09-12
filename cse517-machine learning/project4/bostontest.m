function [time_score, error_score] = bostondemo;

% This is how the autograder will evaluate your neural network.
% Your final time and error will then each be used to calculate a score.
% If you want to change the values of any variables, then load them into test_values.mat
% This function will not run as is because you don't have access to boston_secret.
% You may want to use the test values given to you as a validation set to choose parameters.
  
load boston;
load boston_secret;
load test_values;

if exist('TRANSNAME','var') ~= 1
TRANSNAME='sigmoid';
end

if exist('ROUNDS','var') ~= 1
ROUNDS=200;
end

if exist('ITER', 'var') ~= 1
ITER=50;
end

if exist('STEPSIZE', 'var') ~= 1
STEPSIZE=0.01;
end

if exist('wst', 'var') ~= 1
wst=[1 20 20 20 size(xTr,1)];
end

rng(56765,'twister');

tic

[xTr,xTe]=preprocess(xTr,xTe);

%% do training
w=initweights(wst);

err=[];

f=@(w) deepnet(w,xTr,yTr,wst,TRANSNAME);

for i=1:ROUNDS
 w=grdescent(f,w,STEPSIZE,ITER,1e-8);
 
 predTes=deepnet(w,xTe_secret,[],wst,TRANSNAME);

 err = [err sqrt(mean((predTes(:)-yTe_secret(:)).^2))];
end;

final_time = toc;
final_err = err(end);

disp(final_time);
disp(final_err);
