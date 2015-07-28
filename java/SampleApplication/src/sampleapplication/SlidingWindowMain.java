/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sampleapplication;

import java.util.Calendar;

/**
 *
 * @author destefanozr
 */
public class SlidingWindowMain {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        long initTime = Calendar.getInstance().getTimeInMillis();
        
        int numTrials = 27000;
        int fSize = 4;
        
        
        SlidingWindowDifference instance = new SlidingWindowDifference(fSize);
        
        for(int i = 0; i < numTrials; i++){
            instance.generateInfo();
        }
        
        

        long nowTime = Calendar.getInstance().getTimeInMillis();
        
        System.out.println("Time: " + (nowTime-initTime) + " ms");
    }
    
}
