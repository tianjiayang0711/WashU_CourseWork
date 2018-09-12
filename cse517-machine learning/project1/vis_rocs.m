function hw04rocs

addpath('data')
load('data_train');
valsplit;

MAXITER=100;
STEPSIZE=1e-01;
clf
set(gca,'FontSize',18);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
box on;
hold on;

%% Ridge Regression
[d,n]=size(xTr);
ws=grdescent(@(w) ridge(w,xTr,yTr,0.1),zeros(d,1),STEPSIZE,MAXITER);

preds=linearmodel(ws,xTv);
[fpr,tpr,sqauc] = area_under_roc_curve(yTv,preds);
plot(fpr,tpr,'b','LineWidth',4);
drawnow;
disp(sqauc);


%% Hinge Loss
[d,n]=size(xTr);
wh=grdescent(@(w) hinge(w,xTr,yTr,0.1),zeros(d,1),STEPSIZE,MAXITER);
preds=linearmodel(wh,xTv);
[fpr,tpr,hinauc]=area_under_roc_curve(yTv,preds);
plot(fpr,tpr,'g','LineWidth',4);
drawnow;

disp(hinauc);

%% Logistic Regression
[d,n]=size(xTr);
wl=grdescent(@(w) logistic(w,xTr,yTr),zeros(d,1),STEPSIZE,MAXITER);

preds=linearmodel(wl,xTv);
[fpr,tpr,logauc]=area_under_roc_curve(yTv,preds);
plot(fpr,tpr,'r','LineWidth',4);
drawnow;
disp(logauc);




fprintf('Hinge loss: Area under the curve: %2.2f\n',hinauc);
fprintf('Logistic loss: Area under the curve: %2.2f\n',logauc);
fprintf('Squared loss: Area under the curve: %2.2f\n',sqauc);
axis equal;axis tight;
legend('ridge','hinge','logistic');
