function lett = img_resize(bw2)

lett = imresize(bw2,[10,8]);
lett = reshape(lett,[10*8,1]);