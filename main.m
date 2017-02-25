
addpath('utils');
load('sounds.mat');

%% t
% t_list = [10 50 100 200];
% for t=t_list
%     U = sounds([1 3],1:t);
%     [n,t] = size(U);
%     A = rand(n,n);
%     [Y, W] = ica(U,A,50000,0.01);
%     plot_signals(U, Y, 1);
% end

%% distribution
for i=1:2
    for j=i+1:3
        U = sounds([i j],1:200);
        [n,t] = size(U);
        A = rand(n,n);
        [Y, W] = ica(U,A,50000,0.01);
        plot_signals(U, Y, 1);
        title(sprintf('%d %d',i,j));
        figure;
        plot(U(1,:),U(2,:),'.');
        U = norm_signals(U);
        cova = cov(U(1,:),U(2,:));
        title(sprintf('%d %d %f',i,j,cova(2,1)));
        [i j]
        cova
    end
end

%% m of A
% m_list = [1 3 5];
% for m=m_list
%     U = sounds(1:3,1:50);
%     [n,t] = size(U);
%     A = rand(m,n);
%     [Y, W] = ica(U,A,50000,0.01);
%     plot_signals(U, Y, 1);
%     title(sprintf('%d',m));
% end


%% all 5 signals, t = 1000
% U = sounds(1:5,1:1000);
% [n,t] = size(U);
% A = rand(n,n);
% [Y, W] = ica(U,A,100000,0.01);
% plot_signals(U(:,1:100), Y(:,1:100), 1);


% figure;
% U = norm_signals(U);
% colors = ['b','g','r','c','m','y','k'];
% for i=1:size(U,1)
%     plot(i+U(i,:),colors(i)); hold on;
% end
% hold off;
% 
% for i=1:size(U,1)
%     figure;
%     hist(U(i,:),20);
% end

% figure;plot(U(1,:),U(2,:),'.');
% figure;plot(U(1,:),U(3,:),'.');
% figure;plot(U(2,:),U(3,:),'.');