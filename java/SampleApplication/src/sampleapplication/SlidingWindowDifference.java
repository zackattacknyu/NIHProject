/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sampleapplication;

/**
 *
 * @author destefanozr
 */
public class SlidingWindowDifference {
    
    private int squareSize;
    
    private double[][] window1;
    private double[][] window2;
    private double[][] repWindow2;
    
    public SlidingWindowDifference(int fSize){
        
        squareSize = fSize*2 + 1;
        
        window1 = generateRandomArray(squareSize);
        window2 = generateRandomArray(squareSize);
        repWindow2 = repeatArray2by2(window2);
        
    }
    
    public double[][] repeatArray2by2(double[][] window){
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
