package Controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Cj
 */
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.ArrayList;
import RBtree.HashTree;
import RBtree.Node;
import RBtree.RBTree;
import RBtree.RootTree;
import RBtree.SubRootTree;
import java.io.ByteArrayInputStream;
import java.io.ObjectInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.logging.Level;
import java.util.logging.Logger;



public class dir implements Callable<String>{
    private static RootTree[] seriz = new RootTree[3];
    long count=0,count1=0,count2=0,count3=0;
    private String request_string="", search_string="", WRITE_OBJECT_SQL="", READ_OBJECT_SQL="", user_id="";
    ArrayList<String> music_path;
    ArrayList<String> movie_path;
    ArrayList<String> image_path;
    ArrayList<Node> temp_result;
    SubRootTree st;
    public String log = "";
    Connection con;
    PreparedStatement pstmt;
    
    public dir(SubRootTree st1, String str){
        this.st = st1;
        this.search_string = str;
        this.temp_result = new ArrayList<Node>();
    }
    
    public dir(String userid){
        user_id = userid;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crawler","root","9897089099");
        } catch (Exception ex) {
            Logger.getLogger(dir.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * @return the seriz
     */
    public static RootTree[] getSeriz() {
        return seriz;
    }

    /**
     * @param aSeriz the seriz to set
     */
    public static void setSeriz(RootTree[] aSeriz) {
        seriz = aSeriz;
    }


    /**
     * @return the request_string
     */
    public String getRequest_string() {
        return request_string;
    }

    /**
     * @param request_string the request_string to set
     */
    public void setRequest_string(String request_string) {
        this.request_string = request_string;
    }

    public String run(String type, String dirList) throws FileNotFoundException{
        log += "Directories"+dirList + ";;";
        
        String[] paths = dirList.split("#::#");
        if(type.equals("Music")){
            run_music(paths);
        }
        else if(type.equals("Movies")){
            run_movie(paths);
        }
        else{
            run_image(paths);
        }
        log += count + " files found;;";
        log += count1 + " images;;";
        log += count2 + " music;;";
        log += count3 + " videos;;";
        setRequest_string(getRequest_string() + "\nTotal"+count+"files parsed");
        //System.out.println("Total"+seriz.countNodes()+"nodes");
        setRequest_string(getRequest_string() + "\nTotal "+count1+" images");
        setRequest_string(getRequest_string() + "\nTotal "+count2+" music");
        setRequest_string(getRequest_string() + "\nTotal "+count3+" videos");
        //getSeriz()[0].inorder();
        count=count1=count2=count3=0;
        log += "Parsing complete;;";
        return log;
    }
    
    private void run_music(String[] paths) throws FileNotFoundException{
        log += "In music";
        try{
            READ_OBJECT_SQL = "select music_path from Data_crawl WHERE UserId=?";
            pstmt = con.prepareStatement(READ_OBJECT_SQL);
            pstmt.setString(1, user_id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            Object object = rs.getObject(1);
            rs.close();
            pstmt.close();
            //FileInputStream fin = new FileInputStream(new File("E:\\music_path.ser"));
            //ObjectInputStream o = new ObjectInputStream(fin);
            music_path = (ArrayList<String>) object;
            music_path.size();
            //fin.close();
        }
        catch(Exception e){
            music_path = new ArrayList();
        }
        music_path = new ArrayList();
        getSeriz()[0] = new RootTree();
        for(String path: paths){
            if (!music_path.contains(path) && path.length()>1){
                music_path.add(path);
            }
        }
        for(String path: music_path){
            log += path + " directory;;";
            if(path.length()>1){
                File aStartingDir = new File(path);
                MusicCrawler(aStartingDir);
            }
        }
        
        
        //FileOutputStream fy = new FileOutputStream(new File("E:\\music.ser"));
        //FileOutputStream fy1 = new FileOutputStream(new File("E:\\music_path.ser"));
        try{
            WRITE_OBJECT_SQL = "update data_crawl set music_object=?,music_path=? where UserId=?";
            pstmt = con.prepareStatement(WRITE_OBJECT_SQL);
            pstmt.setObject(1, getSeriz()[0]);
            pstmt.setObject(2, music_path);
            pstmt.setString(3, user_id);
            int status = pstmt.executeUpdate();
            /*ObjectOutputStream o = new ObjectOutputStream(fy);
            o.writeObject(getSeriz()[0]);
            ObjectOutputStream o1 = new ObjectOutputStream(fy1);
            o1.writeObject(music_path);
            fy.close();
            fy1.close();*/
            log += "Serialization successful";
        }
        catch(Exception e){
            log+= e.getLocalizedMessage();
        }
    }
    
    private void run_movie(String[] paths) throws FileNotFoundException{
        log += "In movies;;";
        getSeriz()[1] = new RootTree();
        try{
            READ_OBJECT_SQL = "SELECT movie_path FROM data_crawl WHERE userId = ?";
            pstmt = con.prepareStatement(READ_OBJECT_SQL);
            pstmt.setString(1, user_id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            Object object = rs.getObject(1);
            rs.close();
            pstmt.close();
            movie_path = (ArrayList<String>) object;
            movie_path.size();
        }
        catch(Exception e){
            movie_path = new ArrayList();
        }
        for(String path: paths){
            if (!movie_path.contains(path) && path.length()>1){
                movie_path.add(path);
            }
        }
        for(String path: movie_path){
            log += path + " directory;;";
            if(path.length()>1){
                File aStartingDir = new File(path);
                MoviesCrawler(aStartingDir);
            }
        }
        //FileOutputStream fy = new FileOutputStream(new File("E:\\movies.ser"));
        //FileOutputStream fy1 = new FileOutputStream(new File("E:\\movie_path.ser"));
        try{
            WRITE_OBJECT_SQL = "update data_crawl set movie_object=?,movie_path=? where UserId=?";
            pstmt = con.prepareStatement(WRITE_OBJECT_SQL);
            pstmt.setObject(1, getSeriz()[1]);
            pstmt.setObject(2, movie_path);
            pstmt.setString(3, user_id);
            int status = pstmt.executeUpdate();
            /*ObjectOutputStream o = new ObjectOutputStream(fy);
            o.writeObject(getSeriz()[1]);
            ObjectOutputStream o1 = new ObjectOutputStream(fy1);
            o1.writeObject(movie_path);
            fy.close();
            fy1.close();*/
            log += "Serialization successful";
        }
        catch(Exception e){
        }
    }
    
    private void run_image(String[] paths) throws FileNotFoundException{
        log += "In Images";
        getSeriz()[2] = new RootTree();
        try{
            READ_OBJECT_SQL = "SELECT image_path FROM data_crawl WHERE userId = ?";
            pstmt = con.prepareStatement(READ_OBJECT_SQL);
            pstmt.setString(1, user_id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            Object object = rs.getObject(1);
            rs.close();
            pstmt.close();
            image_path = (ArrayList<String>) object;
            image_path.size();
        }
        catch(Exception e){
            image_path = new ArrayList();
        }
        for(String path: paths){
            if (!image_path.contains(path) && path.length()>1){
                image_path.add(path);
            }
        }
        for(String path: image_path){
            log += path + " directory;;";
            if(path.length()>1){
                File aStartingDir = new File(path);
                ImageCrawler(aStartingDir);
            }
        }
        /*FileOutputStream fy = new FileOutputStream(new File("E:\\image.ser"));
        FileOutputStream fy1 = new FileOutputStream(new File("E:\\image_path.ser"));*/
        try{
            WRITE_OBJECT_SQL = "update data_crawl set image_object=?,image_path=? where UserId=?";
            pstmt = con.prepareStatement(WRITE_OBJECT_SQL);
            pstmt.setObject(1, getSeriz()[2]);
            pstmt.setObject(2, image_path);
            pstmt.setString(3, user_id);
            int status = pstmt.executeUpdate();
            /*ObjectOutputStream o = new ObjectOutputStream(fy);
            o.writeObject(getSeriz()[2]);
            ObjectOutputStream o1 = new ObjectOutputStream(fy1);
            o1.writeObject(image_path);
            fy.close();
            fy1.close();*/
            log += "Serialization successful";
        }
        catch(Exception e){
        }
    }
    
    public String search(String type, String search_string){
        RootTree tree = new RootTree();
        if(type.equals("Music")){
            try{
                READ_OBJECT_SQL = "SELECT music_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                byte[] buf = rs.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                tree = (RootTree) obj;
            }
            catch(Exception e){
            }
        }
        else if(type.equals("Movies")){
            try{
                READ_OBJECT_SQL = "SELECT movie_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                byte[] buf = rs.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                tree = (RootTree) obj;
            }
            catch(Exception e){
            }
        }
        else{
            try{
                READ_OBJECT_SQL = "SELECT image_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                byte[] buf = rs.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                tree = (RootTree) obj;
            }
            catch(Exception e){
            }
        }
        ArrayList<Node> result = tree.search(search_string, 0);
        String result_string = "#%%#";
        try{
            SubRootTree st1 = tree.getTree().get('$');
            HashTree ht = st1.getTree().get('$');
            RBTree rbt = ht.getTree().get('$');
            if(result.get(0).getFile()==null){
                result.remove(0);
            }
            result.addAll(rbt.search_special(search_string, 0));
            for(Node node : result){
                result_string += node.getFile().getPath()+"#::#"+node.getFile().getName() + "#%%#";
            }
            if(result_string.length()<5){
                result_string += "No results found";
            }
        }catch(Exception e){
            result_string += "No results found";
        }
        return result_string;
    }
    
    public String search_advanced(String type, String search_string){
        RootTree tree = new RootTree();
        if(type.equals("Music")){
            try{
                READ_OBJECT_SQL = "SELECT music_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                byte[] buf = rs.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                tree = (RootTree) obj;
            }
            catch(Exception e){
            }
        }
        else if(type.equals("Movies")){
            try{
                READ_OBJECT_SQL = "SELECT movie_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                byte[] buf = rs.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                tree = (RootTree) obj;
            }
            catch(Exception e){
            }
        }
        else{
            log += "here";
            try{
                log += "here";
                READ_OBJECT_SQL = "SELECT image_object FROM data_crawl WHERE userId=?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                byte[] buf = rs.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                tree = (RootTree) obj;
                rs.close();
                pstmt.close();
            }
            catch(Exception e){
                log += "not here";
                log += e.getLocalizedMessage();
            }
        }
        ArrayList<String> result_string = new ArrayList<String>();
        try{
            ExecutorService executorService = Executors.newFixedThreadPool(10);
            for(SubRootTree st1: tree.getTree().values()){
                Future<String> fr = executorService.submit(new dir(st1,search_string));
                try{
                    for(String r: fr.get().split("#%%#")){
                        if(r.length()>1){
                            result_string.add(r);
                        }
                    }
                }catch(Exception e){               
                    log+= e.getLocalizedMessage();
                    fr.cancel(true);
                }
            }
            executorService.shutdown();
            if(result_string.size()<1){
                result_string.add("No results found");
            }
            //executorService.awaitTermination(100, TimeUnit.SECONDS);
        }catch(Exception e){
            log+= e.getLocalizedMessage();
            result_string.add("No results found");
        }
        log += result_string.size();
        log += result_string.toArray(new String[result_string.size()]).length;
        String[] temp = result_string.toArray(new String[result_string.size()]);
        String result_final="#%%#";
        for(String b: temp){
            result_final += b + "#%%#";
        }
        return result_final;
    }
    
    
    private void MusicCrawler(File aStartingDir){                
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
                            count2++;
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
                count++;
                MusicCrawler(file);
            }
        }
    }
    
    private void MoviesCrawler(File aStartingDir){                
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
                        count++;
                        //Display file names
                        String temp = file.getName().toString().toLowerCase();
                        //System.out.println(file.getPath());
                        if (temp.endsWith(".avi")||temp.endsWith(".flv")||temp.endsWith(".webm")||temp.endsWith(".divx")||temp.endsWith(".avc")||temp.endsWith(".mp4")||temp.endsWith(".mkv")||temp.endsWith(".mov")||temp.endsWith(".wmv")||temp.endsWith(".mpeg1")||temp.endsWith(".mpeg2")||temp.endsWith(".xvid")||temp.endsWith(".vob")){
                            count3++;
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
     
    private void ImageCrawler(File aStartingDir){                
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
                        count++;
                        //Display file names
                        String temp = file.getName().toString().toLowerCase();
                        //System.out.println(file.getPath());
                        if (temp.endsWith(".jpg")||temp.endsWith(".png")||temp.endsWith(".gif")||temp.endsWith(".bmp")){
                            count1++;
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

    @Override
    public String call(){
        try{
            for(HashTree ht: st.getTree().values()){
               for(RBTree rbt: ht.getTree().values()){
                   /*if(temp_result.get(0).getFile()==null){
                                temp_result.remove(0);
                   }*/
                   this.temp_result.addAll(rbt.search_special(this.search_string, 0));
                }
            }
            for(Node node : temp_result){
                this.request_string += node.getFile().getPath()+"#::#"+node.getFile().getName() + "#%%#";
            }
            return this.request_string+"#%%#";
        }catch(Exception e){
            return e.getLocalizedMessage();
        }
    }
}