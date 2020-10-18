function task5(image)
  A = double(imread(image));
  %graph1
  [A_k, S] = task3(image, 1);
  for i = 1:min(size(S))
    eig_val(i) = S(i, i); 
  endfor
  figure(1);
  plot(eig_val);
  
  %graph2
  sum_max = 0;
  for i = 1:min(size(S))
    sum_max += S(i, i);
  endfor
  
  for k = 1:19
    sum_k = 0;
    for i = 1:k
      sum_k += S(i, i);
    endfor
    f2(k) = sum_k/sum_max;
    
    %graph3
    [A_k, S] = task3(image, k);
    [n m] = size(A_k);
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
