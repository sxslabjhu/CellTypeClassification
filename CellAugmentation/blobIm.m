function [newIm] = blobIm(exDbl,bCR,bCC,nSTD,maxCent)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

template = 0*exDbl;
M = max(exDbl(:));
mu = mean(exDbl(:));

cN = length(template(1,:));
rN = length(template(:,1));

[C,R] = meshgrid(linspace(1,cN,cN),linspace(1,rN,rN));

dist = sqrt((C-bCC).^2+(R-bCR).^2);

surf1 = normpdf(dist,0,nSTD).*cos(dist*2*pi/nSTD);
surf1 = surf1/max(surf1(:));
surf2 = normpdf(dist,0,nSTD/2);
surf2 = surf2/max(surf2(:));

surf3 = surf1-surf2;
surf3 = surf3/max(surf3(:));

surf3 = (M-mu)*maxCent*surf3;

newIm = exDbl+surf3;

end

