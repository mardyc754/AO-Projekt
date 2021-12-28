clear;
clc;
% nn=create_and_save_neural_network;
load data.mat;
im=mbinarize(imread('lern.jpg'));
leters=separate_lines_letters(im); 
n=size(leters);
n=n(2);
leters=cellfun(@img2array_plus_wsp,leters,'UniformOutput',false);
l2=leters;
leters=nn(leters);
leters=cellfun(@array_to_letter ,leters,'UniformOutput',false);
leters=cell2mat(leters);

t='abcdefgh.lj.klmnopqrstuvwxyz.,';
t=double(t);
for i=1:30:270
    a=leters(i:i+29);
    p=arrayfun(@(a,b)a==b,a,t);
    disp(char(a));
    disp(char(a.*p));
    disp('-----------------');
end
