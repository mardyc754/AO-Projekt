function words = separate_words(im)
    w=size(im);
    w=w(2);
    s=1;
    s0=1;
    os=[];

    while s<w
        while s<w && max(im(:,s)) == 0
            s=s+1;
        end
        os=[os;0,s0,s-1];
        s0=s;

        while s<w && max(im(:,s)) == 1
            s=s+1;
        end
        os=[os;1,s0,s-1];
        s0=s;
    end
    
    ob=os(:,1)==1;
    ob=os(ob,2:3);
    ob=ob(:,2)-ob(:,1);
    m=mean(ob(1:end))/2;

    od=os(:,1)==0;
    od=os(od,2:3);
    od2=od(:,2)-od(:,1);
    od2=od2>m;
    od=od(od2,:);
    od=[od(1:end-1,2),od(2:end,1)];
    n=size(od);
    n=n(1);
    words=cell(1,n);
    for i=1:n
        words{i}=im(:,od(i,1):od(i,2));
    end
end