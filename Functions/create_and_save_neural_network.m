function nn = create_and_save_neural_network
[in,out]=net_data_to_train();

nn=feedforwardnet(100);
nn.performFcn = 'sse';         
nn.trainParam.goal = 0.1;    
nn.trainParam.show = 20;      
nn.trainParam.epochs = 5000;  
nn.trainParam.mc = 0.95;
nn=train(nn,in,out);
clear in out;
save data/data;
end