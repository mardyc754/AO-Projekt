function leters = separate_lines_letters(im)
    h=size(im);
    h=h(1);
    n=max(bwlabel(im),[],'all');
    leters=cell(1,n);
    spliter=1;
    spliter0=1;
    ns=0;
    while spliter<h
        while spliter<h
            if max(im(spliter,:)) == 1
                break;
            end
            spliter=spliter+1;
        end

        while spliter<h
            if max(im(spliter,:)) == 0
                break;
            end
            spliter=spliter+1;
        end
        if spliter~=h
            im2=im(spliter0:spliter,:);
            n=max(bwlabel(im2),[],'all');
            prop= regionprops(im2,'all');
            for i=1:n
                leters{ns+i}=prop(i).Image;
            end
                ns=ns+n;
                spliter0=spliter;
        end
    end
end