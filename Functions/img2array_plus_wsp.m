function wsp_ar = img2array_plus_wsp(letter)

letter2=imresize(letter,[70,50]);
for i=1:7
    for j=1:5
        a=sum(letter2((i*10-9:i*10),(j*10-9:j*10)));
        wsp_ar((i-1)*5+j)=sum(a);
    end
end

wsp_ar=((100-wsp_ar)/100);
wsp_ar=wsp_ar';

fun={@AO5RBlairBliss,@AO5RCircularityL,@AO5RCircularityS,@AO5RDanielsson,@AO5RFeret,@AO5RHaralick,@AO5RMalinowska,@AO5RShape};
M=zeros(length(fun),1);

for j = 1:length(fun)
        M(j,1)=fun{j}(letter2);
end
hp=size(letter);
hp=hp(1)/hp(2);
wsp_ar=[wsp_ar;M;hp;1/hp];