clc;
clear all;
close all;
rector = dir('*.jpg');
parentFile = cd;

for i = 1:length(rector)
    i
    pic = rector(i);
    picn = rector(i).name;
    picr = imread(picn);
    picf = fullfile(parentFile, picn);
    movefile(picf,'Originalpic');
    picgray = mat2gray(rgb2gray(picr));
    imwrite(picgray,picn);
end 
