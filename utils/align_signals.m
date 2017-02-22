function [ U, new_Y ] = align_signals( U, Y )
% X: (n,t)
% Y: (n,t)

   [n,t] = size(U);
   new_Y = Y;
   diff_mat = zeros(n,n);
   for i=1:n
       min_diff = 100000;
       for j=1:n
           [c_diff,sign] = VecDiff(U(i,:), Y(j,:));
           diff_mat(i,j) = c_diff;
           if c_diff < min_diff
               new_Y(i,:) = sign*Y(j,:);
               min_diff = c_diff;
           end
       end
   end
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
