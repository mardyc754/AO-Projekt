clear;
clc;
wy=4;dl=1;spi=1;

im=double(imread('t1.jpg'))/255;
subplot(wy,dl,spi);spi=spi+1;
imshow(im);

im2=rgb2gray(1-im);
% subplot(wy,dl,spi);spi=spi+1;
% imshow(im2);

imb=imbinarize(im2,"adaptive");
imb=imclose(imb,ones(5));
subplot(wy,dl,spi);spi=spi+1;
imshow(imb);

% imp=bwmorph(imb,'shrink',inf);
% imp=imdilate(imp,ones(5));
% subplot(wy,dl,spi);spi=spi+1;
% imshow(imp);

% l=bwlabel(imb);
% subplot(wy,dl,spi);spi=spi+1;
% imshow(label2rgb(l));

[h,w]=size(imb);

a=1;
for i=a:h
    if max(imb(i,:)) == 1
        a=i;
        break;
    end
end

for i=a:h
    if max(imb(i,:)) == 0
        a=i;
        break;
    end
end

im3=imb(1:a,:);
subplot(wy,dl,spi);spi=spi+1;
imshow(im3);

l=bwlabel(im3);
n=max(l,[],'all');
prop= regionprops(im3,'all');

for j=1:n
    subplot(wy,n,(wy-1)*n-wy+1+spi);spi=spi+1;
    imshow(label2rgb(prop(j).Image));
end


