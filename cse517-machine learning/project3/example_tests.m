function [failed,ok,s]=example_tests()
% function [r,s]=example_tests()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive.
%
% Output:
% r=0 number of tests that broke
% s= statement describing the failed test (s={} if all succeed)
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
failed=0;
ok=0;
s={};
WeakEps=sqrt(eps)*100;

X=magic(3);
Z=magic(3)+1;

fprintf('Starting Test 1\n');
failtest = false;
% Test kernel function
try
		failtest=norm(diag(computeK('rbf',X,X,1))-ones(3,1))>WeakEps;
  	addon='';
catch
		failtest=true;
		addon=lasterr();
end;
if failtest,
    failed=failed+1;
	  s{length(s)+1}=['Failed Test 1: RBF kernel between two identical data sets should return diagonals of all-ones. ' addon];
else
		ok=ok+1;
end;
fprintf('Completed Test 1\n');

LK=[104    74    92
    74   122    74
    92    74   104];
% Test kernel function
fprintf('Starting Test 2\n');
failtest = false;
try
		failtest=norm(computeK('linear',X,Z,1)-LK)>WeakEps;
    addon='';
catch
		failtest=true;
		addon=lasterr();
end;
if failtest,
    failed=failed+1;
		s{length(s)+1}=['Failed Test 2: RBF kernel seems incorrect. ' addon];
else
		ok=ok+1;
end;
fprintf('Completed Test 2\n');

% Test kernel function
fprintf('Starting Test 3\n');
failtest = false;
try
		failtest=norm(computeK('poly',X,Z,0)-ones(3))>WeakEps;
    addon='';
catch
		failtest=true;
		addon=lasterr();
end;
if failtest,
    failed=failed+1;
		s{length(s)+1}=['Failed Test 3: Polynomial kernel with degree p=0 should return all-ones matrix. ' addon];
else
		ok=ok+1;
end;
fprintf('Completed Test 3\n');

% Test polynomial kernel
fprintf('Starting Test 4\n');
failtest = false;
try
		failtest=~all(all(computeK('poly',X,Z,1)-1==computeK('linear',X,Z,1)));
    addon='';
catch
		failtest=true;
		addon=lasterr();
end;
if failtest,
    failed=failed+1;
		s{length(s)+1}=['Failed Test 4: Polynomial kernel with degree p=1 should return linear kernel +1. ' addon];
else
	ok=ok+1;
end;
fprintf('Completed Test 4\n');

fprintf('Starting Test 5\n');
failtest = false;
try
		failtest=~all(all(computeK('poly',X,Z,3)==(computeK('linear',X,Z,1)+1).^3));
    addon='';
catch
		failtest=true;
		addon=lasterr();
end;
if failtest,
    failed=failed+1;
		s{length(s)+1}=['Failed Test 5: Polynomial kernel is incorrect. ' addon];
else
		ok=ok+1;
end;
fprintf('Completed Test 5\n');

X1=rand(10,100);
X2=rand(10,50);
fprintf('Starting Test 6\n');
failtest = false;
try
		K=computeK('rbf',X1,X2,2);
		failtest=~all(size(K)==[100,50]);
    addon='';
catch
		failtest=true;
		addon=lasterr();
end;
if failtest,
    failed=failed+1;
		s{length(s)+1}=['Failed Test 6: Dimensions of RBF kernel function not correct. ' addon];
else
		ok=ok+1;
end;
fprintf('Completed Test 6\n');
% generateQP test
%% Test 7 to Test 10 are testing generateQP function. You should first test whether the results make sense
%% Then you should use rand function to make your own test set

%% Test 11 to Test 13 are testing svmclassify function and trainsvm function
%% Similar to above, you should rand your dataset and test

%% Test 15 is pretty tricky and here it is
%recoverbias test
X= [
   0.364749   0.473995   0.959298   0.302708   0.714078;
   0.033050   0.484319   0.050217   0.940339   0.323916;
   0.844523   0.359966   0.930309   0.393887   0.317610;
   0.358836   0.970347   0.364393   0.787111   0.240089;
   0.099514   0.878076   0.446940   0.157827   0.223717; ];


K =[
   0.98602   0.92847   1.31246   0.77229   0.64781;
   0.92847   2.30140   1.55994   1.64305   1.03909;
   1.31246   1.55994   2.12079   1.06140   1.18423;
   0.77229   1.64305   1.06140   1.77547   0.87014;
   0.64781   1.03909   1.18423   0.87014   0.82340];
y =[-1;1; 1; 1; -1]';
alpha =[4.98878; 0.00000 ; 7.35341; 4.23333; 6.59796];
failtest = false;
try
		bias = recoverBias(K,y',alpha,10);
		failtest=(abs(bias - (-4.7272))>0.01);
    addon='';
catch
		failtest=true;
		addon=lasterr();
end;
if failtest,
    failed=failed+1;
		s{length(s)+1}=['Failed Test 15: bias incorrect' addon];
else
		ok=ok+1;
end;
