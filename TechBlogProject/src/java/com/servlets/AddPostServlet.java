package com.servlets;

import com.entities.Post;
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

@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
            int cid = Integer.parseInt(request.getParameter("cid"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String program = request.getParameter("program");
            Part part = request.getPart("image");

            //Getting current user id
            HttpSession hs = request.getSession();
            Register user = (Register) hs.getAttribute("current_user");
            int uid = user.getId();

            //Passing form data to Post class to store in db
            Post post = new Post(title, content, program, part.getSubmittedFileName(), cid, uid);
            if (post.savePost()) {
                //To save post pics in PstPics folder
                if (!part.getSubmittedFileName().equals("")) { //If pic is uploaded then only save it
                    String path = request.getRealPath("/") + "PostPics" + File.separator + part.getSubmittedFileName();
                    UserPicProcess.saveFile(part.getInputStream(), path);
                }

                out.println("Done");

            } else {
                out.println("Error");
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
