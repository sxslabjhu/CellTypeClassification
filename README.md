# CellTypeClassification
Kai Yao, Nash Rochman, Sean Sun*
(ssun@jhu.edu)

Institute for NanobioTechnology, Johns Hopkins University, Baltimore, MD, USA

<p align="center">
<img src="https://github.com/sxslabjhu/CellTypeClassification/blob/master/ClassificationFlow.png" alt="Workflow" width="80%"/>
</p>

Our group utilize Deep Learning algorithms (Convolutional Neural Networks) to classify different cell types or cells from different stages of cell differentitation, simply based on small-sized brightfield single cell images acquired from everyday use benchtop microscope. Please refer to [bioRxiv preprint](https://www.biorxiv.org/content/10.1101/533216v1) for detailed introduction of the project.

This repository contains codes for several parts of the proposed cell type / cell morphology classification pipeline, including data preparation and neural network model training and application. All files are able to be compiled under **MATLAB** 2017b and later versions (MathWorks Inc.):

## I. Data Preparation

1. Cell Cropping
      
      Please run ```FieldImageGrayScaling.m``` first to scale all brightfield images in the specified folder to grayscale images with one single color channel. Then you can run ```CellCropping.m``` which provides you with a simple UI interface in MATLAB figure window for manually cropping single cells out of multi-cell frames.
      
2. Cell Normalization

      Please load the reference cell image ```refIm.jpg``` first (here we provided one reference cell image, but it can be any cell of your own choice). Next, run ```QuanNorm.m``` in the specified folder to quantile-normalize each image file in the folder and modify the image file to the normalized version.
      
3. Cell Augmentation 

      As an example of the usage of the augmentation functions and algorithms, please load ```exDbl.mat``` file first and then compile ```ExampleRun.m``` in the same folder. This will give you a feeling of how the rotation and translation, as well as random blobbing work in our augmentation package. Please also feel free to make use of any part of the codes at your own discretion.
      
## II. Training & Application

<p align="center">
<img src="https://github.com/sxslabjhu/CellTypeClassification/blob/master/NetworkStructure.png" alt="CNN Structure" width="80%"/>
</p>

1. Neural Network Training
      
      Please place ```Training.m``` in the same folder as the two folders of different cell types to classify. Here we provided examples of two cell types in our work: HEK-293A (human embryonic kidney 293 cells) and HT1080 (fibrosarcoma cancer cell line), each cell type forms a folder with hundreds of single cell images of the cell type prepared with the above described experimental and computational procedure. Then you can run ```Training.m``` which starts the training process of the network with the training option and network structure designed in the code.
      
2. Cell Type Classification

      After the training you should get a file ```net.mat```, with which you can then test new single cell images of one of the two cell types to classify which cell type does the new cell belong to. Simply apply the command of ```classify(net,imdsTest)``` where ```net``` is our trained neural network model and ```imdsTest``` is the [imageDatastore](https://www.mathworks.com/help/matlab/ref/matlab.io.datastore.imagedatastore.html) for the test files of your choice.
      
      
Please refer to MATLAB documentation pages for descriptions and usages for built-in functions applied in the present work. 
