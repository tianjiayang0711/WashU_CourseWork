function [tr,gtr]=transcheck(x,trans);

[sig,gsic]=get_transition_func(trans);
tr=sig(x);
gtr=gsic(x);