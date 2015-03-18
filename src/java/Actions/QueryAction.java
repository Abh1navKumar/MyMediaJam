/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Controller.dir;
import Beans.QueryBean;
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
public class QueryAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS = "success";
    private String query;
    private String target;
    private String stype;
    private String log="";
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
        String id = (String)session.getAttribute("user_id");
        if(id!=null){
            QueryBean qb =(QueryBean)form;
            query = qb.getQuery();
            target = qb.getTarget();
            stype = qb.getStype();
            dir play = new dir((String)session.getAttribute("user_id"));
            String result;
            if (query.length()<=3){
                stype = "adv_search";
            }
            if(!stype.contains("adv_")){
                if(target.equals("Music"))
                    result = play.search("Music",query);
                else if(target.equals("Videos"))
                    result = play.search("Movies",query);
                else{
                    result = play.search("Image",query);
                }
            }else{
                if(target.equals("Music"))
                    result = play.search_advanced("Music",query);
                else if(target.equals("Videos"))
                    result = play.search_advanced("Movies",query);
                else{
                    result = play.search_advanced("Image",query);
                }
            }
            request.setAttribute("result",result);
            out.println(id);
        }else{
            SUCCESS = "logout";
            request.setAttribute("msgg", "Please Login First");
        }
        out.println(SUCCESS);
        return mapping.findForward(SUCCESS);
    }
}
