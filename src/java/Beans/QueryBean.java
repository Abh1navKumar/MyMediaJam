/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author Cj
 */
public class QueryBean extends org.apache.struts.action.ActionForm {
    
    private String query;
    private String target;
    private String stype;

    /**
     * @return the query
     */
    public String getQuery() {
        return query;
    }

    /**
     * @param query the query to set
     */
    public void setQuery(String query) {
        this.query = query;
    }

    /**
     * @return the target
     */
    public String getTarget() {
        return target;
    }

    /**
     * @param target the target to set
     */
    public void setTarget(String target) {
        this.target = target;
    }

    /**
     * @return the stype
     */
    public String getStype() {
        return stype;
    }

    /**
     * @param stype the stype to set
     */
    public void setStype(String stype) {
        this.stype = stype;
    }
    

}
