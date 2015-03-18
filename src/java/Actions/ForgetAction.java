/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;
import Controller.PasswordGenerator;
import Beans.ForgetPassBean;
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
public class ForgetAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS = "success";
    private String user_id;
    private String password;

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
        ForgetPassBean fb = (ForgetPassBean)form;
        user_id = fb.getUserid();
        password = fb.getPassword();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crawler","root","9897089099");
            PreparedStatement pst=con.prepareStatement("update users set users.password=? where users.user_id=?");
            pst.setString(1, PasswordGenerator.generate(password));
            pst.setString(2, user_id);
            int status=pst.executeUpdate();
            if(status>0){
                request.setAttribute("msgg1", "Password Changed Successfully.");
                SUCCESS = "success";
            }
            else{
                request.setAttribute("msgg", "Password Not Changed.");
                SUCCESS = "fail";
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return mapping.findForward(SUCCESS);
    }
}
