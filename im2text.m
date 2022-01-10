function text = im2text(im)
    load data/data.mat;
    addpath('Functions/');
    addpath('Functions/wspolczynniki/');
    text='';
    
    im=mbinarize(imread(im));
    lines=separate_lines(im);
    lines=cellfun(@separate_words,lines,'UniformOutput',false);
    for words=lines
        w=cellfun(@separate_letters,words{1},'UniformOutput',false);
        for leters=w
            l=cellfun(@img2array_plus_wsp,leters{1},'UniformOutput',false);
            l=nn(l);
            l=cellfun(@array_to_letter ,l,'UniformOutput',false);
            l=cell2mat(l);
            l=char(l);
            l=strrep(l,'.l','i');
            l=strrep(l,'j.','j');
            text= sprintf('%s%s ',text,l);
        end
        text= string(text);
    end
end
