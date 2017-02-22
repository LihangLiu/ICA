
% debug mode with icaTest.mat
addpath('utils');

%% Get data, A:(3,3), U(3,40), m>n
load('icaTest.mat');
[m,n] = size(A);
[n,t] = size(U);
% plot_signals(U);
% title('source');

%% Mix the data, X:(3,40)
X = A*U;    % (m,t)
% plot_signals(X);
% title('mixed');

%% from X calculate W

% init W
W = rand(n,m)/10;
% gradient descent
thres = 0.000001;
for i=1:200000
    % estimate
    Y = W*X;
    Z = arrayfun(@func_g,Y);
    eta = 0.01;
    I = eye(n);
    delta_W = (I+(1-2*Z)*Y')*W;
    W = W + eta*delta_W;
    if mod(i,5000)==1
        plot_signals(U,Y);
    end
    if std(delta_W(:)) < thres
        break;
    end
end
plot_signals(U, Y);







