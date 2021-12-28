clear;
clc;
im=mbinarize(imread('t3.jpg'));
lines=separate_lines(im);
leters={};
for l=lines
    leters=[leters,separate_letters(l{1})];
end


% n=size(l);
% n=n(2);
% 
% for i=1:n
%     subplot(n,1,i);
%     imshow(l{i});
% end