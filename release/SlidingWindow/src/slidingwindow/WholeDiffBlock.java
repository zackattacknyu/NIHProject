/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package slidingwindow;

/**
 *IMPORTANT NOTE:
 * 
 * CODE IS CURRENTLY UNUSED AS IT WAS NOT FUNCTIONING IN MATLAB
 * THIS CODE HAS NOT BEEN TESTED
 * 
 * 
 *
 * @author destefanozr
 */
public class WholeDiffBlock {
    
    
    private final Double[][][] baselineBlock;
    private final Double[][][] comparisonBlock;
    private final Integer fSize;
    
    private double[][][] outputBlock;
    
    public WholeDiffBlock(Double[][][] baselineBlock, Double[][][] comparisonBlock, Integer fSize) throws Exception{
        this.baselineBlock = baselineBlock;
        this.comparisonBlock = comparisonBlock;
        this.fSize = fSize;
        
        generateBlock();
    }

    public double[][][] getOutputBlock() {
        return outputBlock;
    }
    
    
    public static double[][][] getWholeDiffBlock(Double[][][] baselineBlock, Double[][][] comparisonBlock, Integer fSize) throws Exception{
           
        WholeDiffBlock wholeBlock = new WholeDiffBlock(baselineBlock,comparisonBlock,fSize);       
        return wholeBlock.getOutputBlock();
        
    }
    
    private void generateBlock() throws Exception{
        
        outputBlock = new double[baselineBlock.length][baselineBlock[0].length][baselineBlock[0][0].length];
        
        double[][] currentOutput;
        for(int i = 0; i < baselineBlock.length; i++){
            currentOutput = WholeDiffImage.getWholeDiffImage(baselineBlock[i],comparisonBlock[i],fSize);
            
            outputBlock[i] = currentOutput;
        }
    }
    
}
