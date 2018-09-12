function visdecision(trainPoints,trainLabels,fun,varargin)
%function visdecision(trainPoints,trainLabels,fun,varargin)
%
n=length(trainLabels);

pars.w=[];
pars.viscolor=0;
pars.vismargin=false; % show margin
pars.res=300;
pars.weights=[];
pars=extractpars(varargin,pars);

cla;

symbols = {'o','x'};
classvals = [-1 1];
xrange = linspace(-5, 5,pars.res);
yrange = linspace(-5,5,pars.res);
[pixelX pixelY] = meshgrid(xrange, yrange);
testPoints = [pixelX(:) pixelY(:)];
%testLabels=testPoints*w;
testLabels=fun(testPoints);
% Generate the plot
Z = reshape(testLabels, [pars.res pars.res]);
Z(1,1)=1;
if ~pars.viscolor,
    [~,hs]=contourf(pixelX, pixelY, sign(Z)-0.1);
    colormap([0.5 0.5 1; 1 0.5 0.5]);
    hold on;
else
    colormap jet;
    hs=surf(pixelX,pixelY,Z,'Edgealpha',0);
    set(hs,'CDataMode','manual','ZData',get(hs,'CData')-max(max(Z))-1);
    view(2)
    hold on;
    colorbar;
end;
    [~,hc1]=contour(pixelX,pixelY,sign(Z),'LineWidth',1,'Color','black');
    if pars.vismargin,
    hold on;
    [~,hc2]=contour(pixelX,pixelY,sign(Z+1),'Linewidth',1,'Color','white');
    [~,hc3]=contour(pixelX,pixelY,sign(Z-1),'Linewidth',1,'Color','white');
    end;

hold on;
for c = 1:2
    idx = find(trainLabels==classvals(c));
    hp=plot3(trainPoints(1,idx), trainPoints(2,idx), ones(length(idx),1)*max(max(Z))+1, symbols{c}, 'Color','black','LineWidth',2);
%     if isempty(pars.weights),
%       hp=plot3(trainPoints(idx,1), trainPoints(idx,2), ones(length(idx),1)*max(max(Z))+1, symbols{c}, 'Color','black','LineWidth',2);
%     else
%       for j=idx'
%             hps{j}=plot3(trainPoints(j,1), trainPoints(j,2), max(max(Z))+1, symbols{c}, 'Color','black','LineWidth',2,'MarkerSize',pars.weights(j)*500);          
%       end;
%     end;
%     hp=scatter3(trainPoints(idx,1),trainPoints(idx,2),ones(length(idx),1)*max(max(Z))+1,symbols{c},'LineWidth',2,'CData',[0,0,0],'SizeData',pars.weights)
    view(2);
end



if ~isempty(pars.w)
 w=pars.w;
 a=-w(3)/(w(1:2)'*w(1:2));
 hq=quiver(w(1)*a,w(2)*a,w(1),w(2),'LineWidth',2,'Color','red','AutoScale','off','AutoScaleFactor',1);
end;
 hold off;   box on;
 axis equal; grid on;
 axis tight;
ax=axis;
set(gca,'XTick',linspace(ax(1),ax(2),11));
set(gca,'YTick',linspace(ax(3),ax(4),11));


	