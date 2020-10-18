function task2(image)
  A = double(imread(image));
  [n m] = size(A);
  
  %graph 1
  [u s v] = svd(A);
  l = min(n, m);
  for i = 1:l
    eig_val(i) = s(i, i); 
  endfor
  sort(eig_val, 'descend');
  figure(1);
  plot(eig_val);
  
  %graph2
  sum_max = 0;
  l = min(n, m);
  for i = 1:l
    sum_max += s(i, i);
  endfor
  
  for k = 1:19
    A_k = task1(image, k);
    [n m] = size(A_k);
    [uk sk vk] = svd(A_k);
    sum_k = 0;
    for i = 1:k
      sum_k += sk(i, i);
    endfor
    f2(k) = sum_k/sum_max;
    
    %graph3
    sum_err = 0;
    for i = 1:n
      for j = 1:m
        dif = A(i, j) - A_k(i, j);
        sum_err += dif*dif;
      endfor
    endfor
    f3(k) = sum_err/(m*n);
    %graph4
    f4(k) = (m*k+n*k+k)/(m*n);
  endfor
  figure(2);
  plot(f2);
  
  figure(3);
  plot(f3);
  
  figure(4);
  plot(f4);
endfunction