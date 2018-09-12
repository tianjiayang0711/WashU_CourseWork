function [r,ok,s]=example_tests()
% function [r,s]=example_tests()
%
% Tests for the SRM project. Some few example tests are implemented. 
% Some are only dewscribed in the comments. You will have to implement 
% those yourself. 
%
% Output: 
% r:    number of tests that broke
% ok:   number of passed tests
% s:    statement describing the failed test (s={} if all succeed)


    % Put in any seed below
    rng('default')
    rng(31415535);
    % initial outputs
    r=0;
    ok=0;
    s={};

    % data set
    N=50;
    D=5;
    x=[randn(D,N) randn(D,N)+2];
    y=[ones(1,N) -ones(1,N)];

    %% Test 1: testing gradient of logistic
    d=checkgrad('logistic',rand(D,1),1e-05,x,y);
    if d>1e-10
        r=r+1;				
        s{length(s)+1}='Test 1: Logistic function does not pass checkgrad.';
    else
        ok=ok+1;
    end

    %% Test 2: logistic sanity check #1
    % we will test logistic with an all zeros weight vector, a random datapoint 
    % and a random label in {-1,1}. The expected outcome is (very close to) log(2). 


    %% Test 3: logistic sanity check #2
    w=rand(5,1);
    if w'*x+log(exp(logistic(w,x(:,1),1))-1)>eps,
        r=r+1;				
        s{length(s)+1}='Test 3: Logistic function does not pass sanity check #2.';	
    else
        ok=ok+1;
    end

    %% Test 4: testing gradient of ridge
    d=checkgrad('ridge',rand(D, 1), 1e-05, x,y, 10);
    if d>1e-10
            r=r+1;
        s{length(s)+1}='Test 4: Ridge function does not pass checkgrad.';
    else
        ok=ok+1;
    end

    %% Test 5: testing gradient of hinge
    % we will test hinge using checkgrad on randomly generated x and y data 
    % initializing w with 1e-05 and lambda with 1e-05. The gradient is supposed
    % to be smaller than 5e-07.



    %% Test 6: checking gradient descent
    % we will check grdescent using the squared loss, randomly generated input
    % weights and stepsize=1e-05, maxiter=1000,and tolerance=1e-09. The
    % norm of the gradient at the optimal solution should be zero (< 1e-05).


    %% Tests 7-12: solutions of hinge, ridge, and logistic
    % we will compare the solutions (loss value and gradient) of hinge, 
    % ridge, and logistic to our implementation using x and y. 
    % Note that you cannot implement those tests. 
    
end

function [loss,gradient]=squaredloss(w,x,y)
    [d,n]=size(x);
    diff=(w'*x-y);
    gradient=2.*x*diff'./n;
    loss=mean(diff.^2);
end


