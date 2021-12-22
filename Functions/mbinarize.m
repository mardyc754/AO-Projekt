function imb = mbinarize(im)
    im=double(im)/255;
    im=rgb2gray(1-im);
    imb=imbinarize(im);
%     imb=imclose(imb,ones(5));
end