# CellTypeClassification
Kai Yao, Nash Rochman, Sean Sun*
(ssun@jhu.edu)

Our group utilize Deep Learning algorithms to classify different cell types or cells from different stages of cell differentitation, simply based on small-sized brightfield cell images acquired from everyday use benchtop microscope. Please refer to [bioRxiv] for detailed introduction of the project.

This repository contains codes for several parts for the proposed cell type / cell morphology classification pipeline, all files are able to be compiled under MATLAB 2017b/2018a/2018b (MathWorks Inc.):

I. Preparation

1. Cell Cropping
      Please run **FieldImageGrayScaling.m** first to scale all brightfield images in the specified folder to grayscale images with one single channel. Then you can run **CellCropping.m** which provides you with a simple UI interface for you to manually crop single cells out of the multi-cell frame.
      
2. Cell Normalization
      Please load the reference cell image **refIm.jpg** first (here we provided one reference cell image, but it can be any cell of your own choice). Next, run **QuanNorm.m** in the specified folder to quantile normalize each image file in the folder and modify the image to the normalized version.
      
3. Cell Augmentation 
      As an example of the usage of the augmentation functions and algorithms, please load **exDbl.mat** file first, and compile **ExampleRun.m** in the same folder. This will give you a feeling of how the rotation and translation, as well as random blobbing works in our package. Please also feel free to make use of any part of the codes in your own way.
      
II. Training
1. Neural Network Training

III. Application
1. Cell Type Classification
