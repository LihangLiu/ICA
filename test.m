
% debug mode with icaTest.mat
addpath('utils');

%% icaTest.mat
% load('icaTest.mat');
% % U(2,:) = 0.01*U(2,:);
% size(A)
% size(U)
% [Y, W] = ica(U,A,20000,0.01);
% plot_signals(U, Y, 1);


%% sounds.mat
load('sounds.mat');
U = sounds(1:5,1:1000);
% U(2,:) = 100*U(2,:);
% U = norm_signals(U);
[n,t] = size(U);
A = rand(n,n);
[Y, W] = ica(U,A,500000,0.01);
plot_signals(U, Y, 1);
