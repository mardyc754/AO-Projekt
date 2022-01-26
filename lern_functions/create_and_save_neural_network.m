% function nn = create_and_save_neural_network
[in,out]=net_data_to_train();

in=repmat(in,[1,10]);
out=repmat(out,[1,10]);

nn=feedforwardnet(100);
nn.performFcn = 'sse';         
nn.trainParam.goal = 0.01;      
nn.trainParam.epochs = 5000;
nn=train(nn,in,out);
clear in out;
save data/data_n;
% end