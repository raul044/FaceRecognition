function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  M = double(rgb2gray(imread(image_path)));
  M = M';
  row = M(:);
  
  this_A = row - m';
  this_primg = eigenfaces' * this_A;
  
  min_dist = norm(pr_img(:, 1) - this_primg);
  output_img_index = 1;
  for i = 2:length(pr_img)
    if min_dist > norm(pr_img(:, i) - this_primg)
      min_dist = norm(pr_img(:, i) - this_primg);
      output_img_index = i;
    endif
  endfor
  
endfunction
