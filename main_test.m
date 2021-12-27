clear;
clc;
im=mbinarize(imread('lern.jpg'));
leters=separate_lines_letters(im); 
% n=size(leters);
% n=n(2);
[in,out]=net_data_to_train();

% subplot(1,2,1);
% a=in(:,69)';
% imshow(reshape(a,[8,10])');
% subplot(1,2,2);
% a=in(:,70)';
% imshow(reshape(a,[8,10])');

% subplot(1,1,1);
% a=img_resize(leters{69});
% imshow(a);

% for i=1:n
%     subplot(11,floor(n/10),i);
%     a=in(:,i);
%     imshow(reshape(a,[20,16]));
% end


nn=feedforwardnet(100);
nn.performFcn = 'sse';         
nn.trainParam.goal = 0.1;    
nn.trainParam.show = 20;      
nn.trainParam.epochs = 5000;  
nn.trainParam.mc = 0.95;
nn=train(nn,in,out);

a=nn(img_resize(leters{1,1}));
a=abs(1-a);
[M,I] = min(a);