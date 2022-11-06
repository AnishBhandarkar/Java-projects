/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.json.CDL;
import org.json.JSONArray;
import org.json.JSONTokener;

@MultipartConfig
public class JsonToCsvServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
//            out.println("<h1>JSON TO CSV</h1>");
            boolean done = false;
            Part part = request.getPart("file");
            String fileName = part.getSubmittedFileName();
            String path = request.getRealPath("/") + "files" + File.separator + fileName;
            InputStream is = part.getInputStream();
//            out.println("hi");
            boolean result = uploadFile(is, path);
            if(result){
                convertJsonToCsv(path);
                done = true;
            }
            if (done) { 
                out.println("Done");  
            } else {
                out.println("error");
            }
        }
    }

    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;

        try {
            byte[] byt = new byte[is.available()];
            is.read(byt);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(byt);
            fos.flush();
            fos.close();
            test = true;
        } catch (IOException ex) {
            Logger.getLogger(JsonToCsvServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        return test;
    }

    public static void convertJsonToCsv(String path) throws FileNotFoundException {
        File file = new File(path);

        InputStream inputStream = new FileInputStream(file);
        JSONArray jsonArray = new JSONArray(new JSONTokener(inputStream));
        try {
            Files.write(Path.of("C:\\Users\\User\\Desktop\\output.csv"), CDL.toString(jsonArray).getBytes(StandardCharsets.UTF_8));
        } catch (IOException e) {
            e.printStackTrace();
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
