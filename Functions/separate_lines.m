function lines = separate_lines(im)
    h=size(im);
    h=h(1);
    lines={};
    spliter=1;
    spliter0=1;
    while spliter<h
        while spliter<h && max(im(spliter,:)) == 0
            spliter=spliter+1;
            spliter0=spliter;
        end

        while spliter<h && max(im(spliter,:)) == 1
            spliter=spliter+1;
        end

        if spliter~=h
            lines{end+1}=im(spliter0:spliter,:);
        end
    end
end