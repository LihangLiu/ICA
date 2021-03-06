function [ U, min_Y ] = align_signals( U, Y )
% X: (n,t)
% Y: (n,t)

   [n,t] = size(U);
   
   min_Y = Y;
   min_diff = 100000;
   min_order = 0;
   
   order_list = perms(1:n);
   for i=1:size(order_list,1)
        order = order_list(i,:);
        c_Y = Y(order,:);
        sum_diff = 0;
        for j=1:n
            [c_diff,sign] = VecDiff(U(j,:), c_Y(j,:));
            c_Y(j,:) = sign*c_Y(j,:);
            sum_diff = sum_diff+c_diff;
        end
        if min_diff > sum_diff
            min_diff = sum_diff;
            min_Y = c_Y;
            min_order = order;
        end
   end
   min_diff/n
   min_order
   
%    diff_mat = zeros(n,n);
%    order = zeros(n,1);
%    for i=1:n
%        min_diff = 100000;
%        for j=1:n
%            [c_diff,sign] = VecDiff(U(i,:), Y(j,:));
%            diff_mat(i,j) = c_diff;
%            if c_diff < min_diff
%                new_Y(i,:) = sign*Y(j,:);
%                min_diff = c_diff;
%                order(i) = j;
%            end
%        end
%    end
%    order
%    diff_mat
   
end

function [diff,sign] = VecDiff(v1, v2)
    if std(v1(:)-v2(:)) < std(v1(:)+v2(:))
        sign = 1;
    else
        sign = -1;
    end
    diff = min(std(v1(:)-v2(:)), std(v1(:)+v2(:)));
end
