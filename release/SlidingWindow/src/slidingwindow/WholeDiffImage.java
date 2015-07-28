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
public class WholeDiffImage {
    
    private final double[][] img1;
    private final double[][] img2;
    private final double[][] outputImg;
    private final int fSize;
    private final int sqSize;
    
    public WholeDiffImage(double[][] img1, double[][] img2, int fSize){
        this.img1 = img1;
        this.img2 = img2;
        this.fSize = fSize;
        sqSize = 2*fSize+1;
        
        int numR = img1.length - 2*fSize;
        int numC = img1[0].length - 2*fSize;
        outputImg = new double[numR][numC];
        generateOutputImg();
    }

    public double[][] getOutputImg() {
        return outputImg;
    }
    
    private void generateOutputImg(){
        
        double[][] window1;
        double[][] window2;
        SlidingWindowDifference slidingWindowDiff = new SlidingWindowDifference(fSize);
        
        for(int i = fSize; i < img1.length-fSize; i++){
            for(int j = fSize; j < img1[0].length-fSize; j++){
                window1 = getWindow(img1,i,j);
                window2 = getWindow(img2,i,j);
                outputImg[i-fSize][j-fSize] = slidingWindowDiff.findMinDifference(window1, window2);
            }
        }
        
    }
    
    private double[][] getWindow(double[][] inputMatrix,int windowCenterRow, int windowCenterCol){
        double[][] outputMatrix = new double[sqSize][sqSize];
        for(int i = -fSize; i <= fSize; i++){
            for(int j = -fSize; j <= fSize; j++){
                outputMatrix[i+fSize][j+fSize] = inputMatrix[windowCenterRow+i][windowCenterCol+j];
            }
        }
        return outputMatrix;
    }
        
}
