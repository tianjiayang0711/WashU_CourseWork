function whoareyou(w,b);
% function whoareyou(w,b);
% 
% A little interactive demo of your name classifier

if nargin<2, b=0;end;

	while true,
		name=input('Who are you>','s');
		if strcmp(name, 'byebye') == 1,
			break
		end;
		system(['echo ' name ' | python name2features.py > tempfeatures.csv' ]);
		x=load('tempfeatures.csv')';

		pred=classifyLinear(x,w,b);
		if pred>0,
			out=[name ', I am sure you are a nice girl.'];
		else,
			out=[name ', I am sure you are a nice boy.'];
		end;
		disp(out);
	end;