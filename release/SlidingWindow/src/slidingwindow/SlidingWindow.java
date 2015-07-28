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
        long initTime = Calendar.getInstance().getTimeInMillis();
        
        int fSize = 4;
        int imgSize = 400;
        
        double[][] img1 = generateRandomArray(imgSize);
        double[][] img2 = generateRandomArray(imgSize);
        WholeDiffImage myImage = new WholeDiffImage(img1,img2,fSize);
        
        
        long nowTime = Calendar.getInstance().getTimeInMillis();
        
        System.out.println("Time: " + (nowTime-initTime) + " ms");
    }
    
    public static double[][] generateRandomArray(int squareSize){
        
        double[][] randArray = new double[squareSize][squareSize];
        
        for(int i = 0; i < squareSize; i++){
            for(int j = 0; j < squareSize; j++){
                randArray[i][j] = Math.random()*200;
            }
        }
        
        return randArray;
        
    }
    
}
