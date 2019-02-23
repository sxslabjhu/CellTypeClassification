%For translations and rotations, we need to fill in the background with
%something that looks like the normal background - this is a three step
%process 1) initialize with normal random variables, 2) smooth them 3)
%patch them so the transition to the added region is smooth (since the
%entire image cannot be blurred or else the cell will also be blurred)

load('exDbl.mat');
theta = 54;%angle to rotate
filtNum = 0.75;%smoothing parameter for gaussian filter
patchRadius = 20;%radius of boundary between the original image and the
%smoothed added image where the two are averaged
rot1 = rotateIm(exDbl,theta,filtNum,patchRadius);

rowT = 30;%rows translated
colT = 24;%cols translated
filtNum = 0.5;%smoothing parameter for gaussian filter in patch
patchRadius = 3;%radius of boundary between the original image and the
%cropped added portions of the image (e.g. top row moved to bottom row) for
%smoothing
trans1 = transIm(exDbl,rowT,colT,filtNum,patchRadius);

%For adding noise we can just add an additional "blob matrix". These blobs
%are just sign functions mimicking impurities seen in the phase images

bCR = 20;%Row of blob center
bCC = 70;%Column of blob center
nSTD = 9;%blob diameter approx - std of applied norm pdf
maxCent = 0.3;%max blob height (relative to max of image - mean of image)

blob1 = blobIm(exDbl,bCR,bCC,nSTD,maxCent);

figure
subplot(2,2,1)
imagesc(exDbl)
caxis([0,200])
title('orig')

subplot(2,2,2)
caxis([0,200])
imagesc(rot1)
title('rotate')

subplot(2,2,3)
caxis([0,200])
imagesc(trans1)
title('translate')

subplot(2,2,4)
caxis([0,200])
imagesc(blob1)
title('add blob')
