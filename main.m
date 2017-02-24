

figure;
U = norm_signals(U);
colors = ['b','g','r','c','m','y','k'];
for i=1:size(U,1)
    plot(i+U(i,:),colors(i)); hold on;
end
hold off;

for i=1:size(U,1)
    figure;
    hist(U(i,:),20);
end