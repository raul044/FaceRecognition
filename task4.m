function [A_k, S] = task4(image, k)
  A = double(imread(image));
  [n m] = size(A);
  for i = 1:n
    row_sum = 0;
    for j = 1:m
      row_sum += A(i, j);
    endfor
    u(i) = row_sum/m; 
    A(i, :) -= u(i);
  endfor
  Z = (A*A')/(n-1);
  [vz sz] = eig(Z);
  S = sz;
  
  W(:, 1:k) = vz(:, n-k+1:n);
  Y = W'*A;
  A_k = W*Y;
  for i = 1:n
    A_k(i, :) += u(i);
  endfor
endfunction