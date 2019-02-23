clc;
clear all;
close all;
rector = dir('*.jpg');
parentFile = cd;

SubImSize = 224;

for i = 1:length(rector)
    i
    pic = rector(i);
    picn = rector(i).name;
    picr = imread(picn);
    
    figure
    imshow(picr);
    [x,y] = getpts;
    close all
    
    for j = 1:length(x)
        xthis = floor(x(j));
        ythis = floor(y(j));
        if (ythis-SubImSize/2+1>=0)&&(xthis-SubImSize/2+1>=0)&&(ythis+SubImSize/2<=1216)&&(xthis+SubImSize/2<=1616)
            img = picr(ythis-SubImSize/2+1:ythis+SubImSize/2,  xthis-SubImSize/2+1:xthis+SubImSize/2);
            imwrite(img,strcat(picn(1:(length(picn)-4)),'-',int2str(j),'.jpg'));
        end
    end
end 
