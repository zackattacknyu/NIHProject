/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package slidingwindow;

/**
 *
 * @author destefanozr
 */
public class SlidingWindowDifference {
    
    private final int squareSize;
    
    public SlidingWindowDifference(int fSize){
        squareSize = fSize*2 + 1;
    }
    
    public static double findMinDifference(Double[][] window1, Double[][] window2, Integer fSize){
        double[][] img1 = new double[window1.length][window1[0].length];
        double[][] img2 = new double[window2.length][window2[0].length];
        
        for(int i = 0; i < img1.length; i++){
            for(int j = 0; j < img2.length; j++){
                img1[i][j] = window1[i][j];
                img2[i][j] = window2[i][j];
            }
        }
        return findMinDifference(img1, img2,fSize);
    }
    
    public static double findMinDifference(double[][] window1, double[][] window2, int fSize){
        SlidingWindowDifference slidingDiff = new SlidingWindowDifference(fSize);
        return slidingDiff.findMinDifference(window1, window2);
    }
    
    public double findMinDifference(double[][] window1, double[][] window2){
        double[][] repWindow1 = repeatArray2by2(window1);
        return getMinDifference(window2,repWindow1);
    }
    
    private double getMinDifference(double[][] baselineWindow, double[][] comparisonWindow){
        
        double minDiff = Double.MAX_VALUE;
        double cumDiff; 
        double curDiff;
        for(int rOff = 0; rOff < squareSize; rOff++){
            for(int cOff = 0; cOff < squareSize; cOff++){
                
                cumDiff = 0;
                for(int i = 0; i < squareSize; i++){
                    for(int j = 0; j < squareSize; j++){
                        curDiff = baselineWindow[i][j] - comparisonWindow[i+rOff][j+cOff];
                        cumDiff = cumDiff + curDiff*curDiff;
                    }
                }
                
                if(cumDiff < minDiff){
                    minDiff = cumDiff;
                }

            }
        }
        
        return minDiff/(squareSize*squareSize);
        
        
        
        
    }
    
    private double[][] repeatArray2by2(double[][] window){
        double[][] repeatedArray = new double[squareSize*2][squareSize*2];
        for(int i = 0; i < squareSize; i++){
            for(int j = 0; j < squareSize; j++){
                repeatedArray[i][j] = window[i][j];
                repeatedArray[i+squareSize][j] = window[i][j];
                repeatedArray[i][j+squareSize] = window[i][j];
                repeatedArray[i+squareSize][j+squareSize] = window[i][j];
            }
        }
        return repeatedArray;
    }
    
    
    
}
