/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileSystemView;

/**
 *
 * @author Cj
 */
public class FolderHelper extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String fld = request.getParameter("fld");
            String path = request.getParameter("path");
            try{
                if(fld!=null){
                    out.write(getList(fld));
                }
            }catch(Exception e){}
            try{
                if(path!=null){
                    out.write(openFile(path));
                }
            }catch(Exception e){}
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    protected String getList(String fld){
        if(fld.equals("root")){
            return loadDrives();
        }
        else if(fld.isEmpty()){
            return "";
        }
        else{
            return loadSubFolders(fld);
        }
    }
    
    protected String loadDrives(){
        File[] paths;
        FileSystemView fsv = FileSystemView.getFileSystemView();
        int i=0;
        paths = File.listRoots();
        String result="";
        for(File fi:paths){
            result += fi.toString() + " -  " + fsv.getSystemDisplayName(fi) + "::";
        }
        return result;
    }
    
    protected String loadSubFolders(String fld){
        String result="";
        File dir = new File(fld);
        File[] paths = dir.listFiles();
        for(File file: paths){
            if(file.isDirectory()){
                result += file.getName() + "::";
            }
        }
        return result;
    }
    
    protected String openFile(String path) throws IOException{
        if(Desktop.isDesktopSupported()){
            Desktop desk = Desktop.getDesktop();
            desk.open(new File(path));
        }
        return "success";
    }
}
