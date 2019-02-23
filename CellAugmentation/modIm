function [newIm] = modIm(Im)
%MODIM Summary of this function goes here
%   Detailed explanation goes here

%First Rotate - then translate (don't translate first or else the rotation
%will not be centered near the cell) also rotate before blobs else many
%blobs are lost

filtNum = 0.75;%smoothing parameter for gaussian filter
patchRadius = 20;%radius of boundary between the original image and the
%smoothed added image where the two are averaged
rotMod = rotateIm(Im,rand*360,filtNum,patchRadius);

Blobbound = 30;%Blobs will only appear within this many pixles from edge to
%avoid obscuring the cell itself

BlobMax = 0.3;%Specifies the maximum blob height (relative to pic intensity)

BlobStdMin = 5;%minimum blob diameter param
BlobStdMax = 9;%max blob diameter param.

BlobNumMax = 3;%max number of blobs added per image

%Add blob first so the boundary is correctly observed

cN = length(Im(1,:));
rN = length(Im(:,1));

[C,R] = meshgrid(linspace(1,cN,cN),linspace(1,rN,rN));

vert = le(C,Blobbound)+ge(C,cN-Blobbound+1);
horz = le(R,Blobbound)+ge(R,rN-Blobbound+1);

frame = logical(vert+horz);

Rvect = R(frame(:));
Cvect = C(frame(:));

BlobNum = randi(BlobNumMax+1)-1;
blobMod = rotMod;
for i = 1:BlobNum
    rPos = randi(length(Cvect));
    Centry = Cvect(rPos);
    Rentry = Rvect(rPos);
    blobMod = blobIm(blobMod,Centry,Rentry,rand*(BlobStdMax-BlobStdMin)+BlobStdMin,rand*BlobMax);
end

%now Translate

MaxTrans = 30;%Maximum number of pixels translated (can be +/-

filtNum = 0.5;%smoothing parameter for gaussian filter in patch
patchRadius = 3;%radius of boundary between the original image and the
%cropped added portions of the image (e.g. top row moved to bottom row) for
%smoothing
transMod = transIm(blobMod,randi(MaxTrans*2+1)-MaxTrans-1,randi(MaxTrans*2+1)-MaxTrans-1,filtNum,patchRadius);

newIm = transMod;

imagesc(newIm)

end


