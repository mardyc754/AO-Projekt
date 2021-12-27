function lett = img_resize(bw2)

bw_7050=imresize(bw2,[70,50]);
for cnt=1:7
    for cnt2=1:5
        Atemp=sum(bw_7050((cnt*10-9:cnt*10),(cnt2*10-9:cnt2*10)));
        lett((cnt-1)*5+cnt2)=sum(Atemp);
    end
end

lett=((100-lett)/100);
lett=lett';

fun={@AO5RBlairBliss,@AO5RCircularityL,@AO5RCircularityS,@AO5RDanielsson,@AO5RFeret,@AO5RHaralick,@AO5RMalinowska,@AO5RShape};
M=zeros(length(fun),1);

for j = 1:length(fun)
        M(j,1)=fun{j}(bw_7050);
end
lett=[lett;M];

% lett = imresize(bw2,[10,8]);
% lett = reshape(lett,[10*8,1]);