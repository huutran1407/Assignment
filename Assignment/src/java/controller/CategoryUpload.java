/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.*;

/**
 *
 * @author VHC
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 5, 
  maxRequestSize = 1024 * 1024 * 5 * 5)
public class CategoryUpload extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CategoryUpload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryUpload at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String name = request.getParameter("CategoryName");
        Part filePart = request.getPart("img");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            String path = Paths.get(getServletContext().getRealPath("")).getParent().getParent().toString()
                    + File.separator + "web"
                    + File.separator + "Database"
                    + File.separator + "IMG";
            String StorePath = "Database"
                    + File.separator + "IMG"
                    + File.separator + filePart.getSubmittedFileName();
            
            String Mess = "";
            if (UploadedFile(filePart, path)) {
                CategoryDAO DAO = new CategoryDAO();
                String mess = DAO.insertCategory(name, StorePath);
                if (mess.equalsIgnoreCase("Success")) {
                    Mess = "Success insert Category into Database!!";
                } else {
                    Mess = "Fail to insert into database";
                }
                
                request.setAttribute("Mess", Mess);
                response.sendRedirect("View/Home.jsp?Content=CategoryList.jsp");
            }
        }

    }

    private boolean UploadedFile(Part part, String uploadPath) {
        boolean test = false;
        try {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            String fileName = part.getSubmittedFileName();
            File f = new File(uploadPath + File.separator + fileName);
            if (f.exists() && !f.isDirectory()) {
                fileName = fileName.substring(0, fileName.lastIndexOf("."))+"2"+fileName.substring(fileName.lastIndexOf("."));
            }
            part.write(uploadPath + File.separator + fileName);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
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
