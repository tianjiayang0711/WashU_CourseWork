function [trans_func, trans_func_der] = get_transition_func(type)
%	Given the type, gets a specific transition function
%   INPUT
%   type 'sigmoid', 'tanh', 'ReLU'
%   OUTPUT
%   trans_func transition function (function)
%   trans_func_der derivative of the transition function (function)

switch type
    case 'sigmoid'
        trans_func=@(z) 1./(1 + exp(-z));
        trans_func_der=@(z) trans_func(z).*(1-trans_func(z));
    case 'ReLU2'
        trans_func=@(z) 0.5*max(z, 0).^2;  
        trans_func_der=@(z) (z>=0).*z;
    case 'tanh'
        trans_func=@(z) tanh(z);
        trans_func_der=@(z) (1 - (tanh(z)).^2);
    case 'ReLU'
        trans_func=@(z) max(z, 0);  
        trans_func_der=@(z) (z>=0);
end
end

