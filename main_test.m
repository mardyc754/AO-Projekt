clear;
clc;
im=mbinarize(imread('t1.jpg'));
leters=separate_lines_letters(im);
p1=1;
n=size(leters);
n=n(2);
for i=1:n
    subplot(6,floor(n/5),i);
    imshow(leters{i});

end