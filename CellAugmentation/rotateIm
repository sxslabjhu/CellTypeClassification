function [newIm] = rotateIm(img,theta,filtSize,Br)
%ROTATEIM Summary of this function goes here
%   Detailed explanation goes here

R = length(img(:,1));
C = length(img(1,:));

stdIm = std(img(:));
muIm = mean(img(:));
bigIm = imrotate(img,theta);
mask = ~imrotate(1+0*img,theta);
mask2 = imdilate(mask,strel('disk',Br));
num0 = sum(bigIm(:)==0);
bigIm(bigIm==0) = normrnd(muIm,stdIm,[1,num0]);

bigIm2 = imgaussfilt(bigIm,filtSize);
bigIm3 = bigIm2;
bigIm3(bigIm3==mask) = bigIm2(bigIm2==mask);
bigIm3(bigIm3==mask2-mask) = (bigIm2(bigIm2==mask2-mask)+bigIm(bigIm2==mask2-mask))/2;
bigIm3(~mask) = bigIm(~mask);

bigR = round(length(bigIm(:,1))/2);
bigC = round(length(bigIm(1,:))/2);

newIm = bigIm3(bigR-floor(R/2):bigR-floor(R/2)+R-1,bigC-floor(C/2):bigC-floor(C/2)+C-1);

end

