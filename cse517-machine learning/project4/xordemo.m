%% setting global parameters
STEPSIZE=10;
figure(3);
clf;
subplot(1,2,1);
wst=[1 20 2];
rounds=20;
w=initweights(wst);
ITER=50;
TRANSNAME='ReLU2';


%% generate data
[x,y]=genxor();	
[xx,yy]=meshgrid(-1:0.1:1,-1:0.1:1);  
subplot(1,2,2);
hs=surf(xx,yy,zeros(size(xx)));
axis equal;
title(['Network Layers: ' num2str(wst)]);

%% initialize plots
subplot(1,2,1);
h=scatter(x(1,:),x(2,:),30,ones(size(y)),'filled')
axis equal;
set(h,'MarkerEdgecolor',[0.5 0.5 0.5])
box on;
colorbar;
drawnow;

%% do optimization
f=@(w) deepnet(w,x,y,wst);
for i=1:rounds
  [w,l]=minimize(w,'deepnet',ITER,x,y,wst,TRANSNAME);
 pred=deepnet(w,x,[],wst,TRANSNAME);
 set(h,'CData',pred)
 drawnow;
 ps=reshape(deepnet(w,[xx(:) yy(:)]',[],wst,TRANSNAME),length(xx),length(xx));
 set(hs,'ZData',ps);
 drawnow;
end;
	
	

