function [r, ok ,s]=example_tests()
% function [r, ok, s]=example_tests()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive.
%
% Output:
% r= The number of tests that failed
% ok= The number of tests that passed
% s= statement describing the failed test (s={} if all succeed)
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
ok=0;
s={};

% load in name data
[xTr,yTr]=genTrainFeatures();
fprintf('Starting Test 1\n');
try
    % Test 1: check if probabilities sum to 1
    [pos,neg] = naivebayesPY(xTr,yTr);
    failtest = norm(pos+neg-1)>1e-08;
    addon='';
catch
    failtest = true;
    addon = lasterr();
end;
if failtest,
    r = r+1;
    s{length(s)+1}=['Failed Test 1 naivebayesPY: Probabilities of P(Y) do not sum to 1.' addon];
else,
    ok=ok+1;
end;
fprintf('Completed Test 1\n');

y=[-1 1];
x=[0 1
   1 0];

failtest = false;
fprintf('Starting Test 2\n');
try

    % Test 2: Test the Naive Bayes function on a simple matrix
    [pos,neg] = naivebayesPY(x,y);
    pos0 = 0.5;
    neg0 = 0.5;
    if (pos ~= pos0) or (neg ~= neg0),
        failtest = true;
    end;
    addon = '';
catch
    failtest = true;
    addon = lasterr();
end;
if failtest,
    r = r + 1;
    s{length(s)+1}=['Failed Test 2 naivebayesPXY: The calculation of P(Y) seems incorrect.' addon];
else,
    ok=ok+1;
end;
fprintf('Completed Test 2\n');


failtest = false;
fprintf('Starting Test 3\n');
pospossi0 = [0.66667;0.33333];
negpossi0 = [0.33333;0.66667];
try
    % Test 3 calculate conditional probabilities
    [pospossi,negpossi] = naivebayesPXY(x,y);
    addon = '';
    if (norm(pospossi - pospossi0) > 1e-03) or (norm(negpossi - negpossi0) > 1e-03),
        failtest = true;
    end;
catch
    failtest = true;
    addon = lasterr();
end;
if failtest,
    r = r+1;
    s{length(s)+1}=['Failed Test 3: The calculation of P(X|Y) seems incorrect.' addon];
else,
    ok=ok+1;
end;
fprintf('Finished Test 3\n');

%Tests 4~8 are testing about the naivebayesPXY function.
%Some are sanity tests that the function is returning reasonable answers.
%Some are making sure they are correct on small cases

%Tests 9 is on naivebayes

%Tests 10 is on naivebayesCL


percentage=ok/(r+ok)*100;
