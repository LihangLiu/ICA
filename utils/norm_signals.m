function [ X ] = norm_signals( X )
% X: (n,t)
% scale to [-0.5,0.5]

    for i=1:size(X,1)
        X_sub = X(i,:);
        minx = min(X_sub);
        maxx = max(X_sub);
        X(i,:) = (X_sub-minx)/(maxx-minx)-0.5;
    end    

end

