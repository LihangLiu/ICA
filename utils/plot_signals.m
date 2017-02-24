function plot_signals( U,Y,ifAlign )
% X: (n, t), original signal
% Y: (n,t), recovered signal
% scale to [-0.5,0.5]

    if nargin < 3
        ifAlign = 0;
    end

    [n,t] = size(U);
    if ifAlign
        % normlize 
        U = norm_signals(U);
        Y = norm_signals(Y);
        % align
        [U,Y] = align_signals(U,Y);       
        figure;
        for i=1:n
            subplot(n,1,i);
            plot(U(i,:),'b'); hold on;
            plot(Y(i,:),'r'); hold off;
        end
        diff = MatrixDiff(U,Y);
        title(sprintf('diff %f',diff));
    else
        % plot
        figure;
%         colors = ['b','g','r','c','m','y','k'];
        for i=1:n
            subplot(n,2,i*2-1);
            plot(U(i,:),'b');
            subplot(n,2,i*2);
            plot(Y(i,:),'r');
        end
    end

    
    
   

end

function diff = MatrixDiff(M1, M2)
    [n,t] = size(M1);
    diff = 0;
    for i=1:n
        diff = diff + std(M1(i,:)-M2(i,:));
    end
    diff = diff/n;
end