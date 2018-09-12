function [X, Y, AUC] = area_under_roc_curve(labels, scores)
    labels = labels';
    scores = scores';
    if length(labels) ~= length(scores)
        error ('Length of labels must be equal in order to compute area under ROC curve\n')
    end

    [~, ind] = sort(scores, 'descend');
    roc_y = labels(ind);
    X = cumsum(roc_y == -1)/sum(roc_y == -1);
    Y = cumsum(roc_y == 1)/sum(roc_y == 1);
    AUC = sum((X(2:length(roc_y),1) - X(1:length(roc_y)-1,1)).*Y(2:length(roc_y),1));
end

