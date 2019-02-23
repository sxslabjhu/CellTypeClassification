function [newIm] = transIm(img,rowT,colT,filtNum,Br)
%ROTATEIM Summary of this function goes here
%   Detailed explanation goes here

R = length(img(:,1));
C = length(img(1,:));

fillIm = 0*img;
mask = 0*img+1;
mask1 = mask;
if ge(rowT,0)
    fillIm(1:R-rowT,:) = img(rowT+1:end,:);
    mask1(1:R-rowT,:) = 0;
    fillIm(R-rowT+1:end,:) = img(1:rowT,:);
else
    fillIm(-rowT:end,:) = img(1:end+rowT+1,:);
    mask1(-rowT:end,:) = 0;
    fillIm(1:-rowT-1,:) = img(end+rowT+2:end,:);
end

fillIm2 = fillIm;
mask2 = mask;
if ge(colT,0)
    fillIm2(:,1:C-colT) = fillIm(:,colT+1:end);
    mask2(:,1:C-colT) = 0;
    fillIm2(:,C-colT+1:end) = fillIm(:,1:colT);
else
    fillIm2(:,-colT:end) = fillIm(:,1:end+colT+1);
    mask1(:,-colT:end) = 0;
    fillIm2(:,1:-colT-1) = fillIm(:,end+colT+2:end);
end

mask = logical(mask1+mask2);
maskBig = imdilate(mask,strel('disk',1));
maskNew = imdilate(maskBig-mask,strel('disk',Br));

fillIm3 = imgaussfilt(fillIm2,filtNum);

newIm = fillIm2;
newIm(logical(maskNew)) = fillIm3(logical(maskNew));

end

