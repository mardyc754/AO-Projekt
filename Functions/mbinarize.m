function imb = mbinarize(im)
    im=double(im)/255;
    im=rgb2gray(1-im);
    im=imbinarize(im,"adaptive");
    imb=imclose(im,ones(5));
end