function [ ] = writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,comparison1ScanNum,comparison2ScanNum )
%WRITEALLNIIFILES Summary of this function goes here
%   Detailed explanation goes here

[ outputDir,baselineNIIfilePath,comparison1NIIfilePath,comparison2NIIfilePath ] ...
    = writeUnregNIIfiles( dataParentDir,mrns,ptNum,...
    baselineScanNum,comparison1ScanNum,comparison2ScanNum );

[ commandName ] = writeNIIbatchScript( initDir,outputDir,ptNum,baselineScanNum,...
    comparison1ScanNum,comparison2ScanNum,baselineNIIfilePath,...
    comparison1NIIfilePath,comparison2NIIfilePath );

system(commandName)

end

