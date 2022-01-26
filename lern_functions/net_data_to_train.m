function [in,out] = net_data_to_train()
    %works only witch original file lern.jpg
    clear;
    clc;
    leters={};
    files=["lern01.png","lern02.png","lern03.png","lern04.png"];
    load '01.txt';load '02.txt';load '03.txt';load '04.txt';
    nums=[X01,X02,X03,X04,X03,X03,X03,X04];
    for file=files
        im=mbinarize(imread(file));
        lines=separate_lines(im);
        for l=lines
            leters=[leters,separate_letters(l{1})];
        end
    end
    n=length(leters);
    out=zeros(87,n);
    todel=[];
    for i=1:n
        out(nums(i),i)=1;
        if nums(i)==87
            todel=[todel,i];
        end
    end

    for t=todel
        leters(t)=[];
        out(:,t)=[];
    end
    out(87,:)=[];
    
%%%%%%%%%%%%%%%%%%%%%%%%%

%     for i=1:n
%         subplot(4,floor(n/4)+1,i);
%         imshow(leters{i});
%     end
    n=length(leters);
%     a=leters{1,69};
%     leters{1,69}=leters{1,70};
%     leters{1,70}=a;
    
    for i=1:n
        leters{i}=img2array_plus_wsp(leters{i});
    end
    in=cell2mat(leters);

%     a=eye(27);
%     b=zeros(27,1);
%     b(26,1)=1;
%     c=zeros(27,1);
%     c(13,1)=1;
%     a=[a(:,1:9),b,c,a(:,10:11),b,a(:,12:end)];
%     out=repmat(a,[1,n/30]);
% 
%     out=[];
%     id=[1:8,26,11,9,26,10:27];
%     in2=in;
%     in=[];
    
%     for i=1:30
%         a=in2(:,i:30:end)';
%         m=mean(a);
%         s=std(a);
%         ao= abs(a-m)./s;
%         ao=ao'>2;
%         ao = sum(ao,[]);
%         ao=ao>5;
%         a(ao,:)=[];
%         n=size(a);
%         n=n(1);
%         in=[in;a];
%         o=zeros(1,27);
%         o(id(i))=1;
%         out=[out;repmat(o,[n,1])];
%     end
%     in=in';
%     out=out';
end
