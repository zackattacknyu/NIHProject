/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package slidingwindow;

import java.util.Calendar;

/**
 *
 * @author destefanozr
 */
public class SlidingWindow {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        int fSize = 4;
        int imgSize = 100;
        
        int numBlocks = 40;
        
        Double[][][] block1 = new Double[numBlocks][imgSize][imgSize];
        Double[][][] block2 = new Double[numBlocks][imgSize][imgSize];
        
        for(int i = 0; i < numBlocks; i++){
            block1[i] = generateRandomArray(imgSize);
            block2[i] = generateRandomArray(imgSize);
        }
        long initTime = Calendar.getInstance().getTimeInMillis();
        WholeDiffBlock.getWholeDiffBlock(block1, block2, fSize);
        
        //Double[][] img2 = generateRandomArray(imgSize);
        //WholeDiffImage myImage = new WholeDiffImage(img1,img2,fSize);
        
        //SlidingWindowDifference.findMinDifference(img1, img2, fSize);
        
        
        long nowTime = Calendar.getInstance().getTimeInMillis();
        
        System.out.println("Time: " + (nowTime-initTime) + " ms");
    }
    
    public static Double[][] generateRandomArray(int squareSize){
        
        Double[][] randArray = new Double[squareSize][squareSize];
        
        for(int i = 0; i < squareSize; i++){
            for(int j = 0; j < squareSize; j++){
                randArray[i][j] = Math.random()*200;
            }
        }
        
        return randArray;
        
    }
    
}
