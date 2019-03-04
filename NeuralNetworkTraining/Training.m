clc; 
clear all; 
close all

% Preparation
numTrainPercentage = 0.8;
parentFile = cd;
dsFile = cd;

imds = imageDatastore(dsFile,'IncludeSubfolders',true,'LabelSource','foldernames');
count = countEachLabel(imds);

% Set Up Training Options
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainPercentage,'randomize');

layers = [
    imageInputLayer([224 224 1])
    
    convolution2dLayer(11,32,'Padding','same')
    batchNormalizationLayer()
    reluLayer()
    averagePooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer()
    reluLayer()
    averagePooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer()
    reluLayer()
    averagePooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer()
    reluLayer()
    averagePooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer()
    reluLayer()
    averagePooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer()
    reluLayer()
    averagePooling2dLayer(2,'Stride',2)
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',1e-3, ...
    'L2Regularization',0.005, ...
    'MaxEpochs',100, ...  
    'ValidationData',imdsValidation, ...
    'ValidationPatience',Inf,...
    'MiniBatchSize',50, ...
    'Shuffle','every-epoch', ...
    'VerboseFrequency',2, ...
    'Plots','training-progress',...
    'ExecutionEnvironment','gpu');

% Train Network
[net,info] = trainNetwork(imdsTrain,layers,options);
save('net','net'); % this provides you with a 'net.mat' file you can then use to apply the model on new images
save('info','info');

% Compute Accuracy of Validation Set
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;
accuracy = sum(YPred == YValidation)/numel(YValidation);
