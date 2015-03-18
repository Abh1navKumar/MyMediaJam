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
public class RegisterBean extends org.apache.struts.action.ActionForm {
    
    private String fname;
    private String lname;
    private String sec_ques;
    private String sec_ans;
    private String email;

    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     * @param lname the lname to set
     */
    public void setLname(String lname) {
        this.lname = lname;
    }

    /**
     * @return the sec_ques
     */
    public String getSec_ques() {
        return sec_ques;
    }

    /**
     * @param sec_ques the sec_ques to set
     */
    public void setSec_ques(String sec_ques) {
        this.sec_ques = sec_ques;
    }

    /**
     * @return the sec_ans
     */
    public String getSec_ans() {
        return sec_ans;
    }

    /**
     * @param sec_ans the sec_ans to set
     */
    public void setSec_ans(String sec_ans) {
        this.sec_ans = sec_ans;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
}
