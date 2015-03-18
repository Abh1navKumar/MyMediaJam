/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;
import Controller.PasswordGenerator;
import Beans.LoginBean;
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
 * @author Abhinav Kumar
 */
public class LoginAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS="";
    private String user_id;
    private String pass;
    private String fpass;
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
        PrintWriter out = response.getWriter();
        LoginBean lb = (LoginBean)form;
        user_id = lb.getUser_id();
        pass = lb.getPass();
        out.println(fpass);
        fpass = lb.getFpass();
        boolean status=false;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crawler","root","9897089099");
            out.println(fpass);
            try{
                if(fpass.equals("yes")){
                String s_ques="",s_ans="";
                PreparedStatement pst=con.prepareStatement("select users.sec_ques,users.sec_ans from users where users.user_id=?");
                pst.setString(1, user_id);
                ResultSet rs=pst.executeQuery();
                if(rs.first()){
                    s_ques = rs.getString(1);
                    s_ans = rs.getString(2);
                }
                request.setAttribute("ques", s_ques);
                request.setAttribute("ans", s_ans);
                request.setAttribute("usr_id",user_id);
                SUCCESS = "forget";
                }
                else{
                    throw new Exception();
                }
            }catch(Exception e1){
                HttpSession session = request.getSession();
                PreparedStatement pst=con.prepareStatement("select * from users where users.user_id=? and password=?");
                pst.setString(1, user_id);
                pst.setString(2, PasswordGenerator.generate(pass));
                ResultSet rs=pst.executeQuery();
                status=rs.next();
                PreparedStatement pstmt;
                String READ_OBJECT_SQL="";
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
                out.println(count);
                if(status){
                    session.setAttribute("user_id",user_id);
                    session.setAttribute("user_name",rs.getString("name").toUpperCase());
                    if(count>0){
                        SUCCESS = "search";
                    }
                    else{
                        SUCCESS = "crwll";
                    } 
               }
                else{
                    request.setAttribute("msgg", "*Invalid Login");
                    SUCCESS="fail";
                }
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        out.println(SUCCESS);
        count=0;
        fpass = null;
        
        //SUCCESS="sad";
        return mapping.findForward(SUCCESS);
    }
}
