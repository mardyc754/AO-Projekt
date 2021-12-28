clear;
clc;
% nn=create_and_save_neural_network;
load data.mat;
im=mbinarize(imread('t3.jpg'));
leters=separate_lines_letters(im); 
n=size(leters);
n=n(2);
leters=cellfun(@img2array_plus_wsp,leters,'UniformOutput',false);
l2=leters;
leters=nn(leters);
leters=cellfun(@array_to_letter ,leters,'UniformOutput',false);
leters=cell2mat(leters);

text=char(leters);
text=strrep(text,'.l','i');
text=strrep(text,'j.','j');
disp(text);

% text2='lorem.lpsumdolors.ltamet,consecteturad.lp.lsc.lngel.lt.et.lamtemporfermentumrhoncus..lnterdumetmalesuadafamesacante.lpsumpr.lm.ls.';
% text2=double(text2);
% 
% p=arrayfun(@(a,b)a==b,leters,text2);
% s=sum(p);
% disp(char(text2.*p));
% disp(char(text2));