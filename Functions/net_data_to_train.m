function [in,out] = net_data_to_train()
    %works only witch original file lern.jpg
    im=mbinarize(imread('lern.jpg'));
    leters=separate_lines_letters(im); 
    n=size(leters);
    n=n(2);
    
    leters=reshape(leters,[30,10]);
    
    wsp=cell([30,10]);
    
    for i=1:30
        for j=1:10
        wsp{i,j}=object_wsp(leters{i,j});
        end
    end
    in=[];
    out=[];
    for i=1:30
        w=cell2mat(wsp(1,:)');
        m=mean(w);
        s=std(w);
        w2= abs(w-m)./s;
        w2=w2>3;
        w2 = max(w2,[],2);
        w(w2,:)=[];
        in=[in,w'];
        n=size(w);
        n=n(1);
        o=zeros([1,30]);
        o(i)=1;
        o=repmat(o(1:30),[n,1]);
        out=[out,o'];
    end
end
