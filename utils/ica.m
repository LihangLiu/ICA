function [ Y, W ] = ica( U, A, R_max, eta)
% U: (n, t), original signal
% A: (m, n),
% W: (n, m)
% Y = W*X => U

    [m,n] = size(A);
    [n,t] = size(U);

    %% Mix the data
    X = A*U;    % (m,t)
    % plot_signals(X);
    % title('mixed');

    %% from X calculate W

    % init W
    W = rand(n,m)/10;
    % gradient descent
    for i=1:R_max
        % estimate
        Y = W*X;
        Z = arrayfun(@func_g,Y);
        I = eye(n);
        delta_W = (I+(1-2*Z)*Y')*W;
        W = W + eta*delta_W;
        if mod(i,10000)==1
%             eta*exp(-i*0.00001)
            plot_signals(U,Y);
        end
    end
    plot_signals(U, Y);

end

