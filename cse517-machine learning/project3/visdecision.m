function visdecision(X,Y,fun,varargin)
%    function visdecision(X,Y,fun,varargin)
%
% INPUT:  
% X : dxn input vectors
% Y : 1xn input labels
% fun : a classifier function that maps inputs to predictions
% 
% OPTIONS:
% use 'vismargin' true or false (default false) to switch on displaying the unit 1 margin.
%
% Plots the decision boundary of classifier 'fun' within the -5:5 area of the 2d input space
%

pars.w=[];
pars.viscolor=0;
pars.vismargin=false; % show margin
pars.res=300;
pars=extractpars(varargin,pars);

cla;

symbols = {'o','x'};
classvals = [-1 1];
xrange = linspace(-5, 5,pars.res);
yrange = linspace(-5,5,pars.res);
[pixelX pixelY] = meshgrid(xrange, yrange);
testPoints = [pixelX(:)'; pixelY(:)'];
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
    hs=surf(pixelX,pixelY,Z,'Edgealpha',0,'linestyle','none','markeredgecolor','none');
    keyboard;
    set(hs,'ZData',get(hs,'CData')-max(max(Z))-1);
    view(2)
    hold on;
    colorbar;
end;
    [~,hc1]=contour(pixelX,pixelY,sign(Z),'LineWidth',1,'linecolor','black');
    if pars.vismargin,
    hold on;
    [~,hc2]=contour(pixelX,pixelY,sign(Z+1),'Linewidth',1,'linecolor','white');
    [~,hc3]=contour(pixelX,pixelY,sign(Z-1),'Linewidth',1,'linecolor','white');
    end;

hold on;
for c = 1:2
    idx = find(Y==classvals(c));
    hp=plot(X(1,idx), X(2,idx), symbols{c}, 'Color','black','LineWidth',2,'markersize',5);
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


	