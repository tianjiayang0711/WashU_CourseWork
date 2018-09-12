function [x,y]=genTrainFeatures()
%function [x,y]=genTrainFeatures()
%
% This function calls the python script "name2features.py" 
% to convert names into feature vectors and loads in the training data. 
%
%
% Output: 
% x: n feature vectors of dimensionality d [d,n]
% y: n labels (+1 = girl, -1 = boy)

% convert girl names into feature vectors
system('cat girls.train | python name2features.py > girls.csv ')
system('cat boys.train | python name2features.py > boys.csv ')

%% load in girls
girls=load('girls.csv');
[n1,d1]=size(girls);
%% load in boys
boys=load('boys.csv');
[n2,d2]=size(boys);

assert(d1==d2);
x=[girls;boys]';
y=[ones(n1,1);-ones(n2,1)]';

%% shuffle data into random order
ii=randperm(length(y));
x=x(:,ii);
y=y(ii);



