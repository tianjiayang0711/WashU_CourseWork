function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
if nargin<5,tolerance=1e-02;end

w = w0; %initialize weight vector as w0
loss_value = inf; %initialize loss function to a very large number
times = 1; % initialize iteration counter = 1

% as long as times < max iteration, do£º
while(times < maxiter)
    loss_temp = loss_value; % to store last iterate's loss value
    [loss_value,gradient] = func(w); %compute new values from new weight
    gnorm = norm(gradient);
    % I choose ad-hoc method:
    if loss_value >= loss_temp
        stepsize = stepsize*0.5;
    else 
        stepsize = stepsize*1.01;
    end
    %maybe I have arrived at a minimum?:
    
    w = w - gradient*stepsize;
    times = times + 1;
    if (gnorm < tolerance)
        break;
    end
end





