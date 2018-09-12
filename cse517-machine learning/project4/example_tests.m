function [r,ok,s]=example_tests()
%
% Tests the functions from homework assignment
% Please make sure that the error statements are instructive.
%
% Output:
% r=0 number of tests that broke
% ok=0 number of tests that passed
% s= statement describing the failed test (s={} if all succeed)
%

% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
ok=0;
s={};
load boston;
wst=[1 12 size(xTr,1)];
w=initweights(wst);


fprintf('Starting Test 1\n');
try
    addon='';
    [xTr,~,u,m]=preprocess(xTr,xTe);
    failtest = int8(sum(svd(cov(xTr')))) ~= size(xTr,1);
catch
    failtest = true;
    addon=lasterr();
end
if failtest,
    r=r+1;
    s{length(s)+1}=['incorrect preprocessing' addon];
else
    ok=ok+1;
end;
fprintf('Completed Test 1\n');

fprintf('Starting Test 2\n');
try
    graderr=checkgrad('deepnet',w,1e-05,xTr,yTr,wst);
    failtest= graderr> 1e-2;
    addon='';
catch
    failtest = true;
    addon=lasterr();
end
if failtest,
    r=r+1;
    s{length(s)+1}=['deepnet.m does not pass checkgrad.' addon];
else
    ok=ok+1;
end;
fprintf('Completed Test 2\n');
% test forward pass
% test compute loss
yTr = [0,0,1,1,0];
zs{1} = [.2, .2, 1.2, 1.2, .2];
fprintf('Starting Test 3\n');
try
    loss = compute_loss(zs, yTr);
    failtest = abs(loss - 0.02) > 1e-2;
    addon='';
catch
    failtest = true;
    addon=lasterr();
end
if failtest,
    r=r+1;
    s{length(s)+1}=['Incorrect loss computed' addon];
else
    ok=ok+1;
end;
% test compute gradient
fprintf('Completed Test 3\n');
end
