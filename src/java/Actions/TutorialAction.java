/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import java.io.ByteArrayInputStream;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class TutorialAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private int count = 0;

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
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        String user_id = (String)session.getAttribute("user_id");
        if(user_id!=null){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crawler","root","9897089099");
            String READ_OBJECT_SQL="";
            PreparedStatement pstmt;
            try{
               READ_OBJECT_SQL = "SELECT image_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs1 = pstmt.executeQuery();
                rs1.next();
                byte[] buf = rs1.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                count++;
            }
            catch(Exception e){}
            try{
               READ_OBJECT_SQL = "SELECT music_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs1 = pstmt.executeQuery();
                rs1.next();
                byte[] buf = rs1.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                count++;
            }
            catch(Exception e){}
            try{
               READ_OBJECT_SQL = "SELECT movie_object FROM data_crawl WHERE userId = ?";
                pstmt = con.prepareStatement(READ_OBJECT_SQL);
                pstmt.setString(1, user_id);
                ResultSet rs1 = pstmt.executeQuery();
                rs1.next();
                byte[] buf = rs1.getBytes(1);
                ObjectInputStream objectin = null;
                if(buf!=null){
                    objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                }
                Object obj = objectin.readObject();
                count++;
            }
            catch(Exception e){}
            if(count>0){
                SUCCESS = "search";
            }
            else{
                SUCCESS = "crwll";
            } 
        }catch(Exception e){}
        }
        else{
            SUCCESS="fail";
        }
        out.println(count);
        out.println(SUCCESS);
        //SUCCESS = "sad";
        return mapping.findForward(SUCCESS);
    }
}
