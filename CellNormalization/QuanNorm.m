%%% Quantile Normalization of a directory of files, need to load refIm.jpg
%%% first, then run the script in the directory
rector = dir('*.jpg');
parentFile = cd;

for i = 1:length(rector)
    i
    pic = rector(i);
    picn = rector(i).name;
    picr = imread(picn);
    picr = double(picr);
    trialIm = picr;
    
    %%% Define Reference Vector from Image (or could be collection of images)
    N = 1000;
    pTiles = linspace(1,N,N)/N;
    refV = prctile(refIm(:),pTiles*100);

    %Find Percentiles of image and reassign new image

    pTileIm = prctile(trialIm(:),pTiles*100);

    newIm = trialIm;

    newIm(lt(trialIm,pTileIm(1))) = refV(1);
    for j = 1:N-1
        newIm(logical(ge(trialIm,pTileIm(j)).*lt(trialIm,pTileIm(j+1)))) = refV(j);
    end
    newIm(ge(trialIm,pTileIm(N))) = refV(N);
    
    imwrite(uint8(newIm),strcat(picn(1:length(picn)-4),'-',int2str(i),'.jpg'));
    
end
