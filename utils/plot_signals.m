function plot_signals( U,Y )
% X: (n, t), original signal
% Y: (n,t), recovered signal
% scale to [-0.5,0.5]

    [n,t] = size(U);
    % normlize 
    U = norm_signals(U);
    Y = norm_signals(Y);
    % align
    [U,Y] = align_signals(U,Y);
    
    % plot
    figure;
    colors = ['b','g','r','c','m','y','k'];
%     for i=1:n
%         subplot(n,2,i*2-1);
%         plot(X(i,:), colors(i));
%         subplot(n,2,i*2);
%         plot(Y(i,:),colors(i));
%     end
   
    for i=1:n
        subplot(n,1,i);
        plot(U(i,:), 'r'); hold on;
        plot(Y(i,:),'b'); hold off;
    end
    diff = MatrixDiff(U,Y);
    title(sprintf('diff %f',diff));
    diff
end

function diff = MatrixDiff(M1, M2)
    [n,t] = size(M1);
    diff = 0;
    for i=1:n
        diff = diff + std(M1(i,:)-M2(i,:));
    end
    diff = diff/n;
end