function wsp = object_wsp(im)
    fun={@AO5RBlairBliss,@AO5RCircularityL,@AO5RCircularityS,@AO5RDanielsson,@AO5RFeret,@AO5RHaralick,@AO5RMalinowska,@AO5RShape};
    wsp=zeros([1,length(fun)]);
    for k = 1:length(fun)
        wsp(k)=fun{k}(im);
    end
end