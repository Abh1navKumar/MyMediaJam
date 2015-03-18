/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;
import Controller.PasswordGenerator;
import Beans.RegisterBean;
import Controller.PasswordGenerator;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
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
public class RegisterAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String fname;
    private String lname;
    private String sec_ques;
    private String sec_ans;
    private String email;
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
        HttpSession session = request.getSession();
        RegisterBean rb = (RegisterBean)form;
        PrintWriter out = response.getWriter();
        fname = rb.getFname();
        lname = rb.getLname();
        sec_ques = rb.getSec_ques();
        sec_ans = rb.getSec_ans();
        email = rb.getEmail();
        String check_email;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crawler","root","9897089099");
            PreparedStatement pst=con.prepareStatement("select users.email from users where email=?");
            pst.setString(1,email);
            ResultSet rs = pst.executeQuery();
            if(rs.first()){
                request.setAttribute("msgg","Email Already Exists!!!!!");
                SUCCESS = "fail";
            }
            else{   
                String user_id="";
                String password="";
                int n;
                Random random = new Random();
                for(int i=0;i<4;i++){
                    n = random.nextInt(10);
                    user_id +=n; 
                }
                for(int i=0;i<5;i++){
                    n = random.nextInt(10);
                    password +=n; 
                }
                password = "user@"+fname+"#"+password;
                n=0;
                user_id = fname.toLowerCase()+"#"+user_id;
                PreparedStatement pst1=con.prepareStatement("insert into users values(?,?,?,?,?,?)");
                pst1.setString(1, user_id);
                pst1.setString(2, PasswordGenerator.generate(password));
                pst1.setString(3, fname+lname);
                pst1.setString(4, email);
                pst1.setString(5, sec_ques);
                pst1.setString(6, sec_ans);
                out.println(pst1);
                int status = pst1.executeUpdate();
                out.println("asfas");
                final String WRITE_OBJECT_SQL = "insert into data_crawl(UserId) values (?)";
                PreparedStatement pst2 = con.prepareStatement(WRITE_OBJECT_SQL);
                pst2.setString(1, user_id);
                int status1 = pst2.executeUpdate();
                if(status>0 && status1>0){
                    session.setAttribute("user_id", user_id);
                    request.setAttribute("password",password);
                    SUCCESS="success"; 
                }else{
                    SUCCESS="fail"; 
                }
            }
        }catch(Exception e){
	e.printStackTrace();
	}
        
        return mapping.findForward(SUCCESS);
    }
}
