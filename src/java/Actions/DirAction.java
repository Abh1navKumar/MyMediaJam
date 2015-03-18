/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.DirBean;
import Controller.dir;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Cj
 */
public class DirAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS="success";
    private String musicz, log="", moviesz, imagez;

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String id = (String)session.getAttribute("user_id");
        if(id!=null){
            final dir play = new dir((String)session.getAttribute("user_id"));
            final DirBean db = (DirBean)form;
            moviesz = db.getMoviesz();
            imagez = db.getImagez();
            musicz = db.getMusicz();
            log += "Movies:"+moviesz+"//////////////Images:"+imagez+"/////////////Music:"+musicz+"//////////";
            /*Thread t1 = new Thread(){
                @Override
                public void run(){
                    if(!moviesz.isEmpty()){
                        try {
                            log+= "in movies";
                            log += play.run("Movies", moviesz);
                            log+= "after movies";
                        } catch (FileNotFoundException ex) {
                            Logger.getLogger(DirAction.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            };

            Thread t2 = new Thread() {
                @Override
                public void run() {
                    if(!imagez.isEmpty()){
                        try {
                            log += play.run("Image", imagez);
                        } catch (FileNotFoundException ex) {
                            Logger.getLogger(DirAction.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            };

            Thread t3 = new Thread() {
                @Override
                public void run() {
                    if(!musicz.isEmpty()){
                        try {
                            log+= "in music" + musicz;
                            log += play.run("Music", musicz);
                        } catch (Exception ex) {
                            log += ex.getLocalizedMessage();
                            Logger.getLogger(DirAction.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        }
                    }
            };
            t1.start();
            t2.start();
            t3.start();*/
            if(!moviesz.isEmpty()){
                log += play.run("Movies", moviesz);
            }
            if(!imagez.isEmpty()){
                log += play.run("Image", imagez);
            }
            if(!musicz.isEmpty()){
                log += play.run("Music", musicz);
            }
            out.println(log);
        }else{
            SUCCESS = "logout";
            request.setAttribute("msgg", "Please Login First");
        }
        
        return mapping.findForward(SUCCESS);
    }
}

