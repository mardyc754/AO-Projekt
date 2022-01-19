function text = im2text(im)
    load data/data_n.mat;
    addpath('Functions/');
    addpath('Functions/wspolczynniki/');
    text='';
    
    im=mbinarize(im); %imread(im));
    lines=separate_lines(im);
    lines=cellfun(@separate_words,lines,'UniformOutput',false);

    d = waitbar(0, 'Wykrywanie tekstu, proszę czekać...');
    
    for words=lines
        i = 0;
        w=cellfun(@separate_letters,words{1},'UniformOutput',false);
        waitbar(0.25, d, 'Wykrywanie tekstu, proszę czekać...');
        for leters=w
            l=cellfun(@img2array_plus_wsp,leters{1},'UniformOutput',false);
            l=nn(l);
            l=cellfun(@array_to_letter ,l,'UniformOutput',false);
            l=cell2mat(l);
            l=char(l);
            l=strrep(l,'.l','i');
            l=strrep(l,'j.','j');
            text= sprintf('%s%s ',text,l);
            i = i+1;
            waitbar(0.5, d, 'Wykrywanie tekstu, proszę czekać...');
        end
        waitbar(0.75, d, 'Wykrywanie tekstu, proszę czekać...');
        text= string(text);
    end
    
    waitbar(1, d, 'Wykrywanie tekstu, proszę czekać...');
    close(d)
end
