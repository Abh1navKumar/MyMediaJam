/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Abhinav Kumar
 */
public class PasswordGenerator {
    final protected static char[]hexArray = "0123456789abcdef".toCharArray();
    private static String salt = "123456";
    
    private static String bytestoHex(byte[] bytes){
        char[] hexchar = new char[bytes.length*2];
        int v ;
        for(int j=0;j<bytes.length;j++){
            v = bytes[j]&0xFF;
            hexchar[j*2] = hexArray[v>>>4];
            hexchar[j*2+1] = hexArray[v&0x0F];
        }
        return new String(hexchar);
    }
    
    public static String generate(String in){
        MessageDigest md; 
        try {
            md = MessageDigest.getInstance("SHA-256");
            md.update(salt.getBytes());
            md.update(in.getBytes());
            byte[] out = md.digest();
            return bytestoHex(out);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return "";
    }
}
