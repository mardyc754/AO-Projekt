function [in,out] = net_data_to_train()
    %works only witch original file lern.jpg
    im=mbinarize(imread('lern.jpg'));
    leters=separate_lines_letters(im); 
    n=size(leters);
    n=n(2);
    a=leters{1,69};
    leters{1,69}=leters{1,70};
    leters{1,70}=a;
    
    for i=1:n
        leters{1,i}=img2array_plus_wsp(leters{1,i});
    end
    in=cell2mat(leters);

%     a=eye(27);
%     b=zeros(27,1);
%     b(26,1)=1;
%     c=zeros(27,1);
%     c(13,1)=1;
%     a=[a(:,1:9),b,c,a(:,10:11),b,a(:,12:end)];
%     out=repmat(a,[1,n/30]);


    out=[];
    id=[1:8,26,11,9,26,10:27];
    in2=in;
    in=[];
    
    for i=1:30
        a=in2(:,i:30:end)';
        m=mean(a);
        s=std(a);
        ao= abs(a-m)./s;
        ao=ao'>2;
        ao = sum(ao,[]);
        ao=ao>5;
        a(ao,:)=[];
        n=size(a);
        n=n(1);
        in=[in;a];
        o=zeros(1,27);
        o(id(i))=1;
        out=[out;repmat(o,[n,1])];
    end
    in=in';
    out=out';
end
