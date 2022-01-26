function letter3 = img2array_plus_wsp(letter)
    letter=imresize(letter,[160,112]);
    letter3=zeros(10,7);
    
    for i=1:10
        for j=1:7
            letter3(i,j)=sum(letter(i*16-15:i*16,j*16-15:j*16),'ALL');
        end
    end
    letter3=letter3/256;
    % imshow(letter3);
    letter3=imresize(letter3,[1,70]);
    
    letter3=((256-letter3)/256);
    % imshow(imresize(letter3,[10,7]));
    letter3=letter3';
    
    fun={@AO5RBlairBliss,@AO5RCircularityL,@AO5RCircularityS,@AO5RDanielsson,@AO5RFeret,@AO5RHaralick,@AO5RMalinowska,@AO5RShape};
    M=zeros(length(fun),1);
    
    for j = 1:length(fun)
            M(j,1)=fun{j}(letter);
    end
    hp=size(letter);
    hp=hp(1)/hp(2);
    letter3=[letter3;M;hp;1/hp];
end