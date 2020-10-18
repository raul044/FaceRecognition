function [A_k] = task1(image, k)
  A = double(imread(image));
  [n m] = size(A);
  [u, s, v] = svd(A);
  %for i = 1:m
   % for j = 1:k
  uk(1:n, 1:k) = u(1:n, 1:k);
  sk(1:k, 1:k) = s(1:k, 1:k);
  vk(1:m, 1:k) = v(1:m, 1:k);
  A_k = uk*sk*vk';
endfunction