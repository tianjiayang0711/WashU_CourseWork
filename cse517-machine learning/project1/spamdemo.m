clear all;
addpath('data');
load data_train.mat;
trainspamfilter(X,Y);
pause
vis_spam