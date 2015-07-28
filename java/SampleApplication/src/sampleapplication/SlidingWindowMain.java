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
        
        SlidingWindowDifference instance = new SlidingWindowDifference(4);

        long nowTime = Calendar.getInstance().getTimeInMillis();
        
        System.out.println("Time: " + (nowTime-initTime) + " ms");
    }
    
}
