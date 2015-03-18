/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Abhinav Kumar
 */
public class LoginBean extends org.apache.struts.action.ActionForm {
    
    private String user_id;
    private String pass;
    private String fpass;

    
    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the user_id
     */
    public String getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    /**
     * @return the fpass
     */
    public String getFpass() {
        return fpass;
    }

    /**
     * @param fpass the fpass to set
     */
    public void setFpass(String fpass) {
        this.fpass = fpass;
    }

    
}
