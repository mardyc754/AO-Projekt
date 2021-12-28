function leters = separate_letters(im)
    n=max(bwlabel(im),[],'all');
    leters=cell(1,n);
    prop= regionprops(im,'all');
    for i=1:n
        leters{i}=prop(i).Image;
    end
end