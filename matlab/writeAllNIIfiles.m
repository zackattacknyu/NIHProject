function [ ] = writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
%WRITEALLNIIFILES Summary of this function goes here
%   Detailed explanation goes here

[ outputDir,baselineNIIfilePath,comparisonNIIfilePaths ] ...
    = writeUnregNIIfiles( dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare );


[ commandName ] = writeNIIbatchScript( initDir,outputDir,ptNum,baselineScanNum,...
    baselineNIIfilePath,comparisonNIIfilePaths );

system(commandName)

end

