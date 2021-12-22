clear;
clc;
im=mbinarize(imread('lern.jpg'));
leters=separate_lines_letters(im); 
n=size(leters);
n=n(2);
% for i=1:n
%     subplot(11,floor(n/10),i);
%     imshow(leters{i});
% end

[in,out]=net_data_to_train();

nn=feedforwardnet(100);
nn=train(nn,in,out);

a=nn(object_wsp(leters{1,1})');
a=abs(1-a);
[M,I] = min(a);