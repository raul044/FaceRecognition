function[m A eigenfaces pr_img] = eigenface_core(database_path)
  for i = 1:10
    image_path = strcat(database_path,'/',int2str(i),'.jpg');
    M = double(rgb2gray(imread(image_path)));
    M = M';
    row = M(:);
    T(:, i) = row(:);
  endfor
  
  m = mean(T');
  
  A = T-m';
 [Vinit S] = eig(A'*A);
  it = 1;
  for i = 1:length(S)
    if S(i, i) > 1
      V(:, it) = Vinit(:, i);
      it++;
    endif
  endfor
  eigenfaces = A*V;
  
  pr_img = eigenfaces'*A;
  
endfunction