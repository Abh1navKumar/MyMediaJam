/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import static Controller.dir.getSeriz;
import java.applet.Applet;
import java.awt.Graphics;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Cj
 */
public class DirApplet extends Applet {

    /**
     * Initialization method that will be called after the applet is loaded into
     * the browser.
     */
    public void init() {
        // TODO start asynchronous download of heavy resources
    }
    
     public void paint (Graphics g)
   {
      g.drawString ("Hello World", 25, 50);
   }
    
    public void MusicCrawler(File aStartingDir){                
        File[] filesAndDirs = aStartingDir.listFiles();
        List<File> dir = new ArrayList<File>();
        int i=0;
        /*Current Directory being traversed	
        System.out.
        println("------------------------------------------------");
        System.out.println(aStartingDir.toString());
        System.out.
        println("------------------------------------------------");
        */
        //List all files in directory
        try{
            if(filesAndDirs.length>0){
                for(File file:filesAndDirs){
                    if (file.isFile()) {
                        //Display file names
                        String temp = file.getName().toString().toLowerCase();
                        if (temp.endsWith(".mp3")||temp.endsWith(".m4a")||temp.endsWith(".aac")||temp.endsWith(".ac3")||temp.endsWith(".ogg")||temp.endsWith(".wma")||temp.endsWith(".wav")||temp.endsWith(".mp4")){
                            //System.out.println(file.getPath());
                            getSeriz()[0].insert(file,0);      
                        }
                    }
                    else {
                        //Add first level directory to a list
                        dir.add(file);
                    }
                }
            }
        }
        catch(NullPointerException ex){}
        if(dir.isEmpty())
            return;
        else {
            /*Traverse directory structure recursively 
            by calling directory crawler */
            for(File file:dir){
                MusicCrawler(file);
            }
        }
    }
    
    public void MoviesCrawler(File aStartingDir){                
        File[] filesAndDirs = aStartingDir.listFiles();
        List<File> dir = new ArrayList<File>();
        int i=0;
        /*Current Directory being traversed	
        System.out.
        println("------------------------------------------------");
        System.out.println(aStartingDir.toString());
        System.out.
        println("------------------------------------------------");
        */
        //List all files in directory
        try{
            if(filesAndDirs.length>0){
                for(File file:filesAndDirs){                
                    if (file.isFile()) {
                        //Display file names
                        String temp = file.getName().toString().toLowerCase();
                        //System.out.println(file.getPath());
                        if (temp.endsWith(".avi")||temp.endsWith(".flv")||temp.endsWith(".webm")||temp.endsWith(".divx")||temp.endsWith(".avc")||temp.endsWith(".mp4")||temp.endsWith(".mkv")||temp.endsWith(".mov")||temp.endsWith(".wmv")||temp.endsWith(".mpeg1")||temp.endsWith(".mpeg2")||temp.endsWith(".xvid")||temp.endsWith(".vob")){
                            getSeriz()[1].insert(file,0);      
                        }
                    }
                    else {
                        //Add first level directory to a list
                        dir.add(file);
                    }
                }
            }
        }
        catch(NullPointerException ex){}
        if(dir.isEmpty())
            return;
        else {
            /*Traverse directory structure recursively 
            by calling directory crawler */
            for(File file:dir){
                MoviesCrawler(file);
            }
        }
    }
     
    public void ImageCrawler(File aStartingDir){                
        File[] filesAndDirs = aStartingDir.listFiles();
        List<File> dir = new ArrayList<File>();
        int i=0;
        /*Current Directory being traversed	
        System.out.
        println("------------------------------------------------");
        System.out.println(aStartingDir.toString());
        System.out.
        println("------------------------------------------------");
        */
        //List all files in directory
        try{
            if(filesAndDirs.length>0){
                for(File file:filesAndDirs){                
                    if (file.isFile()) {
                        //Display file names
                        String temp = file.getName().toString().toLowerCase();
                        //System.out.println(file.getPath());
                        if (temp.endsWith(".jpg")||temp.endsWith(".png")||temp.endsWith(".gif")||temp.endsWith(".bmp")){
                            //System.out.println(file.getPath());
                            getSeriz()[2].insert(file,0);      
                        }
                    }
                    else {
                        //Add first level directory to a list
                        dir.add(file);
                    }
                }
            }
        }
        catch(NullPointerException ex){}
        if(dir.isEmpty())
            return;
        else {
            /*Traverse directory structure recursively 
            by calling directory crawler */
            for(File file:dir){
                ImageCrawler(file);
            }
        }
    }
    // TODO overwrite start(), stop() and destroy() methods
}
