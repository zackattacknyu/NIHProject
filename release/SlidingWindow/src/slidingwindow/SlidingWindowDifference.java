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
    
    public double findMinDifference(double[][] window1, double[][] window2){
        double[][] repWindow2 = repeatArray2by2(window2);
        return getMinDifference(window1,repWindow2);
    }
    
    private double getMinDifference(double[][] baselineWindow, double[][] comparisonWindow){
        
        double minDiff = Double.MAX_VALUE;
        double cumDiff=0; 
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
                cumDiff = cumDiff/(squareSize*squareSize); 
                
                if(cumDiff < minDiff){
                    minDiff = cumDiff;
                }

            }
        }
        
        return minDiff;
        
        
        
        
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
