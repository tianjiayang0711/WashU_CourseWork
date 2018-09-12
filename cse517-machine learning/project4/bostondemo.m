function bostondemo(wst);
load boston;
TRANSNAME='sigmoid';

ROUNDS=200;
ITER=50;
STEPSIZE=0.01;
if nargin<1,
 wst=[1 20 20 20 size(xTr,1)];
end;
disp(wst);


[xTr,xTe]=preprocess(xTr,xTe);

%% do training
w=initweights(wst);

figure(1);
clf
[iv,itr]=sort(yTr);
[iv,ite]=sort(yTe);

subplot(1,3,1);
plot(yTr(itr),'r-','LineWidth',5);
title('TRAIN');
hold on;
drawnow;
htr=plot(yTr(itr),'k.','Visible','off','linewidth',3);
subplot(1,3,2);
plot(yTe(ite),'r-','LineWidth',5);
title('TEST');
hold on;
drawnow;
hte=plot(yTe(ite),'k.','linewidth',3);
set(hte,'Visible','off');
set(htr,'Visible','off');

subplot(1,3,3);
herr=plot(zeros(4),'linewidth',3);
legend('train','test');

errTr=[];
errTe=[];

f=@(w) deepnet(w,xTr,yTr,wst,TRANSNAME);
for i=1:ROUNDS
 w=grdescent(f,w,STEPSIZE,ITER,1e-8);
 predTr=deepnet(w,xTr,[],wst,TRANSNAME);
 predTe=deepnet(w,xTe,[],wst,TRANSNAME);
 set(hte,'YData',predTe(ite),'Visible','on');
 set(htr,'YData',predTr(itr),'Visible','on'); 
 %subplot(1,3,3);
 errTr=[errTr sqrt(mean((predTr(:)-yTr(:)).^2))];
 errTe=[errTe sqrt(mean((predTe(:)-yTe(:)).^2))];
 %plot([errTr' errTe']);
 axis([0 ROUNDS 0 max(max(errTe),max(errTr))]);
 d={};
 set(herr(1),'YData',errTr, 'color', 'g');
 set(herr(2),'YData',errTe, 'color', 'b');
 title('RMSE Errors');
 drawnow;
end;

fprintf('Lowest train score: %2.4f\n',min(errTr));
fprintf('Lowest test score: %2.4f\n',min(errTe));
saveas(gcf,'bostondemo.png')

