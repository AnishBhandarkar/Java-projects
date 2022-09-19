
package com.servlets;

import com.entities.Register;
import com.helper.UserPicProcess;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig //To indicate class that multipart data is coming
public class ProfEditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            String uname = request.getParameter("user_name");
            String umail = request.getParameter("user_mail");
            String upass = request.getParameter("user_pass");
            //To get Image
            Part part = request.getPart("user_pic");
            //To get image name
            String imgName = part.getSubmittedFileName();
            
            //Get the user from session 
            HttpSession hs = request.getSession();
            Register user = (Register)hs.getAttribute("current_user");
            user.setName(uname);
            user.setEmail(umail);
            user.setPwd(upass);
            //Getting old profile pic to delete it from disk
            String oldPic = user.getProfile();
            user.setProfile(imgName);
            
            //Update in database
            Register reg = new Register();
            boolean res = reg.updateUser(user);
            if(res){               
                //Getting file path stored in UserPics
                String path = request.getRealPath("/")+"UserPics"+File.separator+user.getProfile();
                
                //Deleting previously stored pic
                String oldPicPath = request.getRealPath("/")+"UserPics"+File.separator+oldPic;
                if(!oldPicPath.equals("default.png")){
                    UserPicProcess.deleteFile(oldPicPath);
                }
                
                
                //Updating pic
                    if(UserPicProcess.saveFile(part.getInputStream(), path)){
                        out.println("Profile pic Updated");
                    }
                    else{
                        out.println("Pic Not Updated");
                    }
            }
            else{
                out.println("Not Updated");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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

}
