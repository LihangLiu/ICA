
% debug mode with icaTest.mat
addpath('utils');

% %% icaTest.mat
% load('icaTest.mat');
% size(A)
% size(U)
% [Y, W] = ica(U,A,20000,0.01);
% plot_signals(U, Y);


%% sounds.mat
load('sounds.mat');
U = sounds(3:5,1:50);
[n,t] = size(U);
A = rand(n,n);
[Y, W] = ica(U,A,100000,0.01);
plot_signals(U, Y);