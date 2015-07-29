/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package slidingwindow;

import java.util.ArrayList;

/**
 *IMPORTANT NOTE:
 * 
 * CODE IS CURRENTLY UNUSED AS IT WAS NOT FUNCTIONING IN MATLAB
 * THIS CODE HAS NOT BEEN TESTED
 * 
 * 
 * @author destefanozr
 */
public class WholeDiffBlockOld {
    
    
    private final ArrayList baselineBlock;
    private final ArrayList comparisonBlock;
    private final Integer fSize;
    
    private ArrayList outputBlock;
    
    public WholeDiffBlockOld(ArrayList baselineBlock, ArrayList comparisonBlock, Integer fSize){
        this.baselineBlock = baselineBlock;
        this.comparisonBlock = comparisonBlock;
        this.fSize = fSize;
        
        generateBlock();
    }

    public ArrayList getOutputBlock() {
        return outputBlock;
    }
    
    
    public static ArrayList getWholeDiffBlock(ArrayList baselineBlock, ArrayList comparisonBlock, Integer fSize){
           
        WholeDiffBlockOld wholeBlock = new WholeDiffBlockOld(baselineBlock,comparisonBlock,fSize);       
        return wholeBlock.getOutputBlock();
        
    }
    
    private void generateBlock(){
        
        outputBlock = new ArrayList(baselineBlock.size());
        
        double[][] currentOutput;
        for(int i = 0; i < baselineBlock.size(); i++){
            currentOutput = WholeDiffImage.getWholeDiffImage(
                    (Double[][]) baselineBlock.get(i), 
                    (Double[][]) comparisonBlock.get(i), 
                    fSize);
            
            outputBlock.add(currentOutput);
        }
    }
    
}
