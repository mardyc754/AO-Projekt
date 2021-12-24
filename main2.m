clear;
clc;
load data.mat;
im=mbinarize(imread('t1.jpg'));
leters=separate_lines_letters(im); 
n=size(leters);
n=n(2);
leters=cellfun(@img_resize,leters,'UniformOutput',false);
leters=nn(leters);
leters=cellfun(@array_to_letter ,leters,'UniformOutput',false);
leters=cell2mat(leters);

% text=char(leters);
% disp(text);

text2='lorem.lpsumdolors.ltamet,consecteturad.lplsc.lngel.lt..integerconguequamqu.lsfauc.lbusveh.lcula.v.lvamuspret.lumpret.lumen.lm,conguehendrer.lt.';
text2=double(text2);

p=arrayfun(@(a,b)a==b,leters,text2);
sum(p);
disp(char(text2.*p));